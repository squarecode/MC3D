F1_TARGETS  += $(TARGET)
FEATURES    = ONBOARDFLASH VCP

TARGET_SRC = \
drivers/accgyro_mpu.c \
            drivers/accgyro_fake.c \
            drivers/accgyro_mpu6050.c \
            drivers/barometer_fake.c \
            drivers/barometer_ms5611.c \
            drivers/compass_fake.c \
            drivers/compass_hmc5883l.c \
            drivers/light_ws2811strip.c \
            drivers/light_ws2811strip_hal.c

