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
	.file	"timer_stm32f10x.c"
	.text
.Ltext0:
	.section	.gnu.lto_.profile.6a205bdf67921ce0,"",%progbits
	.ascii	"x\234cf```a\200\000F\006I\011\000\000\276\000:"
	.text
	.section	.gnu.lto_.jmpfuncs.6a205bdf67921ce0,"",%progbits
	.ascii	"x\234cf\300\016\270\2414#\0033###{}}=\003\000\006R\001"
	.ascii	"\232"
	.text
	.section	.gnu.lto_.inline.6a205bdf67921ce0,"",%progbits
	.ascii	"x\234cf\300\016\346BiF\006\006)~Fv\306\214\217L\214"
	.ascii	"\215\313v\367\260\277`\372\311\004\022_\316(\305\300"
	.ascii	"\230\011\241@\222K\246N[\303\012\226\344``\\\001\221"
	.ascii	"\004Q \023\030\201\230\011\210y\200\032\331\026\310"
	.ascii	"310]\340w``Y \337\300\310\300\322!\334\300\310\001\344"
	.ascii	"\36070*p\000e\330\017\200h\236\007\272\020^\003\023"
	.ascii	"\210\376\307\336\300(\002\242\016\000)\236/\372\"`\307"
	.ascii	"\001\000V\\\0379"
	.text
	.section	.gnu.lto_.pureconst.6a205bdf67921ce0,"",%progbits
	.ascii	"x\234cf```f\200\000F\006)\000\000z\000\""
	.text
	.section	.gnu.lto_TIM_SelectOCxM_NoDisable.6a205bdf67921ce0,"",%progbits
	.ascii	"x\234\215T[LTW\024=\373\234\373\232\007\016B\004$JH"
	.ascii	"\0241&:U\277\372cL4\032\223\232\372\341?1\200\221\244"
	.ascii	"\240\0025\376y\007\246CjL\253$P\037!>\252X\024AQ[^\325"
	.ascii	"\001\211\342\003M\243\2401d$\015\030!\375\220J\004j"
	.ascii	"\313u\357s.\010\226\240\223\314\276g\357Yk\235}\366"
	.ascii	":w\004\373\377\347+\374\372\014\3066\343\023L\006\374"
	.ascii	"\360C\306B\026\347Zk\032\263\275\342I\220\331~\301\265"
	.ascii	";\001\314\364\273\3530\323\300P }ra\000\320\202\001"
	.ascii	";\300\205\246\033p\000\006\3710\207\303\321\213G}\231"
	.ascii	"\347l\333~\335p7\264-\012\343\234\2617\\\355\014\347"
	.ascii	"!\0231C\235\003-\226X\016\014\327Mu#]\276W|\234C:\245"
	.ascii	"\315\345\235G\015J\271F\351\367\315u\265\376\214\237"
	.ascii	"m\273$\332\333`\257\327\306\271\200_@\240\036\324@*"
	.ascii	"\\\200T\206%\006\027!\003\321\343\025\325\335^\261R"
	.ascii	"\352\336\377s\354\215_\352\306Sz\374\351\300\210\220"
	.ascii	"\272\234\322\013\316\231*C\351\276\273l\257\307\272"
	.ascii	"\006\265J\367\022\352\326I]\215A\275\324\355*o\0331"
	.ascii	"\305\227R\327\376\241\257\336e\326\224\032\313\211x"
	.ascii	"y\026\342\025\310 \364\337\337\325\014\372\304F\311"
	.ascii	"\254=t\360\274w\311id\366u5\346D\303\247\354\011\307"
	.ascii	"\301\361\350\3200\363D\352\203\214\341\360\177O}F\030"
	.ascii	"g\031\017Wa\211\032#\\\003\003\360A\225\372\204\250"
	.ascii	"\3558W\253\333*\215t\0164\005\234\005\3265\031u\240"
	.ascii	"\376\015l\3100)X\030L\217\374\311\213K\313Oy\034\205"
	.ascii	"\000\205x\240\256\347\0232\201\362D\012\013(M\242U\262"
	.ascii	"$\246\020q!\345tPs\021\205\305\024\322(0\326\217-\322"
	.ascii	"\275\030\3009\343S\364@I\364\304^\3313\262\361L/\372"
	.ascii	"\037\375a\221\021:\236\341:\236\3669\224\304\312^~K"
	.ascii	"\220Q.F\221\327\003|\222\200\025\004\224\226G\206t\005"
	.ascii	"\320\260\202*\307F\037\334\016\220\212\231\302\340W"
	.ascii	"T\231\301\321X7\204\237\225:+\024GGB\250\272\345\220"
	.ascii	"I\004\274\367\360\233;\344\001T\177\022\024\022<\304"
	.ascii	"?\200\317VT\326\352\022l1h\234\002k\354]\246\300nb\221"
	.ascii	"\207\225B\241\027 \001\226\252C\230\252\224\204U\331"
	.ascii	"\263\241\362d\331t\322\314\016\223\211\361\254\354e"
	.ascii	"\304\243@)\252\324\376\326\253\362\205\323'e\311\313"
	.ascii	"p\374Hc\217\247\012N\204\302xg<H\201&\352\014\232\241"
	.ascii	"\012h\2771w\277T\305\036\233\370\353\266GN\350G\307"
	.ascii	"q\002\014Z\344\254\333\313\201`s\350\265\242\036\252"
	.ascii	"\310n\016\376\343\212.\232\203\360\273j`j\000\213Gy"
	.ascii	"<54\342r\323\220\216\325\317\332\374\206\334<M\216["
	.ascii	"g\025\313\2044?v\307\035\267\353\317\253\312\316\276"
	.ascii	"y\322\237\177\035\274\3607\345\311\320\226\007\240`"
	.ascii	"&\"?r\305\302\352tW<\322\025k\246+\036\345\312\3332"
	.ascii	"\327\025\257*M\271\342\237\245s\257\333y\364#\033\342"
	.ascii	"\024<\322\3758&[5\235\223\023dC\333'l\230\324k\227\223"
	.ascii	"\210S6\334KQ\242\2019\010\267\334\006z#\275\232B\317"
	.ascii	"G#\344\365\225\257X\207[M\300\037\246\333\223\210\262"
	.ascii	"X\375\254\246:dS\211\322\036C\276\3371\010E\177\332"
	.ascii	"D4zG\3729P\025\377\0032V\005\213\012\263\203\371;\362"
	.ascii	"\012\2029\205y\373r\013\213\202\305y\371\271\205YE\305"
	.ascii	"\371k\327\354\\\375\305\376U\331L\333\276e\353~\037"
	.ascii	"\206\254\015\273v\024\024\344~\343\245\365\327\033\266"
	.ascii	"\356\316\311\025\305\371{\336\003_\303\032@"
	.text
	.section	.gnu.lto_.symbol_nodes.6a205bdf67921ce0,"",%progbits
	.ascii	"x\234cf``\020b\200\002&\331z\006\206\011\347\030\030"
	.ascii	"\352\353\031\346-\340``\000\000(h\004V"
	.text
	.section	.gnu.lto_.refs.6a205bdf67921ce0,"",%progbits
	.ascii	"x\234cf```d\200\002\000\000=\000\005"
	.text
	.section	.gnu.lto_.decls.6a205bdf67921ce0,"",%progbits
	.ascii	"x\234\325W[PTG\032>}zP\3460\314\244\312\212IY\233-d"
	.ascii	"+T\326J\034\001cLU\036\222\014l\326\007\\\213!\373\262"
	.ascii	"\017,\302XN\025\242\305%e\336\016\014k\020P\020A\201"
	.ascii	"aqV\010\210\021\242@\274a\010h@ \210\032ADA.&^\271\006"
	.ascii	"\024\220\313\354\337\335\303\364a\366\224\225\327=5"
	.ascii	"\377t\177\247\277\376\346\357\277\377>s~,\010\302^0"
	.ascii	"'\\v\203 \204\212\202\000\037a\033\030\002\363\023\330"
	.ascii	"E\372\177@\302\377\\\344\236\344\342\353\301t`\253\341"
	.ascii	"^-\264\177Bl\376Z\260\000\350\277\215^\2555!\242\237"
	.ascii	"\206f&u\217E\244\227^#\260\260\373\327)\014P'\211\004"
	.ascii	"v\015~\237\263\222\216\312^\004?\252\037\226E:\274\215"
	.ascii	"\300\231c?>\365\305\"\"\375\222\374\301N\351\335\223"
	.ascii	"\262,\247\311\015\343\210\377BrY]&\321\360\223(<\372"
	.ascii	"l\246\326\233B\247\023\223\033ym\366,/\374:\025\311"
	.ascii	"\036\314\271\245\301\177$}\361x\337\215A-\012\220JA"
	.ascii	"r\274\347\354\004\222e\015\252F\022:\2150:\205\336%"
	.ascii	"\353\"\232\344J\223\345\024Y\266\311^'\364\002*Gk\320"
	.ascii	"\011\264F@gP\0000(\027U\302\315*\270\011\3025C\243\031"
	.ascii	"\322\222p\375\225\203\253\211p-\010\177\313\205\341"
	.ascii	"w^\245\\\243\252\214\252\237\227\234\220\2444\302\377"
	.ascii	"\275SR\013\234\3171NCt\371\245w\262\2120\316d\240p\366"
	.ascii	"\333\012\037|\204\201\013US\327|\350F\370\021\330!\347"
	.ascii	"g\353q!\033\353\237\356\277\3146i\003\235Wp\365\236"
	.ascii	"\006\227\272\024\363\216\234\362\242\033\346M\340\303"
	.ascii	"\312\346\022=\256`c\231\327;\263\264\270\206\001\347"
	.ascii	"\331\374V_|\236\201\262\334\351\375\006|\231\201\245"
	.ascii	"\014\321\261\014\231[\254\030\363\305Mllv\256\263G\304"
	.ascii	"\327\031\270\335t\267\327\027\337b\240\355\366\340q"
	.ascii	"/\334\307@\301t{\263\201J\274I\340\313\314\232f\021"
	.ascii	"?`c\323v\233\315\200G\030\250\2742\227\352\203'\031"
	.ascii	"p\224/8\365xay\000t,\000\275\303\225\017t8\205\245^"
	.ascii	"Q\343\323\233\2768\223\201\202\231\303\363+q6\003\223"
	.ascii	"C)\213\010\0272pb\250#\307\227J\274CW\3349\332\243\305"
	.ascii	"\305l\354X\356\254\011W\260\276#\267\276\304\013W2p"
	.ascii	"q\"c\312\033\237\027\227EZ\307\"\235^\2361d\300\227"
	.ascii	"\330\330\243\312\346z\035\276\352:\014/\033\355>\270"
	.ascii	"\235\201\342\331}\351\022\356f \271\241\362\026\223"
	.ascii	"\330L\340\360\375\274\021\011\367\2621\373\330@\037"
	.ascii	"\306\217\030h\311x\221\255\305\303\014t\214\333\236"
	.ascii	"\030\3604\003\325%_\237\325R\211\217\011l\277\321\320"
	.ascii	"\246\305\363l\254+\371\341m\021\177\205)8<P\366\002"
	.ascii	"\342\302\300\301\356\233]+\361Q\006.\234\311\236\325"
	.ascii	"S\211\277\022x\246\252g\336\033\333\331X\353w\007\032"
	.ascii	"$\\\306@\335\311\362\366\025\370\033\012\326\035\352"
	.ascii	"\350\351\363F\376\256k\225\377+\257\000\177\177\207"
	.ascii	"\234j\033\037\275v\361\365\312\323rC\012F\337\301\031"
	.ascii	"k\20536\201V\361sq\025\276\004t\201|\013\0168l\003\327"
	.ascii	"\273\366\344\313\216FD\217\344EO\372;\204]\347f;z\272"
	.ascii	"\376I\244\011\267\336\223\373=\225.w\221Sm\003\367\273"
	.ascii	"j\021\323&\256\374\350\311\277\354\351J\237\322\225"
	.ascii	"+\352\364r\356\313\376n\267/\275\236\344{\236\276\314"
	.ascii	",\363\345\206'\377&\345\257[\242;\206\331:\011\367'"
	.ascii	"On;\347\036\202g\232\234-\313\037\307\013\250\002\306"
	.ascii	"O\322!\302\206\007\017\312\026\003\320<\362G_\211\376"
	.ascii	"h\026\332\247`6\350?\203\366_\320>\207\366 \264#\320"
	.ascii	"\016\203\275\004K\006\234\011\366\004\372i\320\216C"
	.ascii	";\0056\007\226\016x\014\332\024hg\240\235\004{\001v"
	.ascii	"\010\360\002\264\373\241M\005\033\205\376\"X\016\364"
	.ascii	"\247\241\375\015,\003\372\007\300\234\320\337\007\255"
	.ascii	"\014\226%\372\323\207.\015\376\201nE\360\007=\327<\340"
	.ascii	"\031\3749\236\010\235\352\301Td\315\010'_S\217\246B"
	.ascii	"\371\036'7\250\247X\035\337\326\371e\333\332\345\311"
	.ascii	"\277\355\261\255\231\335\356m\355W_\"\347\276\344)p"
	.ascii	"K}\205\027\334~8:8\371\274\352\031R\244y\2772\315\233"
	.ascii	"\324\323\\\261\304\321eK\354P\217\237\302\225v\356\312"
	.ascii	"YUW\370\022\0279\365\216z\350\024\272\351<v}\352\307"
	.ascii	"MA\316\347\344_<\311\277z\004\272\220s\037\251s\025"
	.ascii	"\302\217\271\313\315\352\317\266u\356@\317*\003\375"
	.ascii	"\263\372\036*\036\021w\226\005\372\222z\356q\267\323"
	.ascii	"\270\333w\325\343\301\271w\271\327?\250\353*\362\243"
	.ascii	"@y\022\037\252GDq^\256\361\363rNu\277\025\334g\234\333"
	.ascii	"\246\036=\305\251urr\217zv(\310c\234|]=E\025)}\260["
	.ascii	"\031\351!\365\223\250\210\310\023\345F\266\250;\256"
	.ascii	"Xe\026\377cx\240\256\255\360\245w\331\2567\252\037G"
	.ascii	"\236Sv\345\346<V\337\034\246N\336w\007\332\272b\310"
	.ascii	"\353.\220\004\327\273\256\353\242b\013\312uu\253\307"
	.ascii	"X\261\256\014\276\256\373\352\031\307~\031^\272\253"
	.ascii	"k\033\026D\264*@\355\017\012\345\302\377\322\377\333"
	.ascii	"\177\024\215fQ\267NF\350\260\270\012}\303k\007\022\333"
	.ascii	"\245\342\347bNK\376\012\372\242\245!\360R\365\215F\203"
	.ascii	".\235\324\024\3316Y\333\242\247s!\261P\236H\302uD\324"
	.ascii	"\271&V\215-\014{k\2400\244\321\375\007\235]\226|u\237"
	.ascii	"\257\373\336Q\221\336\254i*\257\227\350M\230\214\362"
	.ascii	"\331\315\326\314#\271\370\215<\022k(D^\023\321\266\325"
	.ascii	"\356\235\021P\241\370\006|\027\000\225UdU\323;\361$"
	.ascii	"{\337\233\350\235:g\360+\226\035\247\307\213\316\234"
	.ascii	"\012*\220\035\311\362\242\323\211\350$d\027\227\026"
	.ascii	")\220>\253-\213D?\230\370C\375L\263\204\2535\254\262"
	.ascii	"H\033h\225p\035\003K\365\337ZV\377\365\333gK\265\024"
	.ascii	"\222\012\330@r\243\345\241\\\242wWz9\315o\221\014=."
	.ascii	"J\250\330\375{t\266\273\036c\261\023\334\201C\377\201"
	.ascii	"\244Y\353*\256\216\211k\220C\244\225^\323|}\252\027"
	.ascii	"\222\002\324'\225\252Lb5\241-\207\326\204%\340\302\277"
	.ascii	"\271\013\340\221\253\234\206\001X\311\310\345\322\275"
	.ascii	"\254\330\373]\3220\343\316\300\271b\355\262\355\377"
	.ascii	"\032~\202o\177\031\333~\332\372Dl\011\213\214\370r\217"
	.ascii	"%\304\262c\305g[?\3673\011\336I\326\270\304\300M\221"
	.ascii	"\211Rd\344Rw\2431)!\336\030\025\277\353\275\270\335"
	.ascii	"q\226\367,Q\333\255Fk\\tlR\214\305\270+*z\2475\316b"
	.ascii	"\214\214\261\354\210J\212M\214L\004\271\204\365;\205"
	.ascii	"?\277bR\302\227\011\306\310\204\304\030\320\007&6\205"
	.ascii	"\007j\303C\315\241\341\177\017\015\331\000(\310\215"
	.ascii	"\0025\3460S\270\033\006iB\266\204r\030,\2329\330\210"
	.ascii	"C?\343\350}/\223)L!\273\211b.\374\201\306dR(m\306\246"
	.ascii	"\255\021n\364!\336f6In\0376\340O\302\3039\014\304\341"
	.ascii	"&\005\014\002\245\360@\216\203\011\016\342x#\301\301"
	.ascii	"\034\277O\360F\2167i>\015\211P\350}\200C\224\362\233"
	.ascii	"5!a\237(\360\207\037\2557\306Z\267C\334\255qFS\230y"
	.ascii	"\213\031\276\203\215!\226/\254\321\026s\322\236=\273"
	.ascii	"\343\023\215\346\010\370\204\005\007\375%p\303^cB\342"
	.ascii	"\256\340\240\035\320\203P\277I6\334l\211\265D'\376\315"
	.ascii	"\2647,r\353\356\020kB\324\366X\313\333\353\215\011\361"
	.ascii	"\321L5&\336\372\205%>\301\230h\335e\211"
	.ascii	"\217\344\323\243Yr\004\007\271\223\203t\377\013\027"
	.ascii	"]),"
	.text
	.section	.gnu.lto_.symtab.6a205bdf67921ce0,"",%progbits
	.ascii	"TIM_SelectOCxM_NoDisable\000\000\000\000\000\000\000"
	.ascii	"\000\000\000\000\000\034\001\000\000"
	.text
	.section	.gnu.lto_.opts,"",%progbits
	.ascii	"'-fno-trapv' '-mthumb' '-mcpu=cortex-m3' '-ggdb3' '"
	.ascii	"-Os' '-flto' '-fuse-linker-plugin' '-ffunction-sect"
	.ascii	"ions' '-fdata-sections'\000"
	.text
	.comm	__gnu_lto_v1,1,1
	.comm	__gnu_lto_slim,1,1
	.ident	"GCC: (GNU Tools for ARM Embedded Processors) 4.9.3 20150529 (release) [ARM/embedded-4_9-branch revision 224288]"
