	.syntax unified
	.cpu cortex-m3
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 4
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.thumb
	.file	"stm32f10x_iwdg.c"
	.text
.Ltext0:
	.section	.gnu.lto_.profile.7be5c9b74bf5536f,"",%progbits
	.ascii	"x\234cf```a\200\000F\006Q~\000\000\255\000-"
	.text
	.section	.gnu.lto_.jmpfuncs.7be5c9b74bf5536f,"",%progbits
	.ascii	"x\234cf\300\016d\2404\033\003##c=#\210`\002\021\314"
	.ascii	"\014\014,\014\014\254 &\003\000\"\256\002="
	.text
	.section	.gnu.lto_.inline.7be5c9b74bf5536f,"",%progbits
	.ascii	"x\234cf\300\016Z\2404\033\003\003\0133##\003#\003\003"
	.ascii	"\023\323\005~\006\266\005\362L qF\354\302L\330\205\231"
	.ascii	"A\302\250B,\230B\254\014\354lP\315\034\007\354\340\302"
	.ascii	"\014\000\326\366\012\374"
	.text
	.section	.gnu.lto_.pureconst.7be5c9b74bf5536f,"",%progbits
	.ascii	"x\234cf``\340e\200\0006\006)F)&)f)\026)V)\000\005\261"
	.ascii	"\000\302"
	.text
	.section	.gnu.lto_IWDG_WriteAccessCmd.7be5c9b74bf5536f,"",%progbits
	.ascii	"x\234eP=H\233Q\024\275\347~1\021\222!8Ivq\212_\033G"
	.ascii	"A,\210\322A\021R\020\\\202M\242\375@\255|\011\332-/"
	.ascii	"\022q\022\374\001\021\253\010\226\2426m\223\251Y\277"
	.ascii	":t\261\266:Y3\304\266D\260C\3014B\314 \366\2768\372"
	.ascii	"\340q\357\271\367\334{\316{\006=<\001\271# \032\224"
	.ascii	"\010\203\300K\337\210\322\315\014\350\204@)F\012\177"
	.ascii	"\270\302Xr\262\353\336\366\267J\251\253\203B\353|k\235"
	.ascii	"\211\252|\277\006\273h\027\312\321ba\333ct\203$?\374"
	.ascii	"}S\365]r\235\341\327p\343\364\342\332\320\220Y\303\343"
	.ascii	"\332\331Ww\333\033\245\346\234\303\274\352\221\272\201"
	.ascii	"=\030\262\017\373\010\340\035\002$%B\026m\232^\311\334"
	.ascii	"\236z\335\031\321\366\337k\342=\334b\233r-\216\272\273"
	.ascii	"\253\226\226\367Bh\0024\237e\322ET\026\232~\303\205"
	.ascii	"\010J4\212\230+-|\331\274\201\036\2551\327\030T\304"
	.ascii	"\301J\003\213\304\247\235\265\037\036m\260I\375T\312"
	.ascii	"\245U\317\313\337O\232\033%\322\260\370y\367\227o\013"
	.ascii	"\257\323J9/\353\354\306\007q\372Q\234\352fy\376o\321"
	.ascii	"\025\314\252\014\352\354A\016[\370\327\370\033\344\021"
	.ascii	"\0245*!\355\254\366k-]-\213\270\230\022FW\2079a=7'G"
	.ascii	"\255)3\374l\2403\324\367\370\321\253H8\031\033\212\333"
	.ascii	"\326\364\213H\257m\315\304m3aG\315Dr\26234\246\333\326"
	.ascii	"ll\274#J\376\247\303\275\375\221a\333J\306\237D\243"
	.ascii	"\361D\342?\324\346\226\260"
	.text
	.section	.gnu.lto_IWDG_SetPrescaler.7be5c9b74bf5536f,"",%progbits
	.ascii	"x\234eOK(Da\024>\337\177\307\243\010Y\351\356')\346"
	.ascii	"bv\224,D\212R\224\345\304\314\340\326\014\2723a\347"
	.ascii	"\237id;,\244\304\202d\030\217\235\235\272\254\254\310"
	.ascii	"\012C\0365\304B\231\241\230\"\316?\226N\235\316\353"
	.ascii	";\337w\216F\377Mgo\002Q\027Gh\004\021?!\212\024\013"
	.ascii	"@%\004\232\026\230\306\263\310\010\304\355\344bI\365"
	.ascii	"\272\224\3625zP5S\225\023Do\342\217\006\033\250f\310"
	.ascii	"\365e\342\270Tk\001q\236\375J\236\225;\327\244\214\332"
	.ascii	"\307\273\262\0259\346L@\343\015\324\352\250\321\211"
	.ascii	"\033\204M8\0258\023\373>/)\2141w\305\037'\266P\310g"
	.ascii	"\321^\245-\177~\336\336\347\022\315(\000\024^\360&C"
	.ascii	"\322\354\352\306\007.8j)Dof\037W>\241V?\204\370`\372"
	.ascii	"\024\216\346\3635K\354\257.\\\024=\211\234\320\344\235"
	.ascii	"\224\016\245z\233>=+\316\267H\225\251\303\215\373\322"
	.ascii	"e,E\244\264\307r\302\201$tlC\317\017\3233/)G]R\306\370"
	.ascii	"\221\002\354`\031\331\374\357\330E\035\253\321\015\""
	.ascii	"\366U\207\322R\3354\213\363Q\214hv\031\001s\320\010"
	.ascii	"\016\230\243Fo_\267\273\261\275\241~\312\323\033\366"
	.ascii	"\365\370-s|\304\323f\231\023~\313\010Y^#\024\016\272"
	.ascii	"\033\207\324\330\234\364\015\273\274T\326\331\337\326"
	.ascii	"\341\351\261\374!\357@\300o\375\002\0210\210\300"
	.text
	.section	.gnu.lto_IWDG_SetReload.7be5c9b74bf5536f,"",%progbits
	.ascii	"x\234ePK(\204Q\024>\337\371\307P(Yi\226JV\374\036K%"
	.ascii	"\013Y(%\254l\204\031\374\345\325\020v\356h\260E\221"
	.ascii	"HD\362\030\257R\226\374d\241\024a\201)\317~\305By\025"
	.ascii	"\2434\316\035K\267n\347|\347|\347|\337\275\006\375?"
	.ascii	"\036\271\325 *\226\010\203\300CGD\201\004\006tB\240"
	.ascii	"^F/\236\370\2251d\207\306\0233\347\225R/\247;i\375i"
	.ascii	"\021&z\347\2775X@\246P\316\246/\367a\024\202$?\274\377"
	.ascii	"zOz\344\010#E\303\211\363\207\017CCf\015\257\006\234"
	.ascii	"\231\344\2149\245\372\354\355\015U$u\003\2130d\037\226"
	.ascii	"\340\3012<$%B\010\031\232\376\032\3749Ot\007E;\345O"
	.ascii	"\023+p\213mZO\265U4\272\031\035>H\3478@\363Y&]D\216"
	.ascii	"\320\364\033\036DP\242\021F\337\365\340\321\3427\364"
	.ascii	"\350'\363'\203\302\330\033\211a\221\330\232\035\273"
	.ascii	"\210\327\006\343\324\255R.\255z\343\034\237$\304J\244"
	.ascii	"axw\341.i\012\223\001\245\354\266\010\273\261*N\327"
	.ascii	"\304\251n:\375\317aWVH\005\021\341x\254c\012o\261\277"
	.ascii	"\301\006\262D\215\256\021\260GK\265\226\256:\".\246"
	.ascii	"\204Q\220m6[ufK\255\325jVV\225\345\347\225\344\346\364"
	.ascii	"\324Tvz\313}~\253\275\251\246\330ou\371\374f\207\277"
	.ascii	"\336\354\350l\311\317k\320m\253\333\333\230]O\356\012"
	.ascii	"_s[\255\367\027\355Q\222\377"
	.text
	.section	.gnu.lto_IWDG_ReloadCounter.7be5c9b74bf5536f,"",%progbits
	.ascii	"x\234cf\300\004R@\374\003\210m\201\230\221\231\201\221"
	.ascii	"i\3029\006\206F\016&FF\020\203\201\221\241\236\211\261"
	.ascii	"\236\361%\323G&\306\011\007V\317\340V_\332\320\320\360"
	.ascii	"a\321e\211V\211\237L\014\014\237\231 \3060.gTg\000\252"
	.ascii	"\371\330\362\367:7[\013P\215\000D\216q\005#\033#\220"
	.ascii	"^/t\240\341\377\377\317g'\255Pgbf`x\002\224\003Y\360"
	.ascii	"\224\211\011D3\337b<\364a\303\271C\374 \345@c\266-\232"
	.ascii	"v\203\375\005\323O&\306\206\007\015\015, \223\357?9"
	.ascii	"\177\221\003,\304\000\342\336:\270\374!\317\\\306\331"
	.ascii	"\215\015\015\007\362\177211\256d\224b\\\305(\005\226"
	.ascii	"|\322\372\366\026\213\356\352\206\026\306\237L\314\214"
	.ascii	"\253\031\3472~\002\273\223q\015\243.P\372\310\321\305"
	.ascii	"'xAF1\257\272\312\304\300\270\026\250\353\036c\343\201"
	.ascii	"\335^ \333A\352\236\000-\001\272\012\250\307ZO?'3I?"
	.ascii	"713O?8\304\327\330\310\315\320\240\">\270$% \265(\263"
	.ascii	" #\336\245(\263,\265H\277\270(Y\277\270$\327\330(\015"
	.ascii	"$\235Y\236\222\256\227\314\000\000.\356q\024"
	.text
	.section	.gnu.lto_IWDG_Enable.7be5c9b74bf5536f,"",%progbits
	.ascii	"x\234cf\300\004R@\374\003\210m\201\230\221\231\201\221"
	.ascii	"i\3029\006\206F\016&FF\020\203\201\221\241\236\211\261"
	.ascii	"\236\361%\323G&\306\011\007V\317\340V_\332\320\320\360"
	.ascii	"\341\320U\211V\211\237L\014\014\237\231 \3060.gTg\000"
	.ascii	"\252\371\330\362\367:7[\013P\215\000D\216q\005#\033"
	.ascii	"#\220^/t\240\341\377\377\317\327&\275\320fbf`x\002\224"
	.ascii	"\003Y\360\224\211\011D3\337b<\364a\303\365C\374 \345"
	.ascii	"@c\266-\232v\203\375\005\323O&\306\206\007\015\015,"
	.ascii	" \223\357?9\177\221\003,\304\000\342\336:\270\374!\317"
	.ascii	"\\\306\331\215\015\015\007\362\177211\256d\224b\\\305"
	.ascii	"(\005\226|\322\372\366\026\213\356\352\206\026\306\237"
	.ascii	"L\314\214\253\031\3472~\002\273\223q\015\243.Pz\316"
	.ascii	"\247\3565\\ \243\230\317\314\004zy-P\327=\306\306\003"
	.ascii	"\367\275@\266\203\324=\001Z\002t\025P\217\265\236~N"
	.ascii	"f\222~nbf\236~p\210\257\261\221\233\241AE|pIJ@jQfAF"
	.ascii	"\274KQfYj\221~qQ\262~qI\256\261Q\032H:\263<%]/\231\001"
	.ascii	"\000\2227qe"
	.text
	.section	.gnu.lto_IWDG_GetFlagStatus.7be5c9b74bf5536f,"",%progbits
	.ascii	"x\234eP]H\223Q\030>\3179\337~l#\245\253\370.\352BD\202"
	.ascii	"\364+wW\020\005\242\005\005\205A\027],\247V\203\014"
	.ascii	"\331\326\317E\340\331O\024\344EHdX^T\244\345*5K\220"
	.ascii	"\242\226\024!\263B\262\346V\330\212\255\037\"\312\014"
	.ascii	"\346\210Z\357\371\226\021t\340\373\316y\377\236\347"
	.ascii	"y\037\301\376?.\372<\234\261mt\303\302\300O>a,h\347"
	.ascii	"\\\273\263\214\311Eb\312`\322)\240\025\323\032\240\036"
	.ascii	"\014\254\235\013\015\355\370\310g9&F\177=C\345%)C_;"
	.ascii	"\223m]\247v\345\011p\2163\254\324\261BW\355}\250\244"
	.ascii	"\276O\347\362\257\354b\035\030\275\343o\347\347\234"
	.ascii	"\037x\236\243L\205\335\211\354w\241B\316U\030N%\037"
	.ascii	"/\256\270H\210\261\351A\271\236\362\002\227!\024\346"
	.ascii	"\025\350\350\207\316(\305\020E\205j\277\033\375\362"
	.ascii	"\303!6\232\300\343\343\211~g\371y\032M\307\037>r\310"
	.ascii	"32\222.\024\226\223$\\-\",\250R\207\006f#?\023\016k"
	.ascii	"DJY\206k(W\302I\361uXA\227\312\014,\211\311Ba8\333y"
	.ascii	"|\015\267\201\251\224 z\215\314 ~\213zZ\325\217\261"
	.ascii	"\014\215*\177\262\264\005\335\342\005B\261\256\023\245"
	.ascii	"&\030M\021\331\353\314\323I\273\332Sq\014\320\032)\214"
	.ascii	"\215\014\275\0373{r\\P\313\310\205\323\3236\325b\221"
	.ascii	"i)5\366\357\224\305T\234\272\337\367\306\331\203\263"
	.ascii	"\310s+\006\311\217!\002R\205\314\321\317)\255**#T\261"
	.ascii	"\341\006z\360M\0211\014\243\212\230B3\307&\226\026\211"
	.ascii	",9\322\233Bx\336Z\214\0257e\331sD\222a\375O\216\020"
	.ascii	"\203\275\267;L1\264\035n\242h[\226\254\2372\314\355"
	.ascii	"F\343\177\2673\327QEma\3672\323\253\034\007\233A0v/"
	.ascii	"\216\".\371\372\016 \360\311\356\336p\251i\006\271z"
	.ascii	"\013:\357xyD\241\210\007;\311J(\030\222\277\266\332"
	.ascii	"\330\347\365\030\255\215\336\375F\303\366-\256\232\272"
	.ascii	"\325\253\016\273\033\002\315[[|\336\266\275\356Z\237"
	.ascii	"\367`\213\317\360\373\232\014\177\240\325U\263[\225"
	.ascii	"\275\207\232\367T7\261\222M;j\353\335u\2337\324\227"
	.ascii	"x\274\001\177\2401p\300\377\033\313\354\3573"
	.text
	.section	.gnu.lto_.symbol_nodes.7be5c9b74bf5536f,"",%progbits
	.ascii	"x\234cf``Hb\200\002&\331z\006\206\011\347\030\030\352"
	.ascii	"\353\031\346-\340``\222\253gD\341\313\3273\241\360\025"
	.ascii	"\352\231Q\370\212\365,(|\245zVd>\003\000\017\201\032"
	.ascii	"\004"
	.text
	.section	.gnu.lto_.refs.7be5c9b74bf5536f,"",%progbits
	.ascii	"x\234cf```d\200\002\000\000=\000\005"
	.text
	.section	.gnu.lto_.decls.7be5c9b74bf5536f,"",%progbits
	.ascii	"x\234\225UkL\024W\024\2363\263\300\262l\321J\213\015"
	.ascii	"IS\260\015\251\215\272*M\323\244M\332\006\324\230\326"
	.ascii	"\206\2626\376\360\307feG\335\204Wv\007\253M\177\014"
	.ascii	"\202\206\242\345\261\001T0\204\012(P\005DA\005D\020"
	.ascii	"\304\025\320J\205\202Uy\371\250<\024\260>\220V\267\347"
	.ascii	"\336\331a\326\272\030z\223\2633\347\3169\3379\367;\347"
	.ascii	"\236\345\030\206i\006\206q\340\032V3L\005\276{\341^"
	.ascii	"8\243,O\224*\224F\224&\224\026\024;J\027\363\362\"v"
	.ascii	"j\247\277/\212\026\345(J\020\312\004\312\030\312M\024"
	.ascii	"\014\303\214:\237Unp\032\235q\011N\335\014\376C\316"
	.ascii	"g\243\033\377\246\377\221\307\260\363\331\344\006\207"
	.ascii	"\234U\345\304\231)\377\0267~\366Y\370\331\335\370u9"
	.ascii	"\363\356\230E\336#\316\247\273:L\260\32068\371\227\366"
	.ascii	".\013\276\232\271D\315\351\276\375\220CU\253a\211\232"
	.ascii	"\325\232\233\346\301\261@\336\013\366\016tj\026\225"
	.ascii	"\212\242\230,6\364\200\002\221>`\273\242\342\346Q\243"
	.ascii	"\204\203\265\273\275\320?PC?\355\031\231<\256\246\252"
	.ascii	"\303\301\341\006{\340\306\345\001o\010\326\024\"\314"
	.ascii	"\370\351\352\011\020E\025\224\203\006~\001\016Ja\021"
	.ascii	"I\226\370\222\225,\212\333E1Q\364(\366e\340\020\004"
	.ascii	"@1\0040P\006\301hAm\3410n\036\301M\004>6x\177\227F\006"
	.ascii	".mJ\365'\300G\021\270D\001\3068\257B\256p\213\014ec"
	.ascii	"\317F\325*\026\375\011\334z\025=r\363d\364\374,\221"
	.ascii	"\254Dq.\013\341\376\3230\014\034\203\371\370[\011*\211"
	.ascii	"\236'\223'\273\274\270\037(=Ok3\246\274\003\363\304"
	.ascii	"\374\212\361\342\035cK\367\211\371\011\342s\207\003"
	.ascii	"\250\023\034\237N\225!\3574U\250\202@BdG\317\011\025"
	.ascii	"\327\016\024%\345ZI\273\027\327\011/0\356/1\236\332"
	.ascii	"\226\323\310Q\325A>\263\266\233\017\213\0004\301\364"
	.ascii	"\310\3436\221{\213\201E\001\260\020\317[\213\347\365"
	.ascii	"w\236\367$f\177\012\263\227\3522UG\353R\203\347=\241"
	.ascii	"\320\347\257\221K\316\366w\027}\343\036\364\364L\240"
	.ascii	"\245\211mo\022\320:\004\255V@k`\032\025\362\036\344"
	.ascii	"\244JL\327M3\335\327\234\234\0133R}\206R]/S}\272\345"
	.ascii	"\357r\216\353\225\210\251N\313~\344#s=\345\3125zA\203"
	.ascii	"\013\327\0152\327\215\224\353\334\347\266a-7.\241\344"
	.ascii	"\356x\224\355AQ\362\237\025x\026\213\015\016\307g\264"
	.ascii	"Xg]\000\316\312\000M\024\240\372\351\343r\317\031sn"
	.ascii	"\2469\257w\246\\u\241\371\200\232sH\301v\365\2276xI"
	.ascii	"\301r\212\344`h\017\347\\\202\235\223\203\265\320`C"
	.ascii	"\235{*\264\234M\272\243\267l{JT\022\300\341\027\000"
	.ascii	"\316\273\000\234\227\001\354\024 \241\274\265\007\270"
	.ascii	"<\011`\367\355\366n\037\256DR\332\206\332\0074\\\271"
	.ascii	"\244\344_\355\315f\2618\320\206P\357\005H\311\327^\237"
	.ascii	"\362\"{\255\270\367n\000\264\003\251\031[S\376`\247"
	.ascii	"\006\324\301;i{lO\340\366\372\312\375\301\300%P\223"
	.ascii	"L\340Wl\224\213\240z\261IF\206\012\264y\242\250&V\214"
	.ascii	"\234\360t\327m\267\015d\342\035W\023\323\206\0364c\240"
	.ascii	"\003\321.(\335D\334\350r\023\032.c\304\231\242\317p"
	.ascii	"\317\247\372\222J\275\\+I\342)\245\274BK\371\233\334"
	.ascii	"~?\355O\271\004\334\270\304W\332\265\244J\255\263\375"
	.ascii	"\212*\215\031\211b\246\330\357p\274C\275\240\323\245"
	.ascii	"\036\235r=\272h=\262\352\366\333\274\351D\026\301uB"
	.ascii	"k\245\011\235\233:z\300\233K\344\350\267Se\017/\372"
	.ascii	"P\333@\242\326\330\354{=\251\251\312u4\004I\243\241"
	.ascii	"/\367i\2417U\311\377\370\034\262u\246~\262E\303\245"
	.ascii	"K`\273\223\373/h\270}Ta\355w\304\002\337\351Amky\233"
	.ascii	"\334\335~$\246Wa;\310u\234\246'\212\336v$\373*\262\363"
	.ascii	"\007\031\247}Hq\220s\022\\\303\315\353\322\240>\367"
	.ascii	"O}\222\207<;^r\032t\343\344\034\0376:\322\0070\205\033"
	.ascii	"J\012\375.\343\343\336\331\302\255\232dR\250Y\301\242"
	.ascii	"\307\340\275S),W(\035?\347\376\221\034\226;$)\231\345"
	.ascii	"?\333=\271RI)\314\312>\354AiU\023\365`\346\223\037\347"
	.ascii	"pe\364\233g\306\304\304&X\200\313/8_LJ\034\037)\251"
	.ascii	"|\343H\245\330\220\304\301ML\3656\246z\017\374\224L"
	.ascii	"\336'}s\225t\017C\354\363[;L\262\355\235\377\332\376"
	.ascii	"I\233\354\203i\3336\305\366\256{[\027`\273b|\313m\022"
	.ascii	"\0247\203tv\272(~.0\360;~\356\2460\304\230\334\222\373"
	.ascii	"H\333(,\200!\224a\224\021X@\311&\025\351\257\3570\221"
	.ascii	"\202\240\355\3137\265\267\267\371\361k\340\027\354\016"
	.ascii	"\036\306\021uV\021\332;\264\"\300\030\232\366(\025'"
	.ascii	"\361\344\212\247\335y\362\2756Ei$j+\237\222\201\011"
	.ascii	"\320\322{E\236\352xs\214\260\354#\203\340\271\352\353"
	.ascii	"o\003C\031\215\301 \357|\250\213\267ZtFK\364\342\230"
	.ascii	"\330\030~1o\334`\326\231c\"\243\342M\274.\332\030\271"
	.ascii	"\331\034\303\353\014&~\2431>J0\010\333\342x\353\222"
	.ascii	"\315\314\302W8Y\267Yu\006\253`B|\264\364[\275.l\225"
	.ascii	"a\235\305,\360_DF\362Vkh\264\351\223%\272(\363\006D"
	.ascii	"7\307\350\364k\327\204,_\271l\351V\203^0\205\363\026"
	.ascii	"s\334fC\230\305\274\205\267\350\254\226H\235U\210\016"
	.ascii	"Y\276\221|6\177g\332\264$\222\361\"y\177l\020\274\245"
	.ascii	"\023\340\333\3534\202\236\027\302-\2745\322\030\305"
	.ascii	"[|\345\235\010>*\326h\232GU\351=46>F\340->tkE\214qC"
	.ascii	"\024\257Y\031e\334\244\027\214B\274\325#b\205~\305Z"
	.ascii	"\016\345S\227\024C\327\350W\353\3617D\027\306o1G\362"
	.ascii	"\372\370\270\270X\213\200\251+\331+\211\342\231\245"
	.ascii	"\200\253xAA\326\322\255\265H_\030\277\221V#d\271Ap\226"
	.ascii	"\201\274\262_F\260\341\021\\\304W\021\254>\342_\340"
	.ascii	"%d\252"
	.text
	.section	.gnu.lto_.symtab.7be5c9b74bf5536f,"",%progbits
	.ascii	"IWDG_WriteAccessCmd\000\000\000\000\000\000\000\000"
	.ascii	"\000\000\000\000\265\000\000\000IWDG_SetPrescaler\000"
	.ascii	"\000\000\000\000\000\000\000\000\000\000\000\301\000"
	.ascii	"\000\000IWDG_SetReload\000\000\000\000\000\000\000\000"
	.ascii	"\000\000\000\000\303\000\000\000IWDG_ReloadCounter\000"
	.ascii	"\000\000\000\000\000\000\000\000\000\000\000\306\000"
	.ascii	"\000\000IWDG_Enable\000\000\000\000\000\000\000\000"
	.ascii	"\000\000\000\000\310\000\000\000IWDG_GetFlagStatus\000"
	.ascii	"\000\000\000\000\000\000\000\000\000\000\000\325\000"
	.ascii	"\000\000"
	.text
	.section	.gnu.lto_.opts,"",%progbits
	.ascii	"'-fno-trapv' '-mthumb' '-mcpu=cortex-m3' '-ggdb3' '"
	.ascii	"-Os' '-flto' '-fuse-linker-plugin' '-ffunction-sect"
	.ascii	"ions' '-fdata-sections'\000"
	.text
	.comm	__gnu_lto_v1,1,1
	.comm	__gnu_lto_slim,1,1
	.ident	"GCC: (GNU Tools for ARM Embedded Processors) 4.9.3 20150529 (release) [ARM/embedded-4_9-branch revision 224288]"
