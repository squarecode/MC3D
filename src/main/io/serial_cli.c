/*
 * This file is part of Cleanflight.
 *
 * Cleanflight is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Cleanflight is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Cleanflight.  If not, see <http://www.gnu.org/licenses/>.
 */

#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>
#include <math.h>
#include <ctype.h>

#include "platform.h"
#include "scheduler.h"
#include "version.h"

#include "build_config.h"

#include "common/axis.h"
#include "common/maths.h"
#include "common/color.h"
#include "common/typeconversion.h"

#include "drivers/system.h"

#include "drivers/sensor.h"
#include "drivers/accgyro.h"
#include "drivers/compass.h"

#include "drivers/serial.h"
#include "drivers/bus_i2c.h"
#include "drivers/gpio.h"
#include "drivers/timer.h"
#include "drivers/pwm_rx.h"
#include "drivers/sdcard.h"
#include "drivers/gyro_sync.h"

#include "drivers/buf_writer.h"

#include "io/escservo.h"
#include "io/gps.h"
#include "io/gimbal.h"
#include "io/rc_controls.h"
#include "io/serial.h"
#include "io/ledstrip.h"
#include "io/flashfs.h"
#include "io/beeper.h"
#include "io/asyncfatfs/asyncfatfs.h"

#include "rx/rx.h"
#include "rx/spektrum.h"

#include "sensors/battery.h"
#include "sensors/boardalignment.h"
#include "sensors/sensors.h"
#include "sensors/acceleration.h"
#include "sensors/gyro.h"
#include "sensors/compass.h"
#include "sensors/barometer.h"

#include "flight/pid.h"
#include "flight/imu.h"
#include "flight/mixer.h"
#include "flight/navigation.h"
#include "flight/failsafe.h"

#include "telemetry/telemetry.h"
#include "telemetry/frsky.h"

#include "config/runtime_config.h"
#include "config/config.h"
#include "config/config_profile.h"
#include "config/config_master.h"

#include "common/printf.h"

#include "serial_cli.h"

// FIXME remove this for targets that don't need a CLI.  Perhaps use a no-op macro when USE_CLI is not enabled
// signal that we're in cli mode
uint8_t cliMode = 0;

#ifdef USE_CLI

extern uint16_t cycleTime; // FIXME dependency on mw.c

void gpsEnablePassthrough(serialPort_t *gpsPassthroughPort);

static serialPort_t *cliPort;
static bufWriter_t *cliWriter;
static uint8_t cliWriteBuffer[sizeof(*cliWriter) + 16];

static void cliAux(char *cmdline);
static void cliRxFail(char *cmdline);
static void cliAdjustmentRange(char *cmdline);
static void cliMotorMix(char *cmdline);
static void cliDefaults(char *cmdline);
static void cliDump(char *cmdLine);
void cliDumpProfile(uint8_t profileIndex);
void cliDumpRateProfile(uint8_t rateProfileIndex) ;
static void cliExit(char *cmdline);
static void cliFeature(char *cmdline);
static void cliMotor(char *cmdline);
static void cliPlaySound(char *cmdline);
static void cliProfile(char *cmdline);
static void cliRateProfile(char *cmdline);
static void cliReboot(void);
static void cliSave(char *cmdline);
static void cliSerial(char *cmdline);
#ifndef SKIP_SERIAL_PASSTHROUGH
static void cliSerialPassthrough(char *cmdline);
#endif

#ifdef USE_SERVOS
static void cliServo(char *cmdline);
static void cliServoMix(char *cmdline);
#endif

static void cliSet(char *cmdline);
static void cliGet(char *cmdline);
static void cliStatus(char *cmdline);
#ifndef SKIP_TASK_STATISTICS
static void cliTasks(char *cmdline);
#endif
static void cliVersion(char *cmdline);
static void cliRxRange(char *cmdline);

#ifdef GPS
static void cliGpsPassthrough(char *cmdline);
#endif

static void cliHelp(char *cmdline);
static void cliMap(char *cmdline);

#ifdef LED_STRIP
static void cliLed(char *cmdline);
static void cliColor(char *cmdline);
#endif

#ifndef USE_QUAD_MIXER_ONLY
static void cliMixer(char *cmdline);
#endif

#ifdef USE_FLASHFS
static void cliFlashInfo(char *cmdline);
static void cliFlashErase(char *cmdline);
#ifdef USE_FLASH_TOOLS
static void cliFlashWrite(char *cmdline);
static void cliFlashRead(char *cmdline);
#endif
#endif

#ifdef USE_SDCARD
static void cliSdInfo(char *cmdline);
#endif

#ifdef BEEPER
static void cliBeeper(char *cmdline);
#endif

// buffer
static char cliBuffer[48];
static uint32_t bufferIndex = 0;

#ifndef USE_QUAD_MIXER_ONLY
// sync this with mixerMode_e
static const char * const mixerNames[] = {
    "TRI", "QUADP", "QUADX", "BI",
    "GIMBAL", "Y6", "HEX6",
    "FLYING_WING", "Y4", "HEX6X", "OCTOX8", "OCTOFLATP", "OCTOFLATX",
    "AIRPLANE", "HELI_120_CCPM", "HELI_90_DEG", "VTAIL4",
    "HEX6H", "PPM_TO_SERVO", "DUALCOPTER", "SINGLECOPTER",
    "ATAIL4", "CUSTOM", "CUSTOMAIRPLANE", "CUSTOMTRI", "QUADX1234", NULL
};
#endif

// sync this with features_e
static const char * const featureNames[] = {
    "RX_PPM", "VBAT", "INFLIGHT_ACC_CAL", "RX_SERIAL", "MOTOR_STOP",
    "SERVO_TILT", "SOFTSERIAL", "GPS", "FAILSAFE",
    "SONAR", "TELEMETRY", "CURRENT_METER", "3D", "RX_PARALLEL_PWM",
    "RX_MSP", "RSSI_ADC", "LED_STRIP", "DISPLAY", "ONESHOT125",
    "BLACKBOX", "CHANNEL_FORWARDING", "TRANSPONDER", NULL
};

// sync this with rxFailsafeChannelMode_e
static const char rxFailsafeModeCharacters[] = "ahs";

static const rxFailsafeChannelMode_e rxFailsafeModesTable[RX_FAILSAFE_TYPE_COUNT][RX_FAILSAFE_MODE_COUNT] = {
    { RX_FAILSAFE_MODE_AUTO, RX_FAILSAFE_MODE_HOLD, RX_FAILSAFE_MODE_INVALID },
    { RX_FAILSAFE_MODE_INVALID, RX_FAILSAFE_MODE_HOLD, RX_FAILSAFE_MODE_SET }
};

#ifndef CJMCU
// sync this with sensors_e
static const char * const sensorTypeNames[] = {
    "GYRO", "ACC", "BARO", "MAG", "SONAR", "GPS", "GPS+MAG", NULL
};

#define SENSOR_NAMES_MASK (SENSOR_GYRO | SENSOR_ACC | SENSOR_BARO | SENSOR_MAG)

static const char * const sensorHardwareNames[4][11] = {
    { "", "None", "MPU6050", "L3G4200D", "MPU3050", "L3GD20", "MPU6000", "MPU6500", "FAKE", NULL },
    { "", "None", "ADXL345", "MPU6050", "MMA845x", "BMA280", "LSM303DLHC", "MPU6000", "MPU6500", "FAKE", NULL },
    { "", "None", "BMP085", "MS5611", "BMP280", NULL },
    { "", "None", "HMC5883", "AK8975", "AK8963", NULL }
};
#endif

typedef struct {
    const char *name;
#ifndef SKIP_CLI_COMMAND_HELP
    const char *description;
    const char *args;
#endif
    void (*func)(char *cmdline);
} clicmd_t;

#ifndef SKIP_CLI_COMMAND_HELP
#define CLI_COMMAND_DEF(name, description, args, method) \
{ \
    name , \
    description , \
    args , \
    method \
}
#else
#define CLI_COMMAND_DEF(name, description, args, method) \
{ \
    name, \
    method \
}
#endif

// should be sorted a..z for bsearch()
const clicmd_t cmdTable[] = {
    CLI_COMMAND_DEF("adjrange", "configure adjustment ranges", NULL, cliAdjustmentRange),
    CLI_COMMAND_DEF("aux", "configure modes", NULL, cliAux),
#ifdef LED_STRIP
    CLI_COMMAND_DEF("color", "configure colors", NULL, cliColor),
#endif
    CLI_COMMAND_DEF("defaults", "reset to defaults and reboot", NULL, cliDefaults),
    CLI_COMMAND_DEF("dump", "dump configuration",
        "[master|profile]", cliDump),
    CLI_COMMAND_DEF("exit", NULL, NULL, cliExit),
    CLI_COMMAND_DEF("feature", "configure features",
        "list\r\n"
        "\t<+|->[name]", cliFeature),
#ifdef USE_FLASHFS
    CLI_COMMAND_DEF("flash_erase", "erase flash chip", NULL, cliFlashErase),
    CLI_COMMAND_DEF("flash_info", "show flash chip info", NULL, cliFlashInfo),
#ifdef USE_FLASH_TOOLS
    CLI_COMMAND_DEF("flash_read", NULL, "<length> <address>", cliFlashRead),
    CLI_COMMAND_DEF("flash_write", NULL, "<address> <message>", cliFlashWrite),
#endif
#endif
    CLI_COMMAND_DEF("get", "get variable value",
            "[name]", cliGet),
#ifdef GPS
    CLI_COMMAND_DEF("gpspassthrough", "passthrough gps to serial", NULL, cliGpsPassthrough),
#endif
    CLI_COMMAND_DEF("help", NULL, NULL, cliHelp),
#ifdef LED_STRIP
    CLI_COMMAND_DEF("led", "configure leds", NULL, cliLed),
#endif
    CLI_COMMAND_DEF("map", "configure rc channel order",
        "[<map>]", cliMap),
#ifndef USE_QUAD_MIXER_ONLY
    CLI_COMMAND_DEF("mixer", "configure mixer",
        "list\r\n"
        "\t<name>", cliMixer),
#endif
    CLI_COMMAND_DEF("mmix", "custom motor mixer", NULL, cliMotorMix),
    CLI_COMMAND_DEF("motor",  "get/set motor",
       "<index> [<value>]", cliMotor),
    CLI_COMMAND_DEF("play_sound", NULL,
        "[<index>]\r\n", cliPlaySound),
    CLI_COMMAND_DEF("profile", "change profile",
        "[<index>]", cliProfile),
	CLI_COMMAND_DEF("rateprofile", "change rate profile", "[<index>]", cliRateProfile),
    CLI_COMMAND_DEF("rxrange", "configure rx channel ranges", NULL, cliRxRange),
    CLI_COMMAND_DEF("rxfail", "show/set rx failsafe settings", NULL, cliRxFail),
    CLI_COMMAND_DEF("save", "save and reboot", NULL, cliSave),
    CLI_COMMAND_DEF("serial", "configure serial ports", NULL, cliSerial),
#ifndef SKIP_SERIAL_PASSTHROUGH
    CLI_COMMAND_DEF("serialpassthrough", "passthrough serial data to port",
                    "<id> [baud] [mode] : passthrough to serial",
                    cliSerialPassthrough),
#endif
#ifdef USE_SERVOS
    CLI_COMMAND_DEF("servo", "configure servos", NULL, cliServo),
#endif
    CLI_COMMAND_DEF("set", "change setting",
        "[<name>=<value>]", cliSet),
#ifdef USE_SERVOS
    CLI_COMMAND_DEF("smix", "servo mixer",
        "<rule> <servo> <source> <rate> <speed> <min> <max> <box>\r\n"
        "\treset\r\n"
        "\tload <mixer>\r\n"
        "\treverse <servo> <source> r|n", cliServoMix),
#endif
#ifdef USE_SDCARD
    CLI_COMMAND_DEF("sd_info", "sdcard info", NULL, cliSdInfo),
#endif
    CLI_COMMAND_DEF("status", "show status", NULL, cliStatus),
#ifndef SKIP_TASK_STATISTICS
    CLI_COMMAND_DEF("tasks", "show task stats", NULL, cliTasks),
#endif
    CLI_COMMAND_DEF("version", "show version", NULL, cliVersion),
#ifdef BEEPER
    CLI_COMMAND_DEF("beeper", "turn on/off beeper", "list\r\n"
            "\t<+|->[name]", cliBeeper),
#endif
};
#define CMD_COUNT (sizeof(cmdTable) / sizeof(clicmd_t))

static const char * const lookupTableOffOn[] = {
    "OFF", "ON"
};

static const char * const lookupTableUnit[] = {
    "IMPERIAL", "METRIC"
};

static const char * const lookupTableAlignment[] = {
    "DEFAULT",
    "CW0",
    "CW90",
    "CW180",
    "CW270",
    "CW0FLIP",
    "CW90FLIP",
    "CW180FLIP",
    "CW270FLIP"
};

#ifdef GPS
static const char * const lookupTableGPSProvider[] = {
    "NMEA", "UBLOX"
};

static const char * const lookupTableGPSSBASMode[] = {
    "AUTO", "EGNOS", "WAAS", "MSAS", "GAGAN"
};
#endif

static const char * const lookupTableCurrentSensor[] = {
    "NONE", "ADC", "VIRTUAL"
};

static const char * const lookupTableGimbalMode[] = {
    "NORMAL", "MIXTILT"
};

static const char * const lookupTableBlackboxDevice[] = {
    "SERIAL", "SPIFLASH", "SDCARD"
};


static const char * const lookupTablePidController[] = {
    "UNUSED", "MWREWRITE", "LUX"
};

static const char * const lookupTableSerialRX[] = {
    "SPEK1024",
    "SPEK2048",
    "SBUS",
    "SUMD",
    "SUMH",
    "XB-B",
    "XB-B-RJ01",
    "IBUS",
    "JETIEXBUS"
};

static const char * const lookupTableGyroLpf[] = {
    "OFF",
    "188HZ",
    "98HZ",
    "42HZ",
    "20HZ",
    "10HZ",
    "5HZ",
    "EXPERIMENTAL"
};

static const char * const lookupTableAccHardware[] = {
	"AUTO",
	"NONE",
	"ADXL345",
	"MPU6050",
	"MMA8452",
	"BMA280",
	"LSM303DLHC",
	"MPU6000",
	"MPU6500",
	"FAKE"
};

static const char * const lookupTableBaroHardware[] = {
	"AUTO",
    "NONE",
    "BMP085",
    "MS5611",
    "BMP280"
};

static const char * const lookupTableMagHardware[] = {
    "AUTO",
    "NONE",
    "HMC5883",
    "AK8975",
    "AK8963"
};

static const char * const lookupTableDebug[] = {
    "NONE",
    "CYCLETIME",
    "BATTERY",
    "GYRO",
    "ACCELEROMETER",
    "MIXER",
    "AIRMODE"
};

static const char * const lookupTableSuperExpoYaw[] = {
    "OFF", "ON", "ALWAYS"
};

typedef struct lookupTableEntry_s {
    const char * const *values;
    const uint8_t valueCount;
} lookupTableEntry_t;

typedef enum {
    TABLE_OFF_ON = 0,
    TABLE_UNIT,
    TABLE_ALIGNMENT,
#ifdef GPS
    TABLE_GPS_PROVIDER,
    TABLE_GPS_SBAS_MODE,
#endif
#ifdef BLACKBOX
    TABLE_BLACKBOX_DEVICE,  
#endif
    TABLE_CURRENT_SENSOR,
    TABLE_GIMBAL_MODE,
    TABLE_PID_CONTROLLER,
    TABLE_SERIAL_RX,
    TABLE_GYRO_LPF,
    TABLE_ACC_HARDWARE,
    TABLE_BARO_HARDWARE,
    TABLE_MAG_HARDWARE,
	TABLE_DEBUG,
    TABLE_SUPEREXPO_YAW,
} lookupTableIndex_e;

static const lookupTableEntry_t lookupTables[] = {
    { lookupTableOffOn, sizeof(lookupTableOffOn) / sizeof(char *) },
    { lookupTableUnit, sizeof(lookupTableUnit) / sizeof(char *) },
    { lookupTableAlignment, sizeof(lookupTableAlignment) / sizeof(char *) },
#ifdef GPS
    { lookupTableGPSProvider, sizeof(lookupTableGPSProvider) / sizeof(char *) },
    { lookupTableGPSSBASMode, sizeof(lookupTableGPSSBASMode) / sizeof(char *) },
#endif
#ifdef BLACKBOX
    { lookupTableBlackboxDevice, sizeof(lookupTableBlackboxDevice) / sizeof(char *) },
#endif
    { lookupTableCurrentSensor, sizeof(lookupTableCurrentSensor) / sizeof(char *) },
    { lookupTableGimbalMode, sizeof(lookupTableGimbalMode) / sizeof(char *) },
    { lookupTablePidController, sizeof(lookupTablePidController) / sizeof(char *) },
    { lookupTableSerialRX, sizeof(lookupTableSerialRX) / sizeof(char *) },
    { lookupTableGyroLpf, sizeof(lookupTableGyroLpf) / sizeof(char *) },
    { lookupTableAccHardware, sizeof(lookupTableAccHardware) / sizeof(char *) },
    { lookupTableBaroHardware, sizeof(lookupTableBaroHardware) / sizeof(char *) },
    { lookupTableMagHardware, sizeof(lookupTableMagHardware) / sizeof(char *) },
    { lookupTableDebug, sizeof(lookupTableDebug) / sizeof(char *) },
    { lookupTableSuperExpoYaw, sizeof(lookupTableSuperExpoYaw) / sizeof(char *) }
};

#define VALUE_TYPE_OFFSET 0
#define VALUE_SECTION_OFFSET 4
#define VALUE_MODE_OFFSET 6

typedef enum {
    // value type
    VAR_UINT8 = (0 << VALUE_TYPE_OFFSET),
    VAR_INT8 = (1 << VALUE_TYPE_OFFSET),
    VAR_UINT16 = (2 << VALUE_TYPE_OFFSET),
    VAR_INT16 = (3 << VALUE_TYPE_OFFSET),
    VAR_UINT32 = (4 << VALUE_TYPE_OFFSET),
    VAR_FLOAT = (5 << VALUE_TYPE_OFFSET),

    // value section
    MASTER_VALUE = (0 << VALUE_SECTION_OFFSET),
    PROFILE_VALUE = (1 << VALUE_SECTION_OFFSET),
	PROFILE_RATE_VALUE = (2 << VALUE_SECTION_OFFSET),
    // value mode
    MODE_DIRECT = (0 << VALUE_MODE_OFFSET),
    MODE_LOOKUP = (1 << VALUE_MODE_OFFSET)
} cliValueFlag_e;

#define VALUE_TYPE_MASK (0x0F)
#define VALUE_SECTION_MASK (0x30)
#define VALUE_MODE_MASK (0xC0)

typedef struct cliMinMaxConfig_s {
    const int32_t min;
    const int32_t max;
} cliMinMaxConfig_t;

typedef struct cliLookupTableConfig_s {
    const lookupTableIndex_e tableIndex;
} cliLookupTableConfig_t;

typedef union {
    cliLookupTableConfig_t lookup;
    cliMinMaxConfig_t minmax;

} cliValueConfig_t;

typedef struct {
    const char *name;
    const uint8_t type; // see cliValueFlag_e
    void *ptr;
    const cliValueConfig_t config;
} clivalue_t;

const clivalue_t valueTable[] = {
//    { "emf_avoidance",              VAR_UINT8  | MASTER_VALUE | MODE_LOOKUP,  &masterConfig.emf_avoidance, .config.lookup = { TABLE_OFF_ON } },

    { "mid_rc",                     VAR_UINT16 | MASTER_VALUE,  &masterConfig.rxConfig.midrc, .config.minmax = { 1200,  1700 } },
    { "min_check",                  VAR_UINT16 | MASTER_VALUE,  &masterConfig.rxConfig.mincheck, .config.minmax = { PWM_RANGE_ZERO,  PWM_RANGE_MAX } },
    { "max_check",                  VAR_UINT16 | MASTER_VALUE,  &masterConfig.rxConfig.maxcheck, .config.minmax = { PWM_RANGE_ZERO,  PWM_RANGE_MAX } },
    { "rssi_channel",               VAR_INT8   | MASTER_VALUE,  &masterConfig.rxConfig.rssi_channel, .config.minmax = { 0,  MAX_SUPPORTED_RC_CHANNEL_COUNT } },
    { "rssi_scale",                 VAR_UINT8  | MASTER_VALUE,  &masterConfig.rxConfig.rssi_scale, .config.minmax = { RSSI_SCALE_MIN,  RSSI_SCALE_MAX } },
    { "rssi_ppm_invert",            VAR_INT8   | MASTER_VALUE | MODE_LOOKUP,  &masterConfig.rxConfig.rssi_ppm_invert, .config.lookup = { TABLE_OFF_ON } },
    { "input_filtering_mode",       VAR_INT8   | MASTER_VALUE | MODE_LOOKUP,  &masterConfig.inputFilteringMode, .config.lookup = { TABLE_OFF_ON } },
    { "rc_smoothing",               VAR_INT8   | MASTER_VALUE | MODE_LOOKUP,  &masterConfig.rxConfig.rcSmoothing, .config.lookup = { TABLE_OFF_ON } },
    { "roll_yaw_cam_mix_degrees",   VAR_UINT8  | MASTER_VALUE,  &masterConfig.rxConfig.fpvCamAngleDegrees, .config.minmax = { 0,  50 } },
    { "max_aux_channels",           VAR_UINT8  | MASTER_VALUE,  &masterConfig.rxConfig.max_aux_channel, .config.minmax = { 0,  13 } },
    { "debug_mode",                 VAR_UINT8  | MASTER_VALUE | MODE_LOOKUP,  &masterConfig.debug_mode, .config.lookup = { TABLE_DEBUG } },

    { "min_throttle",               VAR_UINT16 | MASTER_VALUE,  &masterConfig.escAndServoConfig.minthrottle, .config.minmax = { PWM_RANGE_ZERO,  PWM_RANGE_MAX } },
    { "max_throttle",               VAR_UINT16 | MASTER_VALUE,  &masterConfig.escAndServoConfig.maxthrottle, .config.minmax = { PWM_RANGE_ZERO,  PWM_RANGE_MAX } },
    { "min_command",                VAR_UINT16 | MASTER_VALUE,  &masterConfig.escAndServoConfig.mincommand, .config.minmax = { PWM_RANGE_ZERO,  PWM_RANGE_MAX } },
    { "servo_center_pulse",         VAR_UINT16 | MASTER_VALUE,  &masterConfig.escAndServoConfig.servoCenterPulse, .config.minmax = { PWM_RANGE_ZERO,  PWM_RANGE_MAX } },

    { "3d_deadband_low",            VAR_UINT16 | MASTER_VALUE,  &masterConfig.flight3DConfig.deadband3d_low, .config.minmax = { PWM_RANGE_ZERO,  PWM_RANGE_MAX } }, // FIXME upper limit should match code in the mixer, 1500 currently
    { "3d_deadband_high",           VAR_UINT16 | MASTER_VALUE,  &masterConfig.flight3DConfig.deadband3d_high, .config.minmax = { PWM_RANGE_ZERO,  PWM_RANGE_MAX } }, // FIXME lower limit should match code in the mixer, 1500 currently,
    { "3d_neutral",                 VAR_UINT16 | MASTER_VALUE,  &masterConfig.flight3DConfig.neutral3d, .config.minmax = { PWM_RANGE_ZERO,  PWM_RANGE_MAX } },
    { "3d_deadband_throttle",       VAR_UINT16 | MASTER_VALUE,  &masterConfig.flight3DConfig.deadband3d_throttle, .config.minmax = { PWM_RANGE_ZERO,  PWM_RANGE_MAX } },

    { "use_oneshot42",              VAR_UINT8  | MASTER_VALUE | MODE_LOOKUP,  &masterConfig.use_oneshot42, .config.lookup = { TABLE_OFF_ON } },
    { "use_multishot",              VAR_UINT8  | MASTER_VALUE | MODE_LOOKUP,  &masterConfig.use_multiShot, .config.lookup = { TABLE_OFF_ON } },
#ifdef CC3D
    { "enable_buzzer_p6",           VAR_UINT8  | MASTER_VALUE | MODE_LOOKUP,  &masterConfig.use_buzzer_p6, .config.lookup = { TABLE_OFF_ON } },
#endif
    { "motor_pwm_rate",             VAR_UINT16 | MASTER_VALUE,  &masterConfig.motor_pwm_rate, .config.minmax = { 300,  32000 } },
    { "servo_pwm_rate",             VAR_UINT16 | MASTER_VALUE,  &masterConfig.servo_pwm_rate, .config.minmax = { 50,  498 } },

    { "disarm_kill_switch",         VAR_UINT8  | MASTER_VALUE | MODE_LOOKUP,  &masterConfig.disarm_kill_switch, .config.lookup = { TABLE_OFF_ON } },
    { "gyro_cal_on_first_arm",      VAR_UINT8  | MASTER_VALUE | MODE_LOOKUP,  &masterConfig.gyro_cal_on_first_arm, .config.lookup = { TABLE_OFF_ON } },
    { "auto_disarm_delay",          VAR_UINT8  | MASTER_VALUE,  &masterConfig.auto_disarm_delay, .config.minmax = { 0,  60 } },
    { "small_angle",                VAR_UINT8  | MASTER_VALUE,  &masterConfig.small_angle, .config.minmax = { 0,  180 } },

    { "fixedwing_althold_dir",      VAR_INT8   | MASTER_VALUE,  &masterConfig.airplaneConfig.fixedwing_althold_dir, .config.minmax = { -1,  1 } },

    { "reboot_character",           VAR_UINT8  | MASTER_VALUE,  &masterConfig.serialConfig.reboot_character, .config.minmax = { 48,  126 } },

#ifdef GPS
    { "gps_provider",               VAR_UINT8  | MASTER_VALUE | MODE_LOOKUP,  &masterConfig.gpsConfig.provider, .config.lookup = { TABLE_GPS_PROVIDER } },
    { "gps_sbas_mode",              VAR_UINT8  | MASTER_VALUE | MODE_LOOKUP,  &masterConfig.gpsConfig.sbasMode, .config.lookup = { TABLE_GPS_SBAS_MODE } },
    { "gps_auto_config",            VAR_UINT8  | MASTER_VALUE | MODE_LOOKUP,  &masterConfig.gpsConfig.autoConfig, .config.lookup = { TABLE_OFF_ON } },
    { "gps_auto_baud",              VAR_UINT8  | MASTER_VALUE | MODE_LOOKUP,  &masterConfig.gpsConfig.autoBaud, .config.lookup = { TABLE_OFF_ON } },

    { "gps_pos_p",                  VAR_UINT8  | PROFILE_VALUE, &masterConfig.profile[0].pidProfile.P8[PIDPOS], .config.minmax = { 0,  200 } },
    { "gps_pos_i",                  VAR_UINT8  | PROFILE_VALUE, &masterConfig.profile[0].pidProfile.I8[PIDPOS], .config.minmax = { 0,  200 } },
    { "gps_pos_d",                  VAR_UINT8  | PROFILE_VALUE, &masterConfig.profile[0].pidProfile.D8[PIDPOS], .config.minmax = { 0,  200 } },
    { "gps_posr_p",                 VAR_UINT8  | PROFILE_VALUE, &masterConfig.profile[0].pidProfile.P8[PIDPOSR], .config.minmax = { 0,  200 } },
    { "gps_posr_i",                 VAR_UINT8  | PROFILE_VALUE, &masterConfig.profile[0].pidProfile.I8[PIDPOSR], .config.minmax = { 0,  200 } },
    { "gps_posr_d",                 VAR_UINT8  | PROFILE_VALUE, &masterConfig.profile[0].pidProfile.D8[PIDPOSR], .config.minmax = { 0,  200 } },
    { "gps_nav_p",                  VAR_UINT8  | PROFILE_VALUE, &masterConfig.profile[0].pidProfile.P8[PIDNAVR], .config.minmax = { 0,  200 } },
    { "gps_nav_i",                  VAR_UINT8  | PROFILE_VALUE, &masterConfig.profile[0].pidProfile.I8[PIDNAVR], .config.minmax = { 0,  200 } },
    { "gps_nav_d",                  VAR_UINT8  | PROFILE_VALUE, &masterConfig.profile[0].pidProfile.D8[PIDNAVR], .config.minmax = { 0,  200 } },
    { "gps_wp_radius",              VAR_UINT16 | MASTER_VALUE, &masterConfig.gpsProfile.gps_wp_radius, .config.minmax = { 0,  2000 } },
    { "nav_controls_heading",       VAR_UINT8  | MASTER_VALUE | MODE_LOOKUP, &masterConfig.gpsProfile.nav_controls_heading, .config.lookup = { TABLE_OFF_ON } },
    { "nav_speed_min",              VAR_UINT16 | MASTER_VALUE, &masterConfig.gpsProfile.nav_speed_min, .config.minmax = { 10,  2000 } },
    { "nav_speed_max",              VAR_UINT16 | MASTER_VALUE, &masterConfig.gpsProfile.nav_speed_max, .config.minmax = { 10,  2000 } },
    { "nav_slew_rate",              VAR_UINT8  | MASTER_VALUE, &masterConfig.gpsProfile.nav_slew_rate, .config.minmax = { 0,  100 } },
#endif
#ifdef GTUNE
    { "gtune_loP_rll",              VAR_UINT8  | PROFILE_VALUE,  &masterConfig.profile[0].pidProfile.gtune_lolimP[FD_ROLL], .config.minmax = { 10,  200 } },
    { "gtune_loP_ptch",             VAR_UINT8  | PROFILE_VALUE,  &masterConfig.profile[0].pidProfile.gtune_lolimP[FD_PITCH], .config.minmax = { 10,  200 } },
    { "gtune_loP_yw",               VAR_UINT8  | PROFILE_VALUE,  &masterConfig.profile[0].pidProfile.gtune_lolimP[FD_YAW], .config.minmax = { 10,  200 } },
    { "gtune_hiP_rll",              VAR_UINT8  | PROFILE_VALUE,  &masterConfig.profile[0].pidProfile.gtune_hilimP[FD_ROLL], .config.minmax = { 0,  200 } },
    { "gtune_hiP_ptch",             VAR_UINT8  | PROFILE_VALUE,  &masterConfig.profile[0].pidProfile.gtune_hilimP[FD_PITCH], .config.minmax = { 0,  200 } },
    { "gtune_hiP_yw",               VAR_UINT8  | PROFILE_VALUE,  &masterConfig.profile[0].pidProfile.gtune_hilimP[FD_YAW], .config.minmax = { 0,  200 } },
    { "gtune_pwr",                  VAR_UINT8  | PROFILE_VALUE,  &masterConfig.profile[0].pidProfile.gtune_pwr, .config.minmax = { 0,  10 } },
    { "gtune_settle_time",          VAR_UINT16 | PROFILE_VALUE,  &masterConfig.profile[0].pidProfile.gtune_settle_time, .config.minmax = { 200,  1000 } },
    { "gtune_average_cycles",       VAR_UINT8  | PROFILE_VALUE,  &masterConfig.profile[0].pidProfile.gtune_average_cycles, .config.minmax = { 8,  128 } },
#endif

    { "serialrx_provider",          VAR_UINT8  | MASTER_VALUE | MODE_LOOKUP,  &masterConfig.rxConfig.serialrx_provider, .config.lookup = { TABLE_SERIAL_RX } },
    { "sbus_inversion",             VAR_UINT8  | MASTER_VALUE | MODE_LOOKUP,  &masterConfig.rxConfig.sbus_inversion, .config.lookup = { TABLE_OFF_ON } },
    { "spektrum_sat_bind",          VAR_UINT8  | MASTER_VALUE,  &masterConfig.rxConfig.spektrum_sat_bind, .config.minmax = { SPEKTRUM_SAT_BIND_DISABLED,  SPEKTRUM_SAT_BIND_MAX} },
    { "spektrum_sat_bind_autoreset",VAR_UINT8  | MASTER_VALUE,  &masterConfig.rxConfig.spektrum_sat_bind_autoreset, .config.minmax = { 0,  1} },

    { "telemetry_switch",           VAR_UINT8  | MASTER_VALUE | MODE_LOOKUP,  &masterConfig.telemetryConfig.telemetry_switch, .config.lookup = { TABLE_OFF_ON } },
    { "telemetry_inversion",        VAR_UINT8  | MASTER_VALUE | MODE_LOOKUP,  &masterConfig.telemetryConfig.telemetry_inversion, .config.lookup = { TABLE_OFF_ON } },
    { "frsky_default_lattitude",    VAR_FLOAT  | MASTER_VALUE,  &masterConfig.telemetryConfig.gpsNoFixLatitude, .config.minmax = { -90.0,  90.0 } },
    { "frsky_default_longitude",    VAR_FLOAT  | MASTER_VALUE,  &masterConfig.telemetryConfig.gpsNoFixLongitude, .config.minmax = { -180.0,  180.0 } },
    { "frsky_coordinates_format",   VAR_UINT8  | MASTER_VALUE,  &masterConfig.telemetryConfig.frsky_coordinate_format, .config.minmax = { 0,  FRSKY_FORMAT_NMEA } },
    { "frsky_unit",                 VAR_UINT8  | MASTER_VALUE | MODE_LOOKUP,  &masterConfig.telemetryConfig.frsky_unit, .config.lookup = { TABLE_UNIT } },
    { "frsky_vfas_precision",       VAR_UINT8  | MASTER_VALUE,  &masterConfig.telemetryConfig.frsky_vfas_precision, .config.minmax = { FRSKY_VFAS_PRECISION_LOW,  FRSKY_VFAS_PRECISION_HIGH } },
    { "frsky_vfas_cell_voltage",    VAR_UINT8  | MASTER_VALUE | MODE_LOOKUP,  &masterConfig.telemetryConfig.frsky_vfas_cell_voltage, .config.lookup = { TABLE_OFF_ON } },
    { "hott_alarm_sound_interval",  VAR_UINT8  | MASTER_VALUE,  &masterConfig.telemetryConfig.hottAlarmSoundInterval, .config.minmax = { 0,  120 } },

    { "battery_capacity",           VAR_UINT16 | MASTER_VALUE,  &masterConfig.batteryConfig.batteryCapacity, .config.minmax = { 0,  20000 } },
    { "vbat_scale",                 VAR_UINT8  | MASTER_VALUE,  &masterConfig.batteryConfig.vbatscale, .config.minmax = { VBAT_SCALE_MIN,  VBAT_SCALE_MAX } },
    { "vbat_max_cell_voltage",      VAR_UINT8  | MASTER_VALUE,  &masterConfig.batteryConfig.vbatmaxcellvoltage, .config.minmax = { 10,  50 } },
    { "vbat_min_cell_voltage",      VAR_UINT8  | MASTER_VALUE,  &masterConfig.batteryConfig.vbatmincellvoltage, .config.minmax = { 10,  50 } },
    { "vbat_warning_cell_voltage",  VAR_UINT8  | MASTER_VALUE,  &masterConfig.batteryConfig.vbatwarningcellvoltage, .config.minmax = { 10,  50 } },
    { "vbat_hysteresis",            VAR_UINT8  | MASTER_VALUE,  &masterConfig.batteryConfig.vbathysteresis, .config.minmax = { 0,  250 } },
    { "vbat_pid_compensation",      VAR_UINT8  | MASTER_VALUE | MODE_LOOKUP,  &masterConfig.batteryConfig.vbatPidCompensation, .config.lookup = { TABLE_OFF_ON } },
    { "current_meter_scale",        VAR_INT16  | MASTER_VALUE,  &masterConfig.batteryConfig.currentMeterScale, .config.minmax = { -10000,  10000 } },
    { "current_meter_offset",       VAR_UINT16 | MASTER_VALUE,  &masterConfig.batteryConfig.currentMeterOffset, .config.minmax = { 0,  3300 } },
    { "multiwii_current_meter_output", VAR_UINT8  | MASTER_VALUE | MODE_LOOKUP,  &masterConfig.batteryConfig.multiwiiCurrentMeterOutput, .config.lookup = { TABLE_OFF_ON } },
    { "current_meter_type",         VAR_UINT8  | MASTER_VALUE | MODE_LOOKUP,  &masterConfig.batteryConfig.currentMeterType, .config.lookup = { TABLE_CURRENT_SENSOR } },

    { "align_gyro",                 VAR_UINT8  | MASTER_VALUE | MODE_LOOKUP,  &masterConfig.sensorAlignmentConfig.gyro_align, .config.lookup = { TABLE_ALIGNMENT } },
    { "align_acc",                  VAR_UINT8  | MASTER_VALUE | MODE_LOOKUP,  &masterConfig.sensorAlignmentConfig.acc_align, .config.lookup = { TABLE_ALIGNMENT } },
    { "align_mag",                  VAR_UINT8  | MASTER_VALUE | MODE_LOOKUP,  &masterConfig.sensorAlignmentConfig.mag_align, .config.lookup = { TABLE_ALIGNMENT } },

    { "align_board_roll",           VAR_INT16  | MASTER_VALUE,  &masterConfig.boardAlignment.rollDegrees, .config.minmax = { -180,  360 } },
    { "align_board_pitch",          VAR_INT16  | MASTER_VALUE,  &masterConfig.boardAlignment.pitchDegrees, .config.minmax = { -180,  360 } },
    { "align_board_yaw",            VAR_INT16  | MASTER_VALUE,  &masterConfig.boardAlignment.yawDegrees, .config.minmax = { -180,  360 } },

    { "max_angle_inclination",      VAR_UINT16 | MASTER_VALUE,  &masterConfig.max_angle_inclination, .config.minmax = { 100,  900 } },

    { "gyro_lpf",                   VAR_UINT8  | MASTER_VALUE | MODE_LOOKUP,  &masterConfig.gyro_lpf, .config.lookup = { TABLE_GYRO_LPF } },
    { "gyro_sync_denom",            VAR_UINT8  | MASTER_VALUE,  &masterConfig.gyro_sync_denom, .config.minmax = { 1,  8 } },
    { "gyro_lowpass_hz",            VAR_FLOAT  | MASTER_VALUE,  &masterConfig.gyro_soft_lpf_hz, .config.minmax = { 0,  500 } },
    { "moron_threshold",            VAR_UINT8  | MASTER_VALUE,  &masterConfig.gyroConfig.gyroMovementCalibrationThreshold, .config.minmax = { 0,  128 } },
    { "imu_dcm_kp",                 VAR_UINT16 | MASTER_VALUE,  &masterConfig.dcm_kp, .config.minmax = { 0,  50000 } },
    { "imu_dcm_ki",                 VAR_UINT16 | MASTER_VALUE,  &masterConfig.dcm_ki, .config.minmax = { 0,  50000 } },

    { "alt_hold_deadband",          VAR_UINT8  | MASTER_VALUE, &masterConfig.rcControlsConfig.alt_hold_deadband, .config.minmax = { 1,  250 } },
    { "alt_hold_fast_change",       VAR_UINT8  | MASTER_VALUE | MODE_LOOKUP, &masterConfig.rcControlsConfig.alt_hold_fast_change, .config.lookup = { TABLE_OFF_ON } },
    { "deadband",                   VAR_UINT8  | MASTER_VALUE, &masterConfig.rcControlsConfig.deadband, .config.minmax = { 0,  32 } },
    { "yaw_deadband",               VAR_UINT8  | MASTER_VALUE, &masterConfig.rcControlsConfig.yaw_deadband, .config.minmax = { 0,  100 } },

    { "throttle_correction_value",  VAR_UINT8  | MASTER_VALUE, &masterConfig.throttle_correction_value, .config.minmax = { 0,  150 } },
    { "throttle_correction_angle",  VAR_UINT16 | MASTER_VALUE, &masterConfig.throttle_correction_angle, .config.minmax = { 1,  900 } },

    { "yaw_control_direction",      VAR_INT8   | MASTER_VALUE,  &masterConfig.yaw_control_direction, .config.minmax = { -1,  1 } },

    { "yaw_motor_direction",        VAR_INT8   | MASTER_VALUE, &masterConfig.mixerConfig.yaw_motor_direction, .config.minmax = { -1,  1 } },
    { "yaw_jump_prevention_limit",  VAR_UINT16 | MASTER_VALUE, &masterConfig.mixerConfig.yaw_jump_prevention_limit, .config.minmax = { YAW_JUMP_PREVENTION_LIMIT_LOW,  YAW_JUMP_PREVENTION_LIMIT_HIGH } },
    { "yaw_p_limit",                VAR_UINT16 | PROFILE_VALUE, &masterConfig.profile[0].pidProfile.yaw_p_limit, .config.minmax = { YAW_P_LIMIT_MIN, YAW_P_LIMIT_MAX } },
#ifdef USE_SERVOS
    { "tri_unarmed_servo",          VAR_INT8   | MASTER_VALUE | MODE_LOOKUP, &masterConfig.mixerConfig.tri_unarmed_servo, .config.lookup = { TABLE_OFF_ON } },
    { "servo_lowpass_freq",         VAR_INT16  | MASTER_VALUE, &masterConfig.mixerConfig.servo_lowpass_freq, .config.minmax = { 10,  400} },
    { "servo_lowpass_enable",       VAR_INT8   | MASTER_VALUE | MODE_LOOKUP, &masterConfig.mixerConfig.servo_lowpass_enable, .config.lookup = { TABLE_OFF_ON } },
#endif

    { "rc_rate",                    VAR_UINT8  | PROFILE_RATE_VALUE, &masterConfig.profile[0].controlRateProfile[0].rcRate8, .config.minmax = { 0,  250 } },
    { "rc_expo",                    VAR_UINT8  | PROFILE_RATE_VALUE, &masterConfig.profile[0].controlRateProfile[0].rcExpo8, .config.minmax = { 0,  100 } },
    { "rc_yaw_expo",                VAR_UINT8  | PROFILE_RATE_VALUE, &masterConfig.profile[0].controlRateProfile[0].rcYawExpo8, .config.minmax = { 0,  100 } },
    { "thr_mid",                    VAR_UINT8  | PROFILE_RATE_VALUE, &masterConfig.profile[0].controlRateProfile[0].thrMid8, .config.minmax = { 0,  100 } },
    { "thr_expo",                   VAR_UINT8  | PROFILE_RATE_VALUE, &masterConfig.profile[0].controlRateProfile[0].thrExpo8, .config.minmax = { 0,  100 } },
    { "roll_rate",                  VAR_UINT8  | PROFILE_RATE_VALUE, &masterConfig.profile[0].controlRateProfile[0].rates[FD_ROLL], .config.minmax = { 0,  CONTROL_RATE_CONFIG_ROLL_PITCH_RATE_MAX } },
    { "pitch_rate",                 VAR_UINT8  | PROFILE_RATE_VALUE, &masterConfig.profile[0].controlRateProfile[0].rates[FD_PITCH], .config.minmax = { 0,  CONTROL_RATE_CONFIG_ROLL_PITCH_RATE_MAX } },
    { "yaw_rate",                   VAR_UINT8  | PROFILE_RATE_VALUE, &masterConfig.profile[0].controlRateProfile[0].rates[FD_YAW], .config.minmax = { 0,  CONTROL_RATE_CONFIG_YAW_RATE_MAX } },
    { "tpa_rate",                   VAR_UINT8  | PROFILE_RATE_VALUE, &masterConfig.profile[0].controlRateProfile[0].dynThrPID, .config.minmax = { 0,  CONTROL_RATE_CONFIG_TPA_MAX} },
    { "tpa_breakpoint",             VAR_UINT16 | PROFILE_RATE_VALUE, &masterConfig.profile[0].controlRateProfile[0].tpa_breakpoint, .config.minmax = { PWM_RANGE_MIN,  PWM_RANGE_MAX} },
    { "super_expo_factor",          VAR_UINT8  | MASTER_VALUE, &masterConfig.rxConfig.superExpoFactor, .config.minmax = {1, 100 } },
    { "super_expo_factor_yaw",      VAR_UINT8  | MASTER_VALUE, &masterConfig.rxConfig.superExpoFactorYaw, .config.minmax = {1, 100 } },
    { "super_expo_yaw",             VAR_UINT8  | MASTER_VALUE | MODE_LOOKUP,  &masterConfig.rxConfig.superExpoYawMode, .config.lookup = { TABLE_SUPEREXPO_YAW } },

    { "failsafe_delay",             VAR_UINT8  | MASTER_VALUE,  &masterConfig.failsafeConfig.failsafe_delay, .config.minmax = { 0,  200 } },
    { "failsafe_off_delay",         VAR_UINT8  | MASTER_VALUE,  &masterConfig.failsafeConfig.failsafe_off_delay, .config.minmax = { 0,  200 } },
    { "failsafe_throttle",          VAR_UINT16 | MASTER_VALUE,  &masterConfig.failsafeConfig.failsafe_throttle, .config.minmax = { PWM_RANGE_MIN,  PWM_RANGE_MAX } },
    { "failsafe_kill_switch",       VAR_UINT8  | MASTER_VALUE | MODE_LOOKUP,  &masterConfig.failsafeConfig.failsafe_kill_switch, .config.lookup = { TABLE_OFF_ON } },
    { "failsafe_throttle_low_delay",VAR_UINT16 | MASTER_VALUE,  &masterConfig.failsafeConfig.failsafe_throttle_low_delay, .config.minmax = { 0,  300 } },
    { "failsafe_procedure",         VAR_UINT8  | MASTER_VALUE | MODE_LOOKUP,  &masterConfig.failsafeConfig.failsafe_procedure, .config.lookup = { TABLE_OFF_ON } },

    { "rx_min_usec",                VAR_UINT16 | MASTER_VALUE,  &masterConfig.rxConfig.rx_min_usec, .config.minmax = { PWM_PULSE_MIN,  PWM_PULSE_MAX } },
    { "rx_max_usec",                VAR_UINT16 | MASTER_VALUE,  &masterConfig.rxConfig.rx_max_usec, .config.minmax = { PWM_PULSE_MIN,  PWM_PULSE_MAX } },

#ifdef USE_SERVOS
    { "gimbal_mode",                VAR_UINT8  | MASTER_VALUE | MODE_LOOKUP, &masterConfig.gimbalConfig.mode, .config.lookup = { TABLE_GIMBAL_MODE } },
#endif

    { "acc_hardware",               VAR_UINT8  | MASTER_VALUE | MODE_LOOKUP,  &masterConfig.acc_hardware, .config.lookup = { TABLE_ACC_HARDWARE } },
    { "acc_lpf_hz",                 VAR_FLOAT  | MASTER_VALUE, &masterConfig.acc_lpf_hz, .config.minmax = { 0,  400 } },
    { "accxy_deadband",             VAR_UINT8  | MASTER_VALUE, &masterConfig.accDeadband.xy, .config.minmax = { 0,  100 } },
    { "accz_deadband",              VAR_UINT8  | MASTER_VALUE, &masterConfig.accDeadband.z, .config.minmax = { 0,  100 } },
    { "acc_unarmedcal",             VAR_UINT8  | MASTER_VALUE | MODE_LOOKUP, &masterConfig.acc_unarmedcal, .config.lookup = { TABLE_OFF_ON } },
    { "acc_trim_pitch",             VAR_INT16  | MASTER_VALUE, &masterConfig.accelerometerTrims.values.pitch, .config.minmax = { -300,  300 } },
    { "acc_trim_roll",              VAR_INT16  | MASTER_VALUE, &masterConfig.accelerometerTrims.values.roll, .config.minmax = { -300,  300 } },

    { "baro_tab_size",              VAR_UINT8  | MASTER_VALUE, &masterConfig.barometerConfig.baro_sample_count, .config.minmax = { 0,  BARO_SAMPLE_COUNT_MAX } },
    { "baro_noise_lpf",             VAR_FLOAT  | MASTER_VALUE, &masterConfig.barometerConfig.baro_noise_lpf, .config.minmax = { 0 , 1 } },
    { "baro_cf_vel",                VAR_FLOAT  | MASTER_VALUE, &masterConfig.barometerConfig.baro_cf_vel, .config.minmax = { 0 , 1 } },
    { "baro_cf_alt",                VAR_FLOAT  | MASTER_VALUE, &masterConfig.barometerConfig.baro_cf_alt, .config.minmax = { 0 , 1 } },
    { "baro_hardware",              VAR_UINT8  | MASTER_VALUE | MODE_LOOKUP,  &masterConfig.baro_hardware, .config.lookup = { TABLE_BARO_HARDWARE } },

    { "mag_hardware",               VAR_UINT8  | MASTER_VALUE | MODE_LOOKUP,  &masterConfig.mag_hardware, .config.lookup = { TABLE_MAG_HARDWARE } },
    { "mag_declination",            VAR_INT16  | MASTER_VALUE, &masterConfig.mag_declination, .config.minmax = { -18000,  18000 } },
    { "dterm_lowpass_hz",           VAR_FLOAT  | PROFILE_VALUE, &masterConfig.profile[0].pidProfile.dterm_lpf_hz, .config.minmax = {0, 500 } },
    { "dterm_differentiator",       VAR_UINT8  | PROFILE_VALUE | MODE_LOOKUP, &masterConfig.profile[0].pidProfile.dterm_differentiator, .config.lookup = { TABLE_OFF_ON } },
    { "iterm_always_reset",         VAR_UINT16 | PROFILE_VALUE, &masterConfig.profile[0].pidProfile.rollPitchItermResetAlways, .config.lookup = { TABLE_OFF_ON } },
    { "iterm_reset_degrees",        VAR_UINT16 | PROFILE_VALUE, &masterConfig.profile[0].pidProfile.rollPitchItermResetRate, .config.minmax = {50, 1000 } },
    { "yaw_iterm_reset_degrees",    VAR_UINT16 | PROFILE_VALUE, &masterConfig.profile[0].pidProfile.yawItermResetRate, .config.minmax = {25, 1000 } },
    { "yaw_lowpass_hz",             VAR_FLOAT  | PROFILE_VALUE, &masterConfig.profile[0].pidProfile.yaw_lpf_hz, .config.minmax = {0, 500 } },
    { "pid_process_denom",          VAR_UINT8  | MASTER_VALUE,  &masterConfig.pid_process_denom, .config.minmax = { 1,  8 } },

    { "pid_controller",             VAR_UINT8  | PROFILE_VALUE | MODE_LOOKUP, &masterConfig.profile[0].pidProfile.pidController, .config.lookup = { TABLE_PID_CONTROLLER } },

    { "p_pitch",                    VAR_UINT8  | PROFILE_VALUE, &masterConfig.profile[0].pidProfile.P8[PITCH], .config.minmax = { 0,  200 } },
    { "i_pitch",                    VAR_UINT8  | PROFILE_VALUE, &masterConfig.profile[0].pidProfile.I8[PITCH], .config.minmax = { 0,  200 } },
    { "d_pitch",                    VAR_UINT8  | PROFILE_VALUE, &masterConfig.profile[0].pidProfile.D8[PITCH], .config.minmax = { 0,  200 } },
    { "p_roll",                     VAR_UINT8  | PROFILE_VALUE, &masterConfig.profile[0].pidProfile.P8[ROLL], .config.minmax = { 0,  200 } },
    { "i_roll",                     VAR_UINT8  | PROFILE_VALUE, &masterConfig.profile[0].pidProfile.I8[ROLL], .config.minmax = { 0,  200 } },
    { "d_roll",                     VAR_UINT8  | PROFILE_VALUE, &masterConfig.profile[0].pidProfile.D8[ROLL], .config.minmax = { 0,  200 } },
    { "p_yaw",                      VAR_UINT8  | PROFILE_VALUE, &masterConfig.profile[0].pidProfile.P8[YAW], .config.minmax = { 0,  200 } },
    { "i_yaw",                      VAR_UINT8  | PROFILE_VALUE, &masterConfig.profile[0].pidProfile.I8[YAW], .config.minmax = { 0,  200 } },
    { "d_yaw",                      VAR_UINT8  | PROFILE_VALUE, &masterConfig.profile[0].pidProfile.D8[YAW], .config.minmax = { 0,  200 } },

    { "p_alt",                      VAR_UINT8  | PROFILE_VALUE, &masterConfig.profile[0].pidProfile.P8[PIDALT], .config.minmax = { 0,  200 } },
    { "i_alt",                      VAR_UINT8  | PROFILE_VALUE, &masterConfig.profile[0].pidProfile.I8[PIDALT], .config.minmax = { 0,  200 } },
    { "d_alt",                      VAR_UINT8  | PROFILE_VALUE, &masterConfig.profile[0].pidProfile.D8[PIDALT], .config.minmax = { 0,  200 } },

    { "p_level",                    VAR_UINT8  | PROFILE_VALUE, &masterConfig.profile[0].pidProfile.P8[PIDLEVEL], .config.minmax = { 0,  200 } },
    { "i_level",                    VAR_UINT8  | PROFILE_VALUE, &masterConfig.profile[0].pidProfile.I8[PIDLEVEL], .config.minmax = { 0,  200 } },
    { "d_level",                    VAR_UINT8  | PROFILE_VALUE, &masterConfig.profile[0].pidProfile.D8[PIDLEVEL], .config.minmax = { 0,  200 } },

    { "p_vel",                      VAR_UINT8  | PROFILE_VALUE, &masterConfig.profile[0].pidProfile.P8[PIDVEL], .config.minmax = { 0,  200 } },
    { "i_vel",                      VAR_UINT8  | PROFILE_VALUE, &masterConfig.profile[0].pidProfile.I8[PIDVEL], .config.minmax = { 0,  200 } },
    { "d_vel",                      VAR_UINT8  | PROFILE_VALUE, &masterConfig.profile[0].pidProfile.D8[PIDVEL], .config.minmax = { 0,  200 } },

#ifdef BLACKBOX
    { "blackbox_rate_num",          VAR_UINT8  | MASTER_VALUE,  &masterConfig.blackbox_rate_num, .config.minmax = { 1,  32 } },
    { "blackbox_rate_denom",        VAR_UINT8  | MASTER_VALUE,  &masterConfig.blackbox_rate_denom, .config.minmax = { 1,  32 } },
    { "blackbox_device",            VAR_UINT8  | MASTER_VALUE | MODE_LOOKUP,  &masterConfig.blackbox_device, .config.lookup = { TABLE_BLACKBOX_DEVICE } },
#endif

    { "magzero_x",                  VAR_INT16  | MASTER_VALUE, &masterConfig.magZero.raw[X], .config.minmax = { -32768,  32767 } },
    { "magzero_y",                  VAR_INT16  | MASTER_VALUE, &masterConfig.magZero.raw[Y], .config.minmax = { -32768,  32767 } },
    { "magzero_z",                  VAR_INT16  | MASTER_VALUE, &masterConfig.magZero.raw[Z], .config.minmax = { -32768,  32767 } },
};

#define VALUE_COUNT (sizeof(valueTable) / sizeof(clivalue_t))


typedef union {
    int32_t int_value;
    float float_value;
} int_float_value_t;

static void cliSetVar(const clivalue_t *var, const int_float_value_t value);
static void cliPrintVar(const clivalue_t *var, uint32_t full);
static void cliPrintVarRange(const clivalue_t *var);
static void cliPrint(const char *str);
static void cliPrintf(const char *fmt, ...);
static void cliWrite(uint8_t ch);

static void cliPrompt(void)
{
    cliPrint("\r\n# ");
    bufWriterFlush(cliWriter);
}

static void cliShowParseError(void)
{
    cliPrint("Parse error\r\n");
}

static void cliShowArgumentRangeError(char *name, int min, int max)
{
    cliPrintf("%s must be between %d and %d\r\n", name, min, max);
}

static char *processChannelRangeArgs(char *ptr, channelRange_t *range, uint8_t *validArgumentCount)
{
    int val;

    for (int argIndex = 0; argIndex < 2; argIndex++) {
        ptr = strchr(ptr, ' ');
        if (ptr) {
            val = atoi(++ptr);
            val = CHANNEL_VALUE_TO_STEP(val);
            if (val >= MIN_MODE_RANGE_STEP && val <= MAX_MODE_RANGE_STEP) {
                if (argIndex == 0) {
                    range->startStep = val;
                } else {
                    range->endStep = val;
                }
                (*validArgumentCount)++;
            }
        }
    }

    return ptr;
}

// Check if a string's length is zero
static bool isEmpty(const char *string)
{
    return *string == '\0';
}

static void cliRxFail(char *cmdline)
{
    uint8_t channel;
    char buf[3];

    if (isEmpty(cmdline)) {
        // print out rxConfig failsafe settings
        for (channel = 0; channel < MAX_SUPPORTED_RC_CHANNEL_COUNT; channel++) {
            cliRxFail(itoa(channel, buf, 10));
        }
    } else {
        char *ptr = cmdline;
        channel = atoi(ptr++);
        if ((channel < MAX_SUPPORTED_RC_CHANNEL_COUNT)) {

            rxFailsafeChannelConfiguration_t *channelFailsafeConfiguration = &masterConfig.rxConfig.failsafe_channel_configurations[channel];

            uint16_t value;
            rxFailsafeChannelType_e type = (channel < NON_AUX_CHANNEL_COUNT) ? RX_FAILSAFE_TYPE_FLIGHT : RX_FAILSAFE_TYPE_AUX;
            rxFailsafeChannelMode_e mode = channelFailsafeConfiguration->mode;
            bool requireValue = channelFailsafeConfiguration->mode == RX_FAILSAFE_MODE_SET;

            ptr = strchr(ptr, ' ');
            if (ptr) {
                char *p = strchr(rxFailsafeModeCharacters, *(++ptr));
                if (p) {
                    uint8_t requestedMode = p - rxFailsafeModeCharacters;
                    mode = rxFailsafeModesTable[type][requestedMode];
                } else {
                    mode = RX_FAILSAFE_MODE_INVALID;
                }
                if (mode == RX_FAILSAFE_MODE_INVALID) {
                    cliShowParseError();
                    return;
                }

                requireValue = mode == RX_FAILSAFE_MODE_SET;

                ptr = strchr(ptr, ' ');
                if (ptr) {
                    if (!requireValue) {
                        cliShowParseError();
                        return;
                    }
                    value = atoi(++ptr);
                    value = CHANNEL_VALUE_TO_RXFAIL_STEP(value);
                    if (value > MAX_RXFAIL_RANGE_STEP) {
                        cliPrint("Value out of range\r\n");
                        return;
                    }

                    channelFailsafeConfiguration->step = value;
                } else if (requireValue) {
                    cliShowParseError();
                    return;
                }
                channelFailsafeConfiguration->mode = mode;

            }

            char modeCharacter = rxFailsafeModeCharacters[channelFailsafeConfiguration->mode];

            // triple use of cliPrintf below
            // 1. acknowledge interpretation on command,
            // 2. query current setting on single item,
            // 3. recursive use for full list.

            if (requireValue) {
                cliPrintf("rxfail %u %c %d\r\n",
                    channel,
                    modeCharacter,
                    RXFAIL_STEP_TO_CHANNEL_VALUE(channelFailsafeConfiguration->step)
                );
            } else {
                cliPrintf("rxfail %u %c\r\n",
                    channel,
                    modeCharacter
                );
            }
        } else {
            cliShowArgumentRangeError("channel", 0, MAX_SUPPORTED_RC_CHANNEL_COUNT - 1);
        }
    }
}

static void cliAux(char *cmdline)
{
    int i, val = 0;
    char *ptr;

    if (isEmpty(cmdline)) {
        // print out aux channel settings
        for (i = 0; i < MAX_MODE_ACTIVATION_CONDITION_COUNT; i++) {
            modeActivationCondition_t *mac = &masterConfig.modeActivationConditions[i];
            cliPrintf("aux %u %u %u %u %u\r\n",
                i,
                mac->modeId,
                mac->auxChannelIndex,
                MODE_STEP_TO_CHANNEL_VALUE(mac->range.startStep),
                MODE_STEP_TO_CHANNEL_VALUE(mac->range.endStep)
            );
        }
    } else {
        ptr = cmdline;
        i = atoi(ptr++);
        if (i < MAX_MODE_ACTIVATION_CONDITION_COUNT) {
            modeActivationCondition_t *mac = &masterConfig.modeActivationConditions[i];
            uint8_t validArgumentCount = 0;
            ptr = strchr(ptr, ' ');
            if (ptr) {
                val = atoi(++ptr);
                if (val >= 0 && val < CHECKBOX_ITEM_COUNT) {
                    mac->modeId = val;
                    validArgumentCount++;
                }
            }
            ptr = strchr(ptr, ' ');
            if (ptr) {
                val = atoi(++ptr);
                if (val >= 0 && val < MAX_AUX_CHANNEL_COUNT) {
                    mac->auxChannelIndex = val;
                    validArgumentCount++;
                }
            }
            ptr = processChannelRangeArgs(ptr, &mac->range, &validArgumentCount);

            if (validArgumentCount != 4) {
                memset(mac, 0, sizeof(modeActivationCondition_t));
            }
        } else {
            cliShowArgumentRangeError("index", 0, MAX_MODE_ACTIVATION_CONDITION_COUNT - 1);
        }
    }
}

static void cliSerial(char *cmdline)
{
    int i, val;
    char *ptr;

    if (isEmpty(cmdline)) {
        for (i = 0; i < SERIAL_PORT_COUNT; i++) {
            if (!serialIsPortAvailable(masterConfig.serialConfig.portConfigs[i].identifier)) {
                continue;
            };
            cliPrintf("serial %d %d %ld %ld %ld %ld\r\n" ,
                masterConfig.serialConfig.portConfigs[i].identifier,
                masterConfig.serialConfig.portConfigs[i].functionMask,
                baudRates[masterConfig.serialConfig.portConfigs[i].msp_baudrateIndex],
                baudRates[masterConfig.serialConfig.portConfigs[i].gps_baudrateIndex],
                baudRates[masterConfig.serialConfig.portConfigs[i].telemetry_baudrateIndex],
                baudRates[masterConfig.serialConfig.portConfigs[i].blackbox_baudrateIndex]
            );
        }
        return;
    }

    serialPortConfig_t portConfig;
    memset(&portConfig, 0 , sizeof(portConfig));

    serialPortConfig_t *currentConfig;

    uint8_t validArgumentCount = 0;

    ptr = cmdline;

    val = atoi(ptr++);
    currentConfig = serialFindPortConfiguration(val);
    if (currentConfig) {
        portConfig.identifier = val;
        validArgumentCount++;
    }

    ptr = strchr(ptr, ' ');
    if (ptr) {
        val = atoi(++ptr);
        portConfig.functionMask = val & 0xFFFF;
        validArgumentCount++;
    }

    for (i = 0; i < 4; i ++) {
        ptr = strchr(ptr, ' ');
        if (!ptr) {
            break;
        }

        val = atoi(++ptr);

        uint8_t baudRateIndex = lookupBaudRateIndex(val);
        if (baudRates[baudRateIndex] != (uint32_t) val) {
            break;
        }

        switch(i) {
            case 0:
                if (baudRateIndex < BAUD_9600 || baudRateIndex > BAUD_115200) {
                    continue;
                }
                portConfig.msp_baudrateIndex = baudRateIndex;
                break;
            case 1:
                if (baudRateIndex < BAUD_9600 || baudRateIndex > BAUD_115200) {
                    continue;
                }
                portConfig.gps_baudrateIndex = baudRateIndex;
                break;
            case 2:
                if (baudRateIndex != BAUD_AUTO && baudRateIndex > BAUD_115200) {
                    continue;
                }
                portConfig.telemetry_baudrateIndex = baudRateIndex;
                break;
            case 3:
                if (baudRateIndex < BAUD_19200 || baudRateIndex > BAUD_250000) {
                    continue;
                }
                portConfig.blackbox_baudrateIndex = baudRateIndex;
                break;
        }

        validArgumentCount++;
    }

    if (validArgumentCount < 6) {
        cliShowParseError();
        return;
    }

    memcpy(currentConfig, &portConfig, sizeof(portConfig));

}

#ifndef SKIP_SERIAL_PASSTHROUGH
static void cliSerialPassthrough(char *cmdline)
{
    if (isEmpty(cmdline)) {
        cliShowParseError();
        return;
    }

    int id = -1;
    uint32_t baud = 0;
    unsigned mode = 0;
    char* tok = strtok(cmdline, " ");
    int index = 0;

    while (tok != NULL) {
        switch(index) {
            case 0:
                id = atoi(tok);
                break;
            case 1:
                baud = atoi(tok);
                break;
            case 2:
                if (strstr(tok, "rx") || strstr(tok, "RX"))
                    mode |= MODE_RX;
                if (strstr(tok, "tx") || strstr(tok, "TX"))
                    mode |= MODE_TX;
                break;
        }
        index++;
        tok = strtok(NULL, " ");
    }

    serialPort_t *passThroughPort;
    serialPortUsage_t *passThroughPortUsage = findSerialPortUsageByIdentifier(id);
    if (!passThroughPortUsage || passThroughPortUsage->serialPort == NULL) {
        if (!baud) {
            printf("Port %d is not open, you must specify baud\r\n", id);
            return;
        }
        if (!mode)
            mode = MODE_RXTX;

        passThroughPort = openSerialPort(id, FUNCTION_PASSTHROUGH, NULL,
                                         baud, mode,
                                         SERIAL_NOT_INVERTED);
        if (!passThroughPort) {
            printf("Port %d could not be opened\r\n", id);
            return;
        }
        printf("Port %d opened, baud=%d\r\n", id, baud);
    } else {
        passThroughPort = passThroughPortUsage->serialPort;
        // If the user supplied a mode, override the port's mode, otherwise
        // leave the mode unchanged. serialPassthrough() handles one-way ports.
        printf("Port %d already open\r\n", id);
        if (mode && passThroughPort->mode != mode) {
            printf("Adjusting mode from configured value %d to %d\r\n",
                   passThroughPort->mode, mode);
            serialSetMode(passThroughPort, mode);
        }
    }

    printf("Relaying data to device on port %d, Reset your board to exit "
           "serial passthrough mode.\r\n");

    serialPassthrough(cliPort, passThroughPort, NULL, NULL);
}
#endif

static void cliAdjustmentRange(char *cmdline)
{
    int i, val = 0;
    char *ptr;

    if (isEmpty(cmdline)) {
        // print out adjustment ranges channel settings
        for (i = 0; i < MAX_ADJUSTMENT_RANGE_COUNT; i++) {
            adjustmentRange_t *ar = &masterConfig.adjustmentRanges[i];
            cliPrintf("adjrange %u %u %u %u %u %u %u\r\n",
                i,
                ar->adjustmentIndex,
                ar->auxChannelIndex,
                MODE_STEP_TO_CHANNEL_VALUE(ar->range.startStep),
                MODE_STEP_TO_CHANNEL_VALUE(ar->range.endStep),
                ar->adjustmentFunction,
                ar->auxSwitchChannelIndex
            );
        }
    } else {
        ptr = cmdline;
        i = atoi(ptr++);
        if (i < MAX_ADJUSTMENT_RANGE_COUNT) {
            adjustmentRange_t *ar = &masterConfig.adjustmentRanges[i];
            uint8_t validArgumentCount = 0;

            ptr = strchr(ptr, ' ');
            if (ptr) {
                val = atoi(++ptr);
                if (val >= 0 && val < MAX_SIMULTANEOUS_ADJUSTMENT_COUNT) {
                    ar->adjustmentIndex = val;
                    validArgumentCount++;
                }
            }
            ptr = strchr(ptr, ' ');
            if (ptr) {
                val = atoi(++ptr);
                if (val >= 0 && val < MAX_AUX_CHANNEL_COUNT) {
                    ar->auxChannelIndex = val;
                    validArgumentCount++;
                }
            }

            ptr = processChannelRangeArgs(ptr, &ar->range, &validArgumentCount);

            ptr = strchr(ptr, ' ');
            if (ptr) {
                val = atoi(++ptr);
                if (val >= 0 && val < ADJUSTMENT_FUNCTION_COUNT) {
                    ar->adjustmentFunction = val;
                    validArgumentCount++;
                }
            }
            ptr = strchr(ptr, ' ');
            if (ptr) {
                val = atoi(++ptr);
                if (val >= 0 && val < MAX_AUX_CHANNEL_COUNT) {
                    ar->auxSwitchChannelIndex = val;
                    validArgumentCount++;
                }
            }

            if (validArgumentCount != 6) {
                memset(ar, 0, sizeof(adjustmentRange_t));
                cliShowParseError();
            }
        } else {
            cliShowArgumentRangeError("index", 0, MAX_ADJUSTMENT_RANGE_COUNT - 1);
        }
    }
}

static void cliMotorMix(char *cmdline)
{
#ifdef USE_QUAD_MIXER_ONLY
    UNUSED(cmdline);
#else
    int i, check = 0;
    int num_motors = 0;
    uint8_t len;
    char buf[16];
    char *ptr;

    if (isEmpty(cmdline)) {
        cliPrint("Motor\tThr\tRoll\tPitch\tYaw\r\n");
        for (i = 0; i < MAX_SUPPORTED_MOTORS; i++) {
            if (masterConfig.customMotorMixer[i].throttle == 0.0f)
                break;
            num_motors++;
            cliPrintf("#%d:\t", i);
            cliPrintf("%s\t", ftoa(masterConfig.customMotorMixer[i].throttle, buf));
            cliPrintf("%s\t", ftoa(masterConfig.customMotorMixer[i].roll, buf));
            cliPrintf("%s\t", ftoa(masterConfig.customMotorMixer[i].pitch, buf));
            cliPrintf("%s\r\n", ftoa(masterConfig.customMotorMixer[i].yaw, buf));
        }
        return;
    } else if (strncasecmp(cmdline, "reset", 5) == 0) {
        // erase custom mixer
        for (i = 0; i < MAX_SUPPORTED_MOTORS; i++)
            masterConfig.customMotorMixer[i].throttle = 0.0f;
    } else if (strncasecmp(cmdline, "load", 4) == 0) {
        ptr = strchr(cmdline, ' ');
        if (ptr) {
            len = strlen(++ptr);
            for (i = 0; ; i++) {
                if (mixerNames[i] == NULL) {
                    cliPrint("Invalid name\r\n");
                    break;
                }
                if (strncasecmp(ptr, mixerNames[i], len) == 0) {
                    mixerLoadMix(i, masterConfig.customMotorMixer);
                    cliPrintf("Loaded %s\r\n", mixerNames[i]);
                    cliMotorMix("");
                    break;
                }
            }
        }
    } else {
        ptr = cmdline;
        i = atoi(ptr); // get motor number
        if (i < MAX_SUPPORTED_MOTORS) {
            ptr = strchr(ptr, ' ');
            if (ptr) {
                masterConfig.customMotorMixer[i].throttle = fastA2F(++ptr);
                check++;
            }
            ptr = strchr(ptr, ' ');
            if (ptr) {
                masterConfig.customMotorMixer[i].roll = fastA2F(++ptr);
                check++;
            }
            ptr = strchr(ptr, ' ');
            if (ptr) {
                masterConfig.customMotorMixer[i].pitch = fastA2F(++ptr);
                check++;
            }
            ptr = strchr(ptr, ' ');
            if (ptr) {
                masterConfig.customMotorMixer[i].yaw = fastA2F(++ptr);
                check++;
            }
            if (check != 4) {
                cliShowParseError();
            } else {
                cliMotorMix("");
            }
        } else {
            cliShowArgumentRangeError("index", 0, MAX_SUPPORTED_MOTORS - 1);
        }
    }
#endif
}

static void cliRxRange(char *cmdline)
{
    int i, validArgumentCount = 0;
    char *ptr;

    if (isEmpty(cmdline)) {
        for (i = 0; i < NON_AUX_CHANNEL_COUNT; i++) {
            rxChannelRangeConfiguration_t *channelRangeConfiguration = &masterConfig.rxConfig.channelRanges[i];
            cliPrintf("rxrange %u %u %u\r\n", i, channelRangeConfiguration->min, channelRangeConfiguration->max);
        }
    } else if (strcasecmp(cmdline, "reset") == 0) {
        resetAllRxChannelRangeConfigurations(masterConfig.rxConfig.channelRanges);
    } else {
        ptr = cmdline;
        i = atoi(ptr);
        if (i >= 0 && i < NON_AUX_CHANNEL_COUNT) {
            int rangeMin, rangeMax;

            ptr = strchr(ptr, ' ');
            if (ptr) {
                rangeMin = atoi(++ptr);
                validArgumentCount++;
            }

            ptr = strchr(ptr, ' ');
            if (ptr) {
                rangeMax = atoi(++ptr);
                validArgumentCount++;
            }

            if (validArgumentCount != 2) {
                cliShowParseError();
            } else if (rangeMin < PWM_PULSE_MIN || rangeMin > PWM_PULSE_MAX || rangeMax < PWM_PULSE_MIN || rangeMax > PWM_PULSE_MAX) {
                cliShowParseError();
            } else {
                rxChannelRangeConfiguration_t *channelRangeConfiguration = &masterConfig.rxConfig.channelRanges[i];
                channelRangeConfiguration->min = rangeMin;
                channelRangeConfiguration->max = rangeMax;
            }
        } else {
            cliShowArgumentRangeError("channel", 0, NON_AUX_CHANNEL_COUNT - 1);
        }
    }
}

#ifdef LED_STRIP
static void cliLed(char *cmdline)
{
    int i;
    char *ptr;
    char ledConfigBuffer[20];

    if (isEmpty(cmdline)) {
        for (i = 0; i < MAX_LED_STRIP_LENGTH; i++) {
            generateLedConfig(i, ledConfigBuffer, sizeof(ledConfigBuffer));
            cliPrintf("led %u %s\r\n", i, ledConfigBuffer);
        }
    } else {
        ptr = cmdline;
        i = atoi(ptr);
        if (i < MAX_LED_STRIP_LENGTH) {
            ptr = strchr(cmdline, ' ');
            if (!parseLedStripConfig(i, ++ptr)) {
                cliShowParseError();
            }
        } else {
            cliShowArgumentRangeError("index", 0, MAX_LED_STRIP_LENGTH - 1);
        }
    }
}

static void cliColor(char *cmdline)
{
    int i;
    char *ptr;

    if (isEmpty(cmdline)) {
        for (i = 0; i < CONFIGURABLE_COLOR_COUNT; i++) {
            cliPrintf("color %u %d,%u,%u\r\n",
                i,
                masterConfig.colors[i].h,
                masterConfig.colors[i].s,
                masterConfig.colors[i].v
            );
        }
    } else {
        ptr = cmdline;
        i = atoi(ptr);
        if (i < CONFIGURABLE_COLOR_COUNT) {
            ptr = strchr(cmdline, ' ');
            if (!parseColor(i, ++ptr)) {
                cliShowParseError();
            }
        } else {
            cliShowArgumentRangeError("index", 0, CONFIGURABLE_COLOR_COUNT - 1);
        }
    }
}
#endif

#ifdef USE_SERVOS
static void cliServo(char *cmdline)
{
    enum { SERVO_ARGUMENT_COUNT = 8 };
    int16_t arguments[SERVO_ARGUMENT_COUNT];

    servoParam_t *servo;

    int i;
    char *ptr;

    if (isEmpty(cmdline)) {
        // print out servo settings
        for (i = 0; i < MAX_SUPPORTED_SERVOS; i++) {
            servo = &masterConfig.servoConf[i];

            cliPrintf("servo %u %d %d %d %d %d %d %d\r\n",
                i,
                servo->min,
                servo->max,
                servo->middle,
                servo->angleAtMin,
                servo->angleAtMax,
                servo->rate,
                servo->forwardFromChannel
            );
        }
    } else {
        int validArgumentCount = 0;

        ptr = cmdline;

        // Command line is integers (possibly negative) separated by spaces, no other characters allowed.

        // If command line doesn't fit the format, don't modify the config
        while (*ptr) {
            if (*ptr == '-' || (*ptr >= '0' && *ptr <= '9')) {
                if (validArgumentCount >= SERVO_ARGUMENT_COUNT) {
                    cliShowParseError();
                    return;
                }

                arguments[validArgumentCount++] = atoi(ptr);

                do {
                    ptr++;
                } while (*ptr >= '0' && *ptr <= '9');
            } else if (*ptr == ' ') {
                ptr++;
            } else {
                cliShowParseError();
                return;
            }
        }

        enum {INDEX = 0, MIN, MAX, MIDDLE, ANGLE_AT_MIN, ANGLE_AT_MAX, RATE, FORWARD};

        i = arguments[INDEX];

        // Check we got the right number of args and the servo index is correct (don't validate the other values)
        if (validArgumentCount != SERVO_ARGUMENT_COUNT || i < 0 || i >= MAX_SUPPORTED_SERVOS) {
            cliShowParseError();
            return;
        }

        servo = &masterConfig.servoConf[i];

        if (
            arguments[MIN] < PWM_PULSE_MIN || arguments[MIN] > PWM_PULSE_MAX ||
            arguments[MAX] < PWM_PULSE_MIN || arguments[MAX] > PWM_PULSE_MAX ||
            arguments[MIDDLE] < arguments[MIN] || arguments[MIDDLE] > arguments[MAX] ||
            arguments[MIN] > arguments[MAX] || arguments[MAX] < arguments[MIN] ||
            arguments[RATE] < -100 || arguments[RATE] > 100 ||
            arguments[FORWARD] >= MAX_SUPPORTED_RC_CHANNEL_COUNT ||
            arguments[ANGLE_AT_MIN] < 0 || arguments[ANGLE_AT_MIN] > 180 ||
            arguments[ANGLE_AT_MAX] < 0 || arguments[ANGLE_AT_MAX] > 180
        ) {
            cliShowParseError();
            return;
        }

        servo->min = arguments[1];
        servo->max = arguments[2];
        servo->middle = arguments[3];
        servo->angleAtMin = arguments[4];
        servo->angleAtMax = arguments[5];
        servo->rate = arguments[6];
        servo->forwardFromChannel = arguments[7];
    }
}
#endif

#ifdef USE_SERVOS
static void cliServoMix(char *cmdline)
{
    int i;
    uint8_t len;
    char *ptr;
    int args[8], check = 0;
    len = strlen(cmdline);

    if (len == 0) {

        cliPrint("Rule\tServo\tSource\tRate\tSpeed\tMin\tMax\tBox\r\n");

        for (i = 0; i < MAX_SERVO_RULES; i++) {
            if (masterConfig.customServoMixer[i].rate == 0)
                break;

            cliPrintf("#%d:\t%d\t%d\t%d\t%d\t%d\t%d\t%d\r\n",
                i,
                masterConfig.customServoMixer[i].targetChannel,
                masterConfig.customServoMixer[i].inputSource,
                masterConfig.customServoMixer[i].rate,
                masterConfig.customServoMixer[i].speed,
                masterConfig.customServoMixer[i].min,
                masterConfig.customServoMixer[i].max,
                masterConfig.customServoMixer[i].box
            );
        }
        cliPrintf("\r\n");
        return;
    } else if (strncasecmp(cmdline, "reset", 5) == 0) {
        // erase custom mixer
        memset(masterConfig.customServoMixer, 0, sizeof(masterConfig.customServoMixer));
        for (i = 0; i < MAX_SUPPORTED_SERVOS; i++) {
            masterConfig.servoConf[i].reversedSources = 0;
        }
    } else if (strncasecmp(cmdline, "load", 4) == 0) {
        ptr = strchr(cmdline, ' ');
        if (ptr) {
            len = strlen(++ptr);
            for (i = 0; ; i++) {
                if (mixerNames[i] == NULL) {
                    cliPrintf("Invalid name\r\n");
                    break;
                }
                if (strncasecmp(ptr, mixerNames[i], len) == 0) {
                    servoMixerLoadMix(i, masterConfig.customServoMixer);
                    cliPrintf("Loaded %s\r\n", mixerNames[i]);
                    cliServoMix("");
                    break;
                }
            }
        }
    } else if (strncasecmp(cmdline, "reverse", 7) == 0) {
        enum {SERVO = 0, INPUT, REVERSE, ARGS_COUNT};
        int servoIndex, inputSource;
        ptr = strchr(cmdline, ' ');

        len = strlen(ptr);
        if (len == 0) {
            cliPrintf("s");
            for (inputSource = 0; inputSource < INPUT_SOURCE_COUNT; inputSource++)
                cliPrintf("\ti%d", inputSource);
            cliPrintf("\r\n");

            for (servoIndex = 0; servoIndex < MAX_SUPPORTED_SERVOS; servoIndex++) {
                cliPrintf("%d", servoIndex);
                for (inputSource = 0; inputSource < INPUT_SOURCE_COUNT; inputSource++)
                    cliPrintf("\t%s  ", (masterConfig.servoConf[servoIndex].reversedSources & (1 << inputSource)) ? "r" : "n");
                cliPrintf("\r\n");
            }
            return;
        }

        ptr = strtok(ptr, " ");
        while (ptr != NULL && check < ARGS_COUNT - 1) {
            args[check++] = atoi(ptr);
            ptr = strtok(NULL, " ");
        }

        if (ptr == NULL || check != ARGS_COUNT - 1) {
            cliShowParseError();
            return;
        }

        if (args[SERVO] >= 0 && args[SERVO] < MAX_SUPPORTED_SERVOS
                && args[INPUT] >= 0 && args[INPUT] < INPUT_SOURCE_COUNT
                && (*ptr == 'r' || *ptr == 'n')) {
            if (*ptr == 'r')
                masterConfig.servoConf[args[SERVO]].reversedSources |= 1 << args[INPUT];
            else
                masterConfig.servoConf[args[SERVO]].reversedSources &= ~(1 << args[INPUT]);
        } else
            cliShowParseError();

        cliServoMix("reverse");
    } else {
        enum {RULE = 0, TARGET, INPUT, RATE, SPEED, MIN, MAX, BOX, ARGS_COUNT};
        ptr = strtok(cmdline, " ");
        while (ptr != NULL && check < ARGS_COUNT) {
            args[check++] = atoi(ptr);
            ptr = strtok(NULL, " ");
        }

        if (ptr != NULL || check != ARGS_COUNT) {
            cliShowParseError();
            return;
        }

        i = args[RULE];
        if (i >= 0 && i < MAX_SERVO_RULES &&
            args[TARGET] >= 0 && args[TARGET] < MAX_SUPPORTED_SERVOS &&
            args[INPUT] >= 0 && args[INPUT] < INPUT_SOURCE_COUNT &&
            args[RATE] >= -100 && args[RATE] <= 100 &&
            args[SPEED] >= 0 && args[SPEED] <= MAX_SERVO_SPEED &&
            args[MIN] >= 0 && args[MIN] <= 100 &&
            args[MAX] >= 0 && args[MAX] <= 100 && args[MIN] < args[MAX] &&
            args[BOX] >= 0 && args[BOX] <= MAX_SERVO_BOXES) {
            masterConfig.customServoMixer[i].targetChannel = args[TARGET];
            masterConfig.customServoMixer[i].inputSource = args[INPUT];
            masterConfig.customServoMixer[i].rate = args[RATE];
            masterConfig.customServoMixer[i].speed = args[SPEED];
            masterConfig.customServoMixer[i].min = args[MIN];
            masterConfig.customServoMixer[i].max = args[MAX];
            masterConfig.customServoMixer[i].box = args[BOX];
            cliServoMix("");
        } else {
            cliShowParseError();
        }
    }
}
#endif

#ifdef USE_SDCARD

static void cliWriteBytes(const uint8_t *buffer, int count)
{
    while (count > 0) {
        cliWrite(*buffer);
        buffer++;
        count--;
    }
}

static void cliSdInfo(char *cmdline) {
    UNUSED(cmdline);

    cliPrint("SD card: ");

    if (!sdcard_isInserted()) {
        cliPrint("None inserted\r\n");
        return;
    }

    if (!sdcard_isInitialized()) {
        cliPrint("Startup failed\r\n");
        return;
    }

    const sdcardMetadata_t *metadata = sdcard_getMetadata();

    cliPrintf("Manufacturer 0x%x, %ukB, %02d/%04d, v%d.%d, '",
        metadata->manufacturerID,
        metadata->numBlocks / 2, /* One block is half a kB */
        metadata->productionMonth,
        metadata->productionYear,
        metadata->productRevisionMajor,
        metadata->productRevisionMinor
    );

    cliWriteBytes((uint8_t*)metadata->productName, sizeof(metadata->productName));

    cliPrint("'\r\n" "Filesystem: ");

    switch (afatfs_getFilesystemState()) {
        case AFATFS_FILESYSTEM_STATE_READY:
            cliPrint("Ready");
        break;
        case AFATFS_FILESYSTEM_STATE_INITIALIZATION:
            cliPrint("Initializing");
        break;
        case AFATFS_FILESYSTEM_STATE_UNKNOWN:
        case AFATFS_FILESYSTEM_STATE_FATAL:
            cliPrint("Fatal");

            switch (afatfs_getLastError()) {
                case AFATFS_ERROR_BAD_MBR:
                    cliPrint(" - no FAT MBR partitions");
                break;
                case AFATFS_ERROR_BAD_FILESYSTEM_HEADER:
                    cliPrint(" - bad FAT header");
                break;
                case AFATFS_ERROR_GENERIC:
                case AFATFS_ERROR_NONE:
                    ; // Nothing more detailed to print
                break;
            }

            cliPrint("\r\n");
        break;
    }
}

#endif

#ifdef USE_FLASHFS

static void cliFlashInfo(char *cmdline)
{
    const flashGeometry_t *layout = flashfsGetGeometry();

    UNUSED(cmdline);

    cliPrintf("Flash sectors=%u, sectorSize=%u, pagesPerSector=%u, pageSize=%u, totalSize=%u, usedSize=%u\r\n",
            layout->sectors, layout->sectorSize, layout->pagesPerSector, layout->pageSize, layout->totalSize, flashfsGetOffset());
}

static void cliFlashErase(char *cmdline)
{
    UNUSED(cmdline);

    cliPrintf("Erasing...\r\n");
    flashfsEraseCompletely();

    while (!flashfsIsReady()) {
        delay(100);
    }

    cliPrintf("Done.\r\n");
}

#ifdef USE_FLASH_TOOLS

static void cliFlashWrite(char *cmdline)
{
    uint32_t address = atoi(cmdline);
    char *text = strchr(cmdline, ' ');

    if (!text) {
        cliShowParseError();
    } else {
        flashfsSeekAbs(address);
        flashfsWrite((uint8_t*)text, strlen(text), true);
        flashfsFlushSync();

        cliPrintf("Wrote %u bytes at %u.\r\n", strlen(text), address);
    }
}

static void cliFlashRead(char *cmdline)
{
    uint32_t address = atoi(cmdline);
    uint32_t length;
    int i;

    uint8_t buffer[32];

    char *nextArg = strchr(cmdline, ' ');

    if (!nextArg) {
        cliShowParseError();
    } else {
        length = atoi(nextArg);

        cliPrintf("Reading %u bytes at %u:\r\n", length, address);

        while (length > 0) {
            int bytesRead;

            bytesRead = flashfsReadAbs(address, buffer, length < sizeof(buffer) ? length : sizeof(buffer));

            for (i = 0; i < bytesRead; i++) {
                cliWrite(buffer[i]);
            }

            length -= bytesRead;
            address += bytesRead;

            if (bytesRead == 0) {
                //Assume we reached the end of the volume or something fatal happened
                break;
            }
        }
        cliPrintf("\r\n");
    }
}

#endif
#endif

static void dumpValues(uint16_t valueSection)
{
    uint32_t i;
    const clivalue_t *value;
    for (i = 0; i < VALUE_COUNT; i++) {
        value = &valueTable[i];

        if ((value->type & VALUE_SECTION_MASK) != valueSection) {
            continue;
        }

        cliPrintf("set %s = ", valueTable[i].name);
        cliPrintVar(value, 0);
        cliPrint("\r\n");
    }
}

typedef enum {
    DUMP_MASTER = (1 << 0),
    DUMP_PROFILE = (1 << 1),
    DUMP_RATES = (1 << 2),
    DUMP_ALL = (1 << 3),
} dumpFlags_e;


static const char* const sectionBreak = "\r\n";

#define printSectionBreak() cliPrintf((char *)sectionBreak)

static void cliDump(char *cmdline)
{
    unsigned int i;
    char buf[16];
    uint32_t mask;

#ifndef USE_QUAD_MIXER_ONLY
    float thr, roll, pitch, yaw;
#endif

    uint8_t dumpMask = DUMP_MASTER;
    if (strcasecmp(cmdline, "master") == 0) {
        dumpMask = DUMP_MASTER; // only
    }
    if (strcasecmp(cmdline, "profile") == 0) {
        dumpMask = DUMP_PROFILE; // only
    }
    if (strcasecmp(cmdline, "rates") == 0) {
        dumpMask = DUMP_RATES; 
    }

    if (strcasecmp(cmdline, "all") == 0) {
        dumpMask = DUMP_ALL;   // All profiles and rates
    }

    if ((dumpMask & DUMP_MASTER) || (dumpMask & DUMP_ALL)) {

        cliPrint("\r\n# version\r\n");
        cliVersion(NULL);

        cliPrint("\r\n# dump master\r\n");
        cliPrint("\r\n# mixer\r\n");

#ifndef USE_QUAD_MIXER_ONLY
        cliPrintf("mixer %s\r\n", mixerNames[masterConfig.mixerMode - 1]);

        cliPrintf("mmix reset\r\n");

        for (i = 0; i < MAX_SUPPORTED_MOTORS; i++) {
            if (masterConfig.customMotorMixer[i].throttle == 0.0f)
                break;
            thr = masterConfig.customMotorMixer[i].throttle;
            roll = masterConfig.customMotorMixer[i].roll;
            pitch = masterConfig.customMotorMixer[i].pitch;
            yaw = masterConfig.customMotorMixer[i].yaw;
            cliPrintf("mmix %d", i);
            if (thr < 0)
                cliWrite(' ');
            cliPrintf("%s", ftoa(thr, buf));
            if (roll < 0)
                cliWrite(' ');
            cliPrintf("%s", ftoa(roll, buf));
            if (pitch < 0)
                cliWrite(' ');
            cliPrintf("%s", ftoa(pitch, buf));
            if (yaw < 0)
                cliWrite(' ');
            cliPrintf("%s\r\n", ftoa(yaw, buf));
        }

#ifdef USE_SERVOS
        // print custom servo mixer if exists
        cliPrintf("smix reset\r\n");

        for (i = 0; i < MAX_SERVO_RULES; i++) {

            if (masterConfig.customServoMixer[i].rate == 0)
                break;

            cliPrintf("smix %d %d %d %d %d %d %d %d\r\n",
                i,
                masterConfig.customServoMixer[i].targetChannel,
                masterConfig.customServoMixer[i].inputSource,
                masterConfig.customServoMixer[i].rate,
                masterConfig.customServoMixer[i].speed,
                masterConfig.customServoMixer[i].min,
                masterConfig.customServoMixer[i].max,
                masterConfig.customServoMixer[i].box
            );
        }

#endif
#endif

        cliPrint("\r\n\r\n# feature\r\n");

        mask = featureMask();
        for (i = 0; ; i++) { // disable all feature first
            if (featureNames[i] == NULL)
                break;
            cliPrintf("feature -%s\r\n", featureNames[i]);
        }
        for (i = 0; ; i++) {  // reenable what we want.
            if (featureNames[i] == NULL)
                break;
            if (mask & (1 << i))
                cliPrintf("feature %s\r\n", featureNames[i]);
        }


#ifdef BEEPER
        cliPrint("\r\n\r\n# beeper\r\n");

        uint8_t beeperCount = beeperTableEntryCount();
        mask = getBeeperOffMask();
        for (int i = 0; i < (beeperCount-2); i++) {
            if (mask & (1 << i))
                cliPrintf("beeper -%s\r\n", beeperNameForTableIndex(i));
            else
                cliPrintf("beeper %s\r\n", beeperNameForTableIndex(i));
        }
#endif


        cliPrint("\r\n\r\n# map\r\n");

        for (i = 0; i < 8; i++)
            buf[masterConfig.rxConfig.rcmap[i]] = rcChannelLetters[i];
        buf[i] = '\0';
        cliPrintf("map %s\r\n", buf);

        cliPrint("\r\n\r\n# serial\r\n");
        cliSerial("");

#ifdef LED_STRIP
        cliPrint("\r\n\r\n# led\r\n");
        cliLed("");

        cliPrint("\r\n\r\n# color\r\n");
        cliColor("");
#endif

        cliPrint("\r\n# aux\r\n");

        cliAux("");

        cliPrint("\r\n# adjrange\r\n");

        cliAdjustmentRange("");

        cliPrintf("\r\n# rxrange\r\n");

        cliRxRange("");

#ifdef USE_SERVOS
        cliPrint("\r\n# servo\r\n");

        cliServo("");

        // print servo directions
        unsigned int channel;

        for (i = 0; i < MAX_SUPPORTED_SERVOS; i++) {
            for (channel = 0; channel < INPUT_SOURCE_COUNT; channel++) {
                if (servoDirection(i, channel) < 0) {
                    cliPrintf("smix reverse %d %d r\r\n", i , channel);
                }
            }
        }
#endif

        printSectionBreak();
        dumpValues(MASTER_VALUE);

        cliPrint("\r\n# rxfail\r\n");
        cliRxFail("");
        
        if (dumpMask & DUMP_ALL) {
            uint8_t activeProfile = masterConfig.current_profile_index;
            uint8_t currentRateIndex = currentProfile->activeRateProfile;
            uint8_t profileCount;
            uint8_t rateCount;
            for (profileCount=0; profileCount<MAX_PROFILE_COUNT;profileCount++) {
                cliDumpProfile(profileCount);
                for (rateCount=0; rateCount<MAX_RATEPROFILES; rateCount++)
                    cliDumpRateProfile(rateCount);
            }

            changeProfile(activeProfile);
            changeControlRateProfile(currentRateIndex);
        } else {
            cliDumpProfile(masterConfig.current_profile_index);
            cliDumpRateProfile(currentProfile->activeRateProfile);
        }
    }

    if (dumpMask & DUMP_PROFILE) {
        cliDumpProfile(masterConfig.current_profile_index);
    }

    if (dumpMask & DUMP_RATES) {				
        cliDumpRateProfile(currentProfile->activeRateProfile);
    }
    
}

void cliDumpProfile(uint8_t profileIndex) {
        if (profileIndex >= MAX_PROFILE_COUNT) // Faulty values
            return;
        
        changeProfile(profileIndex);
        cliPrint("\r\n# profile\r\n");
        cliProfile("");
        cliPrintf("############################# PROFILE VALUES ####################################\r\n");
        cliProfile("");
        printSectionBreak();
        dumpValues(PROFILE_VALUE);

        cliRateProfile("");
}
void cliDumpRateProfile(uint8_t rateProfileIndex) {
    if (rateProfileIndex >= MAX_RATEPROFILES) // Faulty values
            return;
    
    changeControlRateProfile(rateProfileIndex);
    cliPrint("\r\n# rateprofile\r\n");		
    cliRateProfile("");		
    printSectionBreak();		

    dumpValues(PROFILE_RATE_VALUE);
            
}
void cliEnter(serialPort_t *serialPort)
{
    cliMode = 1;
    cliPort = serialPort;
    setPrintfSerialPort(cliPort);
    cliWriter = bufWriterInit(cliWriteBuffer, sizeof(cliWriteBuffer),
                              (bufWrite_t)serialWriteBufShim, serialPort);

    cliPrint("\r\nEntering CLI Mode, type 'exit' to return, or 'help'\r\n");
    cliPrompt();
    ENABLE_ARMING_FLAG(PREVENT_ARMING);
}

static void cliExit(char *cmdline)
{
    UNUSED(cmdline);

    cliPrint("\r\nLeaving CLI mode, unsaved changes lost.\r\n");
    bufWriterFlush(cliWriter);

    *cliBuffer = '\0';
    bufferIndex = 0;
    cliMode = 0;
    // incase a motor was left running during motortest, clear it here
    mixerResetDisarmedMotors();
    cliReboot();

    cliWriter = NULL;
}

static void cliFeature(char *cmdline)
{
    uint32_t i;
    uint32_t len;
    uint32_t mask;

    len = strlen(cmdline);
    mask = featureMask();

    if (len == 0) {
        cliPrint("Enabled: ");
        for (i = 0; ; i++) {
            if (featureNames[i] == NULL)
                break;
            if (mask & (1 << i))
                cliPrintf("%s ", featureNames[i]);
        }
        cliPrint("\r\n");
    } else if (strncasecmp(cmdline, "list", len) == 0) {
        cliPrint("Available: ");
        for (i = 0; ; i++) {
            if (featureNames[i] == NULL)
                break;
            cliPrintf("%s ", featureNames[i]);
        }
        cliPrint("\r\n");
        return;
    } else {
        bool remove = false;
        if (cmdline[0] == '-') {
            // remove feature
            remove = true;
            cmdline++; // skip over -
            len--;
        }

        for (i = 0; ; i++) {
            if (featureNames[i] == NULL) {
                cliPrint("Invalid name\r\n");
                break;
            }

            if (strncasecmp(cmdline, featureNames[i], len) == 0) {

                mask = 1 << i;
#ifndef GPS
                if (mask & FEATURE_GPS) {
                    cliPrint("unavailable\r\n");
                    break;
                }
#endif
#ifndef SONAR
                if (mask & FEATURE_SONAR) {
                    cliPrint("unavailable\r\n");
                    break;
                }
#endif
                if (remove) {
                    featureClear(mask);
                    cliPrint("Disabled");
                } else {
                    featureSet(mask);
                    cliPrint("Enabled");
                }
                cliPrintf(" %s\r\n", featureNames[i]);
                break;
            }
        }
    }
}

#ifdef BEEPER
static void cliBeeper(char *cmdline)
{
    uint32_t i;
    uint32_t len = strlen(cmdline);;
    uint8_t beeperCount = beeperTableEntryCount();
    uint32_t mask = getBeeperOffMask();

    if (len == 0) {
        cliPrintf("Disabled:");
        for (int i = 0; ; i++) {
        	if (i == beeperCount-2){
                if (mask == 0)
                	cliPrint("  none");
        		break;
        	}
            if (mask & (1 << i))
                cliPrintf("  %s", beeperNameForTableIndex(i));
        }
        cliPrint("\r\n");
    } else if (strncasecmp(cmdline, "list", len) == 0) {
        cliPrint("Available:");
        for (i = 0; i < beeperCount; i++)
            cliPrintf("  %s", beeperNameForTableIndex(i));
        cliPrint("\r\n");
        return;
    } else {
        bool remove = false;
        if (cmdline[0] == '-') {
            remove = true;     // this is for beeper OFF condition
            cmdline++;
            len--;
        }

        for (i = 0; ; i++) {
            if (i == beeperCount) {
                cliPrint("Invalid name\r\n");
                break;
            }
            if (strncasecmp(cmdline, beeperNameForTableIndex(i), len) == 0) {
                if (remove) { // beeper off
                    if (i == BEEPER_ALL-1)
                        beeperOffSetAll(beeperCount-2);
                    else
                    	if (i == BEEPER_PREFERENCE-1)
                            setBeeperOffMask(getPreferedBeeperOffMask());
                        else {
                            mask = 1 << i;
                            beeperOffSet(mask);
                        }
                    cliPrint("Disabled");
                }
                else { // beeper on
                    if (i == BEEPER_ALL-1)
                        beeperOffClearAll();
                    else
                    	if (i == BEEPER_PREFERENCE-1)
                            setPreferedBeeperOffMask(getBeeperOffMask());
                        else {
                            mask = 1 << i;
                            beeperOffClear(mask);
                        }
                    cliPrint("Enabled");
                }
            cliPrintf(" %s\r\n", beeperNameForTableIndex(i));
            break;
            }
        }
    }
}
#endif


#ifdef GPS
static void cliGpsPassthrough(char *cmdline)
{
    UNUSED(cmdline);

    gpsEnablePassthrough(cliPort);
}
#endif

static void cliHelp(char *cmdline)
{
    uint32_t i = 0;

    UNUSED(cmdline);

    for (i = 0; i < CMD_COUNT; i++) {
        cliPrint(cmdTable[i].name);
#ifndef SKIP_CLI_COMMAND_HELP
        if (cmdTable[i].description) {
            cliPrintf(" - %s", cmdTable[i].description);
        }
        if (cmdTable[i].args) {
            cliPrintf("\r\n\t%s", cmdTable[i].args);
        }
#endif
        cliPrint("\r\n");
    }
}

static void cliMap(char *cmdline)
{
    uint32_t len;
    uint32_t i;
    char out[9];

    len = strlen(cmdline);

    if (len == 8) {
        // uppercase it
        for (i = 0; i < 8; i++)
            cmdline[i] = toupper((unsigned char)cmdline[i]);
        for (i = 0; i < 8; i++) {
            if (strchr(rcChannelLetters, cmdline[i]) && !strchr(cmdline + i + 1, cmdline[i]))
                continue;
            cliShowParseError();
            return;
        }
        parseRcChannels(cmdline, &masterConfig.rxConfig);
    }
    cliPrint("Map: ");
    for (i = 0; i < 8; i++)
        out[masterConfig.rxConfig.rcmap[i]] = rcChannelLetters[i];
    out[i] = '\0';
    cliPrintf("%s\r\n", out);
}

#ifndef USE_QUAD_MIXER_ONLY
static void cliMixer(char *cmdline)
{
    int i;
    int len;

    len = strlen(cmdline);

    if (len == 0) {
        cliPrintf("Mixer: %s\r\n", mixerNames[masterConfig.mixerMode - 1]);
        return;
    } else if (strncasecmp(cmdline, "list", len) == 0) {
        cliPrint("Available mixers: ");
        for (i = 0; ; i++) {
            if (mixerNames[i] == NULL)
                break;
            cliPrintf("%s ", mixerNames[i]);
        }
        cliPrint("\r\n");
        return;
    }

    for (i = 0; ; i++) {
        if (mixerNames[i] == NULL) {
            cliPrint("Invalid name\r\n");
            return;
        }
        if (strncasecmp(cmdline, mixerNames[i], len) == 0) {
            masterConfig.mixerMode = i + 1;
            break;
        }
    }

    cliMixer("");
}
#endif

static void cliMotor(char *cmdline)
{
    int motor_index = 0;
    int motor_value = 0;
    int index = 0;
    char *pch = NULL;
    char *saveptr;

    if (isEmpty(cmdline)) {
        cliShowParseError();
        return;
    }

    pch = strtok_r(cmdline, " ", &saveptr);
    while (pch != NULL) {
        switch (index) {
            case 0:
                motor_index = atoi(pch);
                break;
            case 1:
                motor_value = atoi(pch);
                break;
        }
        index++;
        pch = strtok_r(NULL, " ", &saveptr);
    }

    if (motor_index < 0 || motor_index >= MAX_SUPPORTED_MOTORS) {
        cliShowArgumentRangeError("index", 0, MAX_SUPPORTED_MOTORS - 1);
        return;
    }

    if (index == 2) {
        if (motor_value < PWM_RANGE_MIN || motor_value > PWM_RANGE_MAX) {
            cliShowArgumentRangeError("value", 1000, 2000);
            return;
        } else {
            motor_disarmed[motor_index] = motor_value;
        }
    }

    cliPrintf("motor %d: %d\r\n", motor_index, motor_disarmed[motor_index]);
}

static void cliPlaySound(char *cmdline)
{
#if FLASH_SIZE <= 64
    UNUSED(cmdline);
#else
    int i;
    const char *name;
    static int lastSoundIdx = -1;

    if (isEmpty(cmdline)) {
        i = lastSoundIdx + 1;     //next sound index
        if ((name=beeperNameForTableIndex(i)) == NULL) {
            while (true) {   //no name for index; try next one
                if (++i >= beeperTableEntryCount())
                    i = 0;   //if end then wrap around to first entry
                if ((name=beeperNameForTableIndex(i)) != NULL)
                    break;   //if name OK then play sound below
                if (i == lastSoundIdx + 1) {     //prevent infinite loop
                    cliPrintf("Error playing sound\r\n");
                    return;
                }
            }
        }
    } else {       //index value was given
        i = atoi(cmdline);
        if ((name=beeperNameForTableIndex(i)) == NULL) {
            cliPrintf("No sound for index %d\r\n", i);
            return;
        }
    }
    lastSoundIdx = i;
    beeperSilence();
    cliPrintf("Playing sound %d: %s\r\n", i, name);
    beeper(beeperModeForTableIndex(i));
#endif
}

static void cliProfile(char *cmdline)
{
    int i;

    if (isEmpty(cmdline)) {
        cliPrintf("profile %d\r\n", getCurrentProfile());
        return;
    } else {
        i = atoi(cmdline);
        if (i >= 0 && i < MAX_PROFILE_COUNT) {
            masterConfig.current_profile_index = i;
            writeEEPROM();
            readEEPROM();
            cliProfile("");
        }
    }
}

static void cliRateProfile(char *cmdline) {		
	int i;		
	
	if (isEmpty(cmdline)) {		
		cliPrintf("rateprofile %d\r\n", getCurrentControlRateProfile());		
		return;		
	} else {		
		i = atoi(cmdline);		
		if (i >= 0 && i < MAX_RATEPROFILES) {		
			changeControlRateProfile(i);		
			cliRateProfile("");		
		}		
	}		
}

static void cliReboot(void) {
    cliPrint("\r\nRebooting");
    bufWriterFlush(cliWriter);
    waitForSerialPortToFinishTransmitting(cliPort);
    stopMotors();
    handleOneshotFeatureChangeOnRestart();
    systemReset();
}

static void cliSave(char *cmdline)
{
    UNUSED(cmdline);

    cliPrint("Saving");
    //copyCurrentProfileToProfileSlot(masterConfig.current_profile_index);
    writeEEPROM();
    cliReboot();
}

static void cliDefaults(char *cmdline)
{
    UNUSED(cmdline);

    cliPrint("Resetting to defaults");
    resetEEPROM();
    cliReboot();
}

static void cliPrint(const char *str)
{
    while (*str)
        bufWriterAppend(cliWriter, *str++);
}

static void cliPutp(void *p, char ch)
{
    bufWriterAppend(p, ch);
}

static void cliPrintf(const char *fmt, ...)
{
    va_list va;
    va_start(va, fmt);
    tfp_format(cliWriter, cliPutp, fmt, va);
    va_end(va);
}

static void cliWrite(uint8_t ch)
{
    bufWriterAppend(cliWriter, ch);
}

static void cliPrintVar(const clivalue_t *var, uint32_t full)
{
    int32_t value = 0;
    char buf[13];

    void *ptr = var->ptr;
    if ((var->type & VALUE_SECTION_MASK) == PROFILE_VALUE) {
        ptr = ((uint8_t *)ptr) + (sizeof(profile_t) * masterConfig.current_profile_index);
    }

	if ((var->type & VALUE_SECTION_MASK) == PROFILE_RATE_VALUE) {		
		ptr = ((uint8_t *)ptr) + (sizeof(profile_t) * masterConfig.current_profile_index) + (sizeof(controlRateConfig_t) * getCurrentControlRateProfile());		
	}

    switch (var->type & VALUE_TYPE_MASK) {
        case VAR_UINT8:
            value = *(uint8_t *)ptr;
            break;

        case VAR_INT8:
            value = *(int8_t *)ptr;
            break;

        case VAR_UINT16:
            value = *(uint16_t *)ptr;
            break;

        case VAR_INT16:
            value = *(int16_t *)ptr;
            break;

        case VAR_UINT32:
            value = *(uint32_t *)ptr;
            break;

        case VAR_FLOAT:
            cliPrintf("%s", ftoa(*(float *)ptr, buf));
            if (full && (var->type & VALUE_MODE_MASK) == MODE_DIRECT) {
                cliPrintf(" %s", ftoa((float)var->config.minmax.min, buf));
                cliPrintf(" %s", ftoa((float)var->config.minmax.max, buf));
            }
            return; // return from case for float only
    }

    switch(var->type & VALUE_MODE_MASK) {
        case MODE_DIRECT:
            cliPrintf("%d", value);
            if (full) {
                cliPrintf(" %d %d", var->config.minmax.min, var->config.minmax.max);
            }
            break;
        case MODE_LOOKUP:
            cliPrintf(lookupTables[var->config.lookup.tableIndex].values[value]);
            break;
    }
}
static void cliPrintVarRange(const clivalue_t *var) 
{
    switch (var->type & VALUE_MODE_MASK) {
        case (MODE_DIRECT): {
            cliPrintf("Allowed range: %d - %d\n", var->config.minmax.min, var->config.minmax.max);
        }
        break;
        case (MODE_LOOKUP): {
            const lookupTableEntry_t *tableEntry = &lookupTables[var->config.lookup.tableIndex];
            cliPrint("Allowed values:");
            uint8_t i;
            for (i = 0; i < tableEntry->valueCount ; i++) {
                if (i > 0) 
                    cliPrint(",");
                cliPrintf(" %s", tableEntry->values[i]);
            }
            cliPrint("\n");
        }
        break;
    }
}
static void cliSetVar(const clivalue_t *var, const int_float_value_t value)
{
    void *ptr = var->ptr;
    if ((var->type & VALUE_SECTION_MASK) == PROFILE_VALUE) {
        ptr = ((uint8_t *)ptr) + (sizeof(profile_t) * masterConfig.current_profile_index);
    }
	if ((var->type & VALUE_SECTION_MASK) == PROFILE_RATE_VALUE) {		
		ptr = ((uint8_t *)ptr) + (sizeof(profile_t) * masterConfig.current_profile_index) + (sizeof(controlRateConfig_t) * getCurrentControlRateProfile());		
	}

    switch (var->type & VALUE_TYPE_MASK) {
        case VAR_UINT8:
        case VAR_INT8:
            *(int8_t *)ptr = value.int_value;
            break;

        case VAR_UINT16:
        case VAR_INT16:
            *(int16_t *)ptr = value.int_value;
            break;

        case VAR_UINT32:
            *(uint32_t *)ptr = value.int_value;
            break;

        case VAR_FLOAT:
            *(float *)ptr = (float)value.float_value;
            break;
    }
}

static void cliSet(char *cmdline)
{
    uint32_t i;
    uint32_t len;
    const clivalue_t *val;
    char *eqptr = NULL;

    len = strlen(cmdline);

    if (len == 0 || (len == 1 && cmdline[0] == '*')) {
        cliPrint("Current settings: \r\n");
        for (i = 0; i < VALUE_COUNT; i++) {
            val = &valueTable[i];
            cliPrintf("%s = ", valueTable[i].name);
            cliPrintVar(val, len); // when len is 1 (when * is passed as argument), it will print min/max values as well, for gui
            cliPrint("\r\n");
        }
    } else if ((eqptr = strstr(cmdline, "=")) != NULL) {
        // has equals

        char *lastNonSpaceCharacter = eqptr;
        while (*(lastNonSpaceCharacter - 1) == ' ') {
            lastNonSpaceCharacter--;
        }
        uint8_t variableNameLength = lastNonSpaceCharacter - cmdline;

        // skip the '=' and any ' ' characters
        eqptr++;
        while (*(eqptr) == ' ') {
            eqptr++;
        }

        for (i = 0; i < VALUE_COUNT; i++) {
            val = &valueTable[i];
            // ensure exact match when setting to prevent setting variables with shorter names
            if (strncasecmp(cmdline, valueTable[i].name, strlen(valueTable[i].name)) == 0 && variableNameLength == strlen(valueTable[i].name)) {

                bool changeValue = false;
                int_float_value_t tmp;
                switch (valueTable[i].type & VALUE_MODE_MASK) {
                    case MODE_DIRECT: {
                            int32_t value = 0;
                            float valuef = 0;

                            value = atoi(eqptr);
                            valuef = fastA2F(eqptr);

                            if (valuef >= valueTable[i].config.minmax.min && valuef <= valueTable[i].config.minmax.max) { // note: compare float value

                                if ((valueTable[i].type & VALUE_TYPE_MASK) == VAR_FLOAT)
                                    tmp.float_value = valuef;
                                else
                                    tmp.int_value = value;

                                changeValue = true;
                            }
                        }
                        break;
                    case MODE_LOOKUP: {
                            const lookupTableEntry_t *tableEntry = &lookupTables[valueTable[i].config.lookup.tableIndex];
                            bool matched = false;
                            for (uint8_t tableValueIndex = 0; tableValueIndex < tableEntry->valueCount && !matched; tableValueIndex++) {
                                matched = strcasecmp(tableEntry->values[tableValueIndex], eqptr) == 0;

                                if (matched) {
                                    tmp.int_value = tableValueIndex;
                                    changeValue = true;
                                }
                            }
                        }
                        break;
                }

                if (changeValue) {
                    cliSetVar(val, tmp);

                    cliPrintf("%s set to ", valueTable[i].name);
                    cliPrintVar(val, 0);
                } else {
                    cliPrint("Invalid value\r\n");
                    cliPrintVarRange(val);
                }

                return;
            }
        }
        cliPrint("Invalid name\r\n");
    } else {
        // no equals, check for matching variables.
        cliGet(cmdline);
    }
}

static void cliGet(char *cmdline)
{
    uint32_t i;
    const clivalue_t *val;
    int matchedCommands = 0;

    for (i = 0; i < VALUE_COUNT; i++) {
        if (strstr(valueTable[i].name, cmdline)) {
            val = &valueTable[i];
            cliPrintf("%s = ", valueTable[i].name);
            cliPrintVar(val, 0);
            cliPrint("\n");
            cliPrintVarRange(val);
            cliPrint("\r\n");

            matchedCommands++;
        }
    }


    if (matchedCommands) {
    	return;
    }

    cliPrint("Invalid name\r\n");
}

static void cliStatus(char *cmdline)
{
    UNUSED(cmdline);

    cliPrintf("System Uptime: %d seconds, Voltage: %d * 0.1V (%dS battery - %s), CPU:%d%%\r\n",
        millis() / 1000,
        vbat,
        batteryCellCount,
        getBatteryStateString(),
        constrain(averageSystemLoadPercent, 0, 100)
    );

    cliPrintf("CPU Clock=%dMHz", (SystemCoreClock / 1000000));

#ifndef CJMCU
    uint8_t i;
    uint32_t mask;
    uint32_t detectedSensorsMask = sensorsMask();

    for (i = 0; ; i++) {

        if (sensorTypeNames[i] == NULL)
            break;

        mask = (1 << i);
        if ((detectedSensorsMask & mask) && (mask & SENSOR_NAMES_MASK)) {
            const char *sensorHardware;
            uint8_t sensorHardwareIndex = detectedSensors[i];
            sensorHardware = sensorHardwareNames[i][sensorHardwareIndex];

            cliPrintf(", %s=%s", sensorTypeNames[i], sensorHardware);

            if (mask == SENSOR_ACC && acc.revisionCode) {
                cliPrintf(".%c", acc.revisionCode);
            }
        }
    }
#endif
    cliPrint("\r\n");

#ifdef USE_I2C
    uint16_t i2cErrorCounter = i2cGetErrorCounter();
#else
    uint16_t i2cErrorCounter = 0;
#endif

    cliPrintf("Cycle Time: %d, I2C Errors: %d, config size: %d\r\n", cycleTime, i2cErrorCounter, sizeof(master_t));
}

#ifndef SKIP_TASK_STATISTICS
static void cliTasks(char *cmdline)
{
    UNUSED(cmdline);

    cfTaskId_e taskId;
    cfTaskInfo_t taskInfo;

    cliPrintf("Task list:\r\n");
    for (taskId = 0; taskId < TASK_COUNT; taskId++) {
        getTaskInfo(taskId, &taskInfo);
        if (taskInfo.isEnabled) {
            uint16_t taskFrequency;
            uint16_t subTaskFrequency;

            uint32_t taskTotalTime = taskInfo.totalExecutionTime / 1000;

            if (taskId == TASK_GYROPID) {
                subTaskFrequency = (uint16_t)(1.0f / ((float)cycleTime * 0.000001f));
                if (masterConfig.pid_process_denom > 1) {
                    taskFrequency = subTaskFrequency / masterConfig.pid_process_denom;
                    cliPrintf("%d - (%s) ", taskId, taskInfo.taskName);
                } else {
                    taskFrequency = subTaskFrequency;
                    cliPrintf("%d - (%s/%s) ", taskId, taskInfo.subTaskName, taskInfo.taskName);
                }
            } else {
                taskFrequency = (uint16_t)(1.0f / ((float)taskInfo.latestDeltaTime * 0.000001f));
                cliPrintf("%d - (%s) ", taskId, taskInfo.taskName);
            }

            cliPrintf("max: %dus, avg: %dus, rate: %dhz, total: ", taskInfo.maxExecutionTime, taskInfo.averageExecutionTime, taskFrequency);

            if (taskTotalTime >= 1000) {
                cliPrintf("%dsec", taskTotalTime / 1000);
            } else {
                cliPrintf("%dms", taskTotalTime);
            }

            if (taskId == TASK_GYROPID && masterConfig.pid_process_denom > 1) cliPrintf("\r\n- - (%s)  rate: %dhz", taskInfo.subTaskName, subTaskFrequency);
            cliPrintf("\r\n", taskTotalTime);
        }
    }
}
#endif

static void cliVersion(char *cmdline)
{
    UNUSED(cmdline);

    cliPrintf("# BetaFlight/%s %s %s / %s (%s)",
        targetName,
        FC_VERSION_STRING,
        buildDate,
        buildTime,
        shortGitRevision
    );
}

void cliProcess(void)
{
    if (!cliWriter) {
        return;
    }

    // Be a little bit tricky.  Flush the last inputs buffer, if any.
    bufWriterFlush(cliWriter);

    while (serialRxBytesWaiting(cliPort)) {
        uint8_t c = serialRead(cliPort);
        if (c == '\t' || c == '?') {
            // do tab completion
            const clicmd_t *cmd, *pstart = NULL, *pend = NULL;
            uint32_t i = bufferIndex;
            for (cmd = cmdTable; cmd < cmdTable + CMD_COUNT; cmd++) {
                if (bufferIndex && (strncasecmp(cliBuffer, cmd->name, bufferIndex) != 0))
                    continue;
                if (!pstart)
                    pstart = cmd;
                pend = cmd;
            }
            if (pstart) {    /* Buffer matches one or more commands */
                for (; ; bufferIndex++) {
                    if (pstart->name[bufferIndex] != pend->name[bufferIndex])
                        break;
                    if (!pstart->name[bufferIndex] && bufferIndex < sizeof(cliBuffer) - 2) {
                        /* Unambiguous -- append a space */
                        cliBuffer[bufferIndex++] = ' ';
                        cliBuffer[bufferIndex] = '\0';
                        break;
                    }
                    cliBuffer[bufferIndex] = pstart->name[bufferIndex];
                }
            }
            if (!bufferIndex || pstart != pend) {
                /* Print list of ambiguous matches */
                cliPrint("\r\033[K");
                for (cmd = pstart; cmd <= pend; cmd++) {
                    cliPrint(cmd->name);
                    cliWrite('\t');
                }
                cliPrompt();
                i = 0;    /* Redraw prompt */
            }
            for (; i < bufferIndex; i++)
                cliWrite(cliBuffer[i]);
        } else if (!bufferIndex && c == 4) {   // CTRL-D
            cliExit(cliBuffer);
            return;
        } else if (c == 12) {                  // NewPage / CTRL-L
            // clear screen
            cliPrint("\033[2J\033[1;1H");
            cliPrompt();
        } else if (bufferIndex && (c == '\n' || c == '\r')) {
            // enter pressed
            cliPrint("\r\n");

            // Strip comment starting with # from line
            char *p = cliBuffer;
            p = strchr(p, '#');
            if (NULL != p) {
                bufferIndex = (uint32_t)(p - cliBuffer);
            }

            // Strip trailing whitespace
            while (bufferIndex > 0 && cliBuffer[bufferIndex - 1] == ' ') {
                bufferIndex--;
            }

            // Process non-empty lines
            if (bufferIndex > 0) {
                cliBuffer[bufferIndex] = 0; // null terminate

                const clicmd_t *cmd;
                for (cmd = cmdTable; cmd < cmdTable + CMD_COUNT; cmd++) {
                    if(!strncasecmp(cliBuffer, cmd->name, strlen(cmd->name))   // command names match
                       && !isalnum((unsigned)cliBuffer[strlen(cmd->name)]))    // next characted in bufffer is not alphanumeric (command is correctly terminated)
                        break;
                }
                if(cmd < cmdTable + CMD_COUNT)
                    cmd->func(cliBuffer + strlen(cmd->name) + 1);
                else
                    cliPrint("Unknown command, try 'help'");
                bufferIndex = 0;
            }

            memset(cliBuffer, 0, sizeof(cliBuffer));

            // 'exit' will reset this flag, so we don't need to print prompt again
            if (!cliMode)
                return;

            cliPrompt();
        } else if (c == 127) {
            // backspace
            if (bufferIndex) {
                cliBuffer[--bufferIndex] = 0;
                cliPrint("\010 \010");
            }
        } else if (bufferIndex < sizeof(cliBuffer) && c >= 32 && c <= 126) {
            if (!bufferIndex && c == ' ')
                continue; // Ignore leading spaces
            cliBuffer[bufferIndex++] = c;
            cliWrite(c);
        }
    }
}

void cliInit(serialConfig_t *serialConfig)
{
    UNUSED(serialConfig);
}
#endif