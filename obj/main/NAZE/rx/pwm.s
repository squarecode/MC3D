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
	.file	"pwm.c"
	.text
.Ltext0:
	.section	.gnu.lto_.profile.9ff56b3796865383,"",%progbits
	.ascii	"x\234cf```a\200\000F\006;q\000\001\007\000^"
	.text
	.section	.gnu.lto_.jmpfuncs.9ff56b3796865383,"",%progbits
	.ascii	"x\234cf\300\016\002\24043\003\023##\023\003##s9#\003"
	.ascii	"\003#2\207\011\310a\256\257gd\372\310\304xq\326\262"
	.ascii	"f\376\027L?\201\222\014\214\313\031\245\030\300\242"
	.ascii	"\213\332W\355\341\003\2136800\256\000\0123\000\000\340"
	.ascii	"h\017\245"
	.text
	.section	.gnu.lto_.inline.9ff56b3796865383,"",%progbits
	.ascii	"x\234cf\300\016\202\24143\003\003\033\037#\003\023\220"
	.ascii	"\311\266@\236\011,\304\303\300\3008\301\217\021\227"
	.ascii	"\004\023\203\240\002P\202\347\215?\003\327\031\003\204"
	.ascii	"\014\224d\000\000\027\273\006\230"
	.text
	.section	.gnu.lto_.pureconst.9ff56b3796865383,"",%progbits
	.ascii	"x\234cf```g\200\000f\006\011F\011&)\000\001\254\000"
	.ascii	"["
	.text
	.section	.gnu.lto_ppmReadRawRC.9ff56b3796865383,"",%progbits
	.ascii	"x\234e\220\315+\204Q\024\306\317s\336w^S,$\242Y\331"
	.ascii	"L>\222\311\177\240\374\003\362\037L\323`\312\2744\210"
	.ascii	"\215\\\032\221\205\244\024\212\2224\030f|D!\032;%6\026"
	.ascii	"\263\221\344\243(\013z\025o>\317\035vn\335\316}n\317"
	.ascii	"\363\273\367\034\203\376/\237\354\020\210\352\244\302"
	.ascii	" \360\370\031\321\200\227\001} P?\243\037\017\374\314"
	.ascii	"8\271~s\012\356\331e*$\2213\331\273\027CK\260\226\373"
	.ascii	"\316\331\265U\261\250\324\340\323fr\264`\250\322e&\207"
	.ascii	"\011\011\370\260\004\375\016\226Q!\316\371\257\313i"
	.ascii	"\257Q\012\235\332M\275\234\346\347\230\345Z\356M\034"
	.ascii	"OY9\246\251\345\325\344p\302\343_\020f\346aS\325\233"
	.ascii	".\033X\201\241\251I\241\256\012U\256\010k\360\213\333"
	.ascii	"y\334\016\033\3259\354\316\330\307\015~\203\2637\236"
	.ascii	"2\227M\244~s5>T\351\224IH\303\257\275\317\361\317l\276"
	.ascii	"\025WJ\025\352\377\3127\327a\311D(]\224Q\337\337[\251"
	.ascii	"\243Cxd\036b7I7E\267\262\365t\356DH5.\020\317\034\224"
	.ascii	"\350\330+\233B\234;\037Kq\337\273\032Q^\227=\016\013"
	.ascii	"\014\033\350\243W\226\316,\272\004\376\274\244Y\320"
	.ascii	"\014!\026\327\006:c\241@4\030\261\003\261\336@GO\264"
	.ascii	"6DE\261\336\246n\273+\022\0157\264\333\315\221\226\306"
	.ascii	"\256X^\2505h\333\341\266\037\375\013\215\256"
	.text
	.section	.gnu.lto_pwmReadRawRC.9ff56b3796865383,"",%progbits
	.ascii	"x\234e\220\315+\204Q\024\306\317s\336w^S,$\242Y\331"
	.ascii	"L>\222\311\177\240\374\003\362\037L\323`\312\2744\310"
	.ascii	"l\344\322\210,$\245P\224\2441>\306W\0246c\247d\026,"
	.ascii	"f#\311GQ\026\364*\336|\236;\354\334\272\235\373\334"
	.ascii	"\236\347w\3579\006\375_>\331!\0205H\205A\340\211,\321"
	.ascii	"\240\227\001} \320\000c\000\017\374\3148\271~s\212\356"
	.ascii	"\331e*&\221\263\271\273\027CK\260\226\207N\366\332\252"
	.ascii	"ZRj\350\351,5V4\\\3552\223\303\204$|X\206~\007)T\211"
	.ascii	"s\341\353r\306k\224C\247\366\323/\247\205yf\245\226"
	.ascii	"\007\223\307\323V\236ijy55\222\364\370\027\205\231y"
	.ascii	"\330V\215\246\313\006V`h\352\252P\327\204*W\204u\370"
	.ascii	"\305\355<\356\206\215\332<vo\374\343\006\277\301\271"
	.ascii	"\033O\205\313&\322\277\271:\037jt\312$l\300\257\275"
	.ascii	"\317\211\317\\\241\225PJ\025\353\377\31277a\311Dh\243"
	.ascii	"$\243\276\277w\222G\333\360\310<\304n\222n\212ne\353"
	.ascii	"\351\334\211\220j\\ \221\331*\323\261W6\2058\177>\236"
	.ascii	"\346\376w5\252\274.{\034\026\030\266\320O\257,\235Y"
	.ascii	"t\011\374yI\263\240\031B,\255\017t\307B\201h0b\007b"
	.ascii	"\361@W_\264>D%\261xK\257\335\023\211\206\233:\355\326"
	.ascii	"H[sO\254 \324\036\264\355p\307\017\026\210\215\255"
	.text
	.section	.gnu.lto_rxPwmInit.9ff56b3796865383,"",%progbits
	.ascii	"x\234\215\221MHTQ\024\307\357\377\274\017_\363\374\010"
	.ascii	"\011\"\203h#\003\3058\320\266\215\320\246E\013i\023"
	.ascii	"\264\323\301BR\213\311\310\215\370F\007\234U\210Qhe"
	.ascii	"aR\232\226\232\346\230\246\365\332D\020\032\222QfY\013"
	.ascii	"\355\003\012\264\221\3545\244\235\373\236\346WB\027"
	.ascii	"\336\273\367\236{\316\377\177\317\357*b\3438\304\337"
	.ascii	"\021E\210}<#E\200jG\204\210\030DJ\314/,\237*\377\251"
	.ascii	"\012T/\254\2226\026\344\260>\270\213\303\032t/\254\003"
	.ascii	"r! *IQ5\035\225\370B\263\204Z\273\275\336\364\337\260"
	.ascii	",k\246n8\222g\303!!\022\3449\243\005~\316iZ\230l0\224"
	.ascii	"\355\020\274\356\357\230\0336?\223C\330-\267\003uO\353"
	.ascii	"u\271%Un?\\\250i\321\262\233-\253\312~\326m\345\252"
	.ascii	"\016)h\205\302z\270\205,\264!KpH\240\035\331\234\035"
	.ascii	"O\306w*{\\\331\217\237&\002^]C\263~\320!\025\267\327"
	.ascii	"\227\251\002w\220-\223g\243\277_\231z\224\357\274\325"
	.ascii	"\273*:\240\203\347\316L\333Z\\\354\351}\374\013\351"
	.ascii	"\032\227p\233\322\312\200\2544e@\210).\220$\246\211"
	.ascii	"\344\254\274E\324\236(\224\012\363\244\261\370\325\027"
	.ascii	"\347:\250\"i\305,\303!=A\254\213NTH\337\3535m\203\351"
	.ascii	"\262\331\024+W\240\013Y\016\031\342%\242\343\325\005"
	.ascii	"+\365\357\247\236\217\0322\211\275p\227o.\30747\035"
	.ascii	"\363+oP5\323\325wT&\257\316\344\267\345m\357\317k\337"
	.ascii	"\322\032q9bY\366~\207\266\314\223\216nY\317gW\346\316"
	.ascii	"\217g\004\366:\344C\017\032\361\335}\037\334C\200\317"
	.ascii	"^7}\275\230&e|\206@/\027\260\313\217\232\205\270\266"
	.ascii	"\336F\335`\263\303!s\236\014\304\245\015\372Xy\015\000"
	.ascii	";\340Pj\2029\011\334g\002\262\015\365/\263\304\0223"
	.ascii	"s\023f\375\036\263\321K7\2533\\f\020\030\330\210\314"
	.ascii	"\\\305H\023cA\217\321\3202\243\377\204\362`\005\312"
	.ascii	"\240\013\245\365\335\310\023\267i_\252\300\3202\224"
	.ascii	"\311>\355\037\272k)<\334\204\002?\022\036-Q\320]\012"
	.ascii	"\223\210\330IWP\032Oq\327\034\345Kl\313\011\236\016"
	.ascii	"\207\202%\371E\245\301py\360\324\331\222\234\220\310"
	.ascii	"\014\227\037>SZVTRx\340d\351\261\242\343yea#\224_\\"
	.ascii	"\\\220\037:\361\007\312\356Es"
	.text
	.section	.gnu.lto_.symbol_nodes.9ff56b3796865383,"",%progbits
	.ascii	"x\234cf``hd\200\002&\245z\006\206\011\347\030\030\352"
	.ascii	"\353\031\346\254\350\340a`R\254gD\025P\256g\202\011"
	.ascii	"\314[\300\301\300\250Z\317\014\341344\000\271j\365,"
	.ascii	"\310\\\225zV$.3\020.y\360\217\221\231\221\005B3\261"
	.ascii	"\"\350\207\377\030\031\000\336B#T"
	.text
	.section	.gnu.lto_.refs.9ff56b3796865383,"",%progbits
	.ascii	"x\234cf``\340d\200\000&&&F\026&\006\016\006\000\001"
	.ascii	"O\000\""
	.text
	.section	.gnu.lto_.decls.9ff56b3796865383,"",%progbits
	.ascii	"x\234\225TkLTG\024\276gga\037]\201\026\213\206\266\011"
	.ascii	"%)\251\215\272\366\221\246?\2154i\372\247\241$\375\325"
	.ascii	"4\233-\254u\023Xpw)\230\364\307\010\232R%Hi-/\265\340"
	.ascii	"\243\362\250\210\010>\020\021Q\020Y\027\264\210\200"
	.ascii	"Tv\001y\370BPR\361\021\351\231\271\367\356\336\265\213"
	.ascii	"I'\034\366\316\334s\276\371\276\357\314\\\"\010\302"
	.ascii	"\032\020\204\005\034n\255 \024\341\263\032\327\0220"
	.ascii	"\360Q\250\023\304\021\212\321\213\321\207\341\301\030"
	.ascii	"\303\030\307\230\026\376;X\236\006#\014\303\200q\012"
	.ascii	"\243\033\343<\306}\214\021)O%\345\216\005\301\350\373"
	.ascii	"\037\030}\022\227\027\007\343\271D\322\"\3430\214\353"
	.ascii	"\030S\0303\222\276\273\030n\011{\000\243_\322~Q\020"
	.ascii	"\275\360H:\373$\276/\216Y\025\234\254\235s\2772\245"
	.ascii	"\2020}\014\2336\025v\026\207\342\324\240W\263\351\231"
	.ascii	"\226\371\016=Q\001{\336W<rU\277\262\232R\232K[\007\300"
	.ascii	"\017\221\227\353\275\250'\257\361\244\315\177\234\312"
	.ascii	"\323`\375\333z\376\312S\366x\277\216OY\233\302qI\325"
	.ascii	"9A\367\205A\234~?\002\315\234.\354x\213R5\034\006=\324"
	.ascii	"\000\201jX\311$\260j6r)\315\246\0059T\327\031&\300A"
	.ascii	"\210\206J\210\026\240\026\3420\203\347\302\237\270x"
	.ascii	"\010\027\021\270\375Y\313\226\020\320\307\005/:\022"
	.ascii	"\244\210S\250\316)\214b\024\352\220B\225\237\0022\022"
	.ascii	"9\260\027\250\3045:\377\320\300}\212`\302J\373\307\347"
	.ascii	"\010\367I\305\246;\273\312v\204\220\037\270\005\005"
	.ascii	"#\205\275j\262\025\002\374\210\021\375(\2723\337\240"
	.ascii	"\345\323\205\005\302H\357\275qyD\347s\343\330,0*'\221"
	.ascii	"J\243\237J\214\322\015\232CC*QX=j8\312\204\235@a1\222"
	.ascii	"\260c\270x\\t\343\350\350\364v\275\014\\}.\237k<\205"
	.ascii	"\300\015~\340\223\360R\344\246\240\3100X;\370\016)\020"
	.ascii	"\345\271\274C=z\262W\234\024]\0318\256&\015\342d\333"
	.ascii	"P\325%\015i\016t!Jt!\337Uz\226\360\351\002{\255*\034"
	.ascii	"\233;\000r\347f\012)Y.\300\312hX\201\034\316!\207(\211"
	.ascii	"C+r8+\267\355\364\223f\356U\033J:\343\227\024\245\227"
	.ascii	"\217\245\312\333\177\340\313\340\240\355\213\201V\347"
	.ascii	"\270^g\240\347\021\264\305\017\332\006>T8\3263\333\035"
	.ascii	"J:D]\373\332<\023\006\322\313'\352\237&+\347u\020\033"
	.ascii	"\033\031W\216[\316\270.\034\264\316f\323\274\345\034"
	.ascii	"\355\002\242uA\244\314\340\335h\201\261AH\226[\276{"
	.ascii	"<\244x\015\317\353\010\222\367\036\313\373\031\371\321"
	.ascii	"\202r\272v\243\242C\247\245l\344\011.\024u\021b\241"
	.ascii	"\023b9W&\310\273k\253\236\002K\021$-\276[\253\252\350"
	.ascii	"\231\353\302{\030\311\363~\267h\301\215@\315~\321\254"
	.ascii	"\210\217\240;_\302\335\026\333\031\215\251\034\351."
	.ascii	"\0157l\363\337D\216._F\001\272\301 e\356yP\232\257U"
	.ascii	"\343\307\220\313\377\232\177u:\3674\345\205\3635\314"
	.ascii	"\203\036\340\213O&\313\332U\313v22xR#T\3740\313|\004"
	.ascii	"\270\002\313\360\377eP\213\260\025;f\253\302\311#\261"
	.ascii	"M\273\237\216yt1{hk\335L\336\255kKKh\371f\372|\001\317"
	.ascii	"\036\253\202\277|\232\005\366,^\372^\210\301\302\376"
	.ascii	"A\317\221PR\"~\377\372\032\333*\3028J\271\273\236\256"
	.ascii	"\315\246\317\360\016s\204\253\012\204\2532B\037Gp]\376"
	.ascii	"\265\217\220?D\204\371\234\312o\002La\305~S\372Q\254"
	.ascii	"\010\203\355q\325\325_\321\201!n\261t\030D\327\375\025"
	.ascii	"\374\370\272\016\326\230\263\351Z\030\300\345k\376N"
	.ascii	"\366\213fs_\366\326\036h$\001\034X\262\237\303u_c\362"
	.ascii	"\274n5\357\001.I}i\273\224\177-\314\327\227!\261/\015"
	.ascii	"\336vw\210\262/\011Q\212\266\334\340m\371[n\313\323"
	.ascii	"\352\226\315*r\\\264\343\334\211\201\262P4\264\034\333"
	.ascii	"RUJ\024m\301*\030V\230:,\233\352\341\246\006;3M\215"
	.ascii	"\0139\272\305\217\307\010\347\341\225yl\371\245\325"
	.ascii	"\243#gE\0365;\207\273\264\310\303KgJj\012\227\224\320"
	.ascii	"\012\231\007V\301\250\202\307\250\314c\214\363\230\274"
	.ascii	"u\336M\310\204\210\362p\250fZ\307Q\312;\353\351:\351"
	.ascii	"x0\204\233\012\204\2332\3028G(\372\315\265KC\2469\202"
	.ascii	"\372\346\343\341G\032\210\326\305E\027S-L\201N\370\221"
	.ascii	"\177\273\262\013\"6\372\276]\267\260\355\354\225\000"
	.ascii	"\223(\356\266\364\345\312\305\256\343*LH\360\342(\306"
	.ascii	"u\021\010\267\312=T\327\254\343\246\325\371L\233zH\037"
	.ascii	"h\225\2461\014\277iw\271iwd\323\266\355\3169\241!s\222"
	.ascii	"\334#\235\005KD\323\236m\037\"\012\323\260\012\356)"
	.ascii	"$\337\223%Os\311\267\377\251z\341\3230\022p\013\356"
	.ascii	"\213'\220\375bv\357\341}\3175\001\331w\003\262g\244"
	.ascii	"l\366\253\315\260\332\234\037~`r\206~\366\305W1\361"
	.ascii	"\202\336d\222W>2f8\354F\263=u\225-\315fYe1\177k5ZmI"
	.ascii	")\031\311\026c\2529i\203\325f1\232\222-\353\315\031"
	.ascii	")N\223sS\272\305\261z\203\260\342%E\216M\016\243\311"
	.ascii	"\341LF|\314\344;\277\377\261\311)m\311\036_\265g%f\330"
	.ascii	"\234\326TK|\232m\275\365\273 +\016\015K\376\304\344"
	.ascii	"\324\211e\370dH\332`\266\331,)\361i\230\031n\316\310"
	.ascii	"\212W\314#W\033\035\366$$l\265\031\355Y\370\207[\033"
	.ascii	"\322\323S\023-\346\344Dsfb\374\322\300\204\364\314\324"
	.ascii	"\325I\230\221\351\317\210\260'I\317\237\232\235\346"
	.ascii	"\004\247]g\317J\310L\375\334fuj$\2447\025 \311v\353"
	.ascii	"\367\026\273\203!\231\370v\032\011,\304\264.--E\263"
	.ascii	"\336bvf\330-o(J\222\2706\351\007+\376\005\001\225N "
	.text
	.section	.gnu.lto_.symtab.9ff56b3796865383,"",%progbits
	.ascii	"rxPwmInit\000\000\000\000\000\000\000\000\000\000\000"
	.ascii	"\000\337\000\000\000ppmRead\000\000\002\000\000\000"
	.ascii	"\000\000\000\000\000\000\343\000\000\000pwmRead\000"
	.ascii	"\000\002\000\000\000\000\000\000\000\000\000\345\000"
	.ascii	"\000\000feature\000\000\002\000\000\000\000\000\000"
	.ascii	"\000\000\000\356\000\000\000"
	.text
	.section	.gnu.lto_.opts,"",%progbits
	.ascii	"'-fno-trapv' '-mthumb' '-mcpu=cortex-m3' '-ggdb3' '"
	.ascii	"-Os' '-flto' '-fuse-linker-plugin' '-ffunction-sect"
	.ascii	"ions' '-fdata-sections'\000"
	.text
	.comm	__gnu_lto_v1,1,1
	.comm	__gnu_lto_slim,1,1
	.ident	"GCC: (GNU Tools for ARM Embedded Processors) 4.9.3 20150529 (release) [ARM/embedded-4_9-branch revision 224288]"