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
	.file	"sound_beeper.c"
	.text
.Ltext0:
	.section	.gnu.lto_.profile.2099428a065c88e8,"",%progbits
	.ascii	"x\234cf```a\200\000F\006'\005\000\001\030\000k"
	.text
	.section	.gnu.lto_.jmpfuncs.2099428a065c88e8,"",%progbits
	.ascii	"x\234cf\300\016\254\2414\013\003##c=\023\210`f\004\001"
	.ascii	"\346r\240h=\003\003+H\210\221\351#\023\343\375'\347"
	.ascii	"/r\274`\372\311\004\224`\\\316(\305\000R\303\310\300"
	.ascii	"\000\000\021\202\012W"
	.text
	.section	.gnu.lto_.inline.2099428a065c88e8,"",%progbits
	.ascii	"x\234cf\300\016\016Bi\026\006\006N6Ff\206\314\217L\214"
	.ascii	"\367\237\234\277\310\361\202\351'\023P\234q9\243\024"
	.ascii	"\003C\006\204bd``\005\212\261-\220gb`Y /\300\300\322"
	.ascii	"!\314\301\3002\203\207\005d\004\023\324\004\022\264"
	.ascii	"03p\0103201]\340\207\250\0009D\000\250i\202\037+\003"
	.ascii	"\237\034##P;\263\002\013\367\0127\006\366\016u&\006"
	.ascii	"\306\027\354,\020\022l\0377\310x09\301\217\001\000r"
	.ascii	"\\\031u"
	.text
	.section	.gnu.lto_.pureconst.2099428a065c88e8,"",%progbits
	.ascii	"x\234cf``\340d\200\000\026\006)&)f\011VI\000\002\314"
	.ascii	"\000\200"
	.text
	.section	.gnu.lto_beepNormal.2099428a065c88e8,"",%progbits
	.ascii	"x\234\225\223MOSA\024\206\347\314\375\350\025\212!\256"
	.ascii	"\264\013b$\204\030\205\376\002\023\267\376\002\227\210"
	.ascii	"\245h\027RR\242;dZJ\320\215iHL\210\242\321\000\001,"
	.ascii	"\264((\266\005\274\240\211&F\014\312\247\032h\220&\272"
	.ascii	"QjAh\024\3539\367\266\312\207.h\322\316\234s\317\274"
	.ascii	"\363\366}Z\211\355~\235\300w\245\314\330)\\Ae\300\003"
	.ascii	"\023\214y5\316\245\341\"&\362\344);\023V\011\024\263"
	.ascii	"-\3476\012\000m\030\260\006.\311\0124\300g\236\344\020"
	.ascii	"\320\203\255\371\245\235B\210\225\245\036K\323\3014"
	.ascii	"g,\305\315\233\240\013Jq$\021\357\350P\245\022`\270"
	.ascii	"\177\023\374PQ\322.\204O\037\015\211\223\220\346\000"
	.ascii	"\335 \341\0018n\203\2436\206\015\006=PB\263I\377\346"
	.ascii	"l\276\352G\351BS\022\356\201\012\270\206\017\350\"\223"
	.ascii	"Iu\215E!\017\005p\\\306\203\\\301\017I\245\235F;\306"
	.ascii	"\226\361\020yNpN\2534\015\376\371\306\217\343@:\353"
	.ascii	"\234\334/.\277\236\324>q\272\225A\020l\206\355\004\236"
	.ascii	"\035.\222\336\201\257%\331{\310\034\226q\370\366\333"
	.ascii	"k!^\377C\\\021Z\232\313\233\344h\253\204l\224\335^\177"
	.ascii	"\033\334\202\233^AS\012\364B=\364\2210\204\260\315f"
	.ascii	"\200\223 \016nt_\035\341\3221#\225Hh\365U>i\250\207"
	.ascii	"\251\214\266\274hU\251\264\310T>\377\371}z\177\361]"
	.ascii	"\014->\021\255\322\375w\304\257L\006\243\323 lF\327"
	.ascii	"\0176\270\2375\217\027=\200b<5\2716\227, \021M\004\374"
	.ascii	"Bf0\200\0233\340\323\007\234Y\007\253\315\341\367\026"
	.ascii	"\251\314p\360ri#e5\034\024Ryc6\261*\031\0168\225\261"
	.ascii	"\257}mJ\316\301\031\335\227s\240\300\240\351\340!:x"
	.ascii	"\364\327\301\020\024cd\014\023\\h\316\254\305\372\255"
	.ascii	"\333h\306;g\2544BF\015\246)\016;y\303c\374i2\210P\366"
	.ascii	"\232\2515\336\222\016/6:\250\2675v\315\210=2\327\336"
	.ascii	"T@\261\007(\366}\364e!J\206\360\331J(\371\305Z\026\024"
	.ascii	"~\257~9\315\363 \206 \276!=\343\016\030\206\262u\022"
	.ascii	"A\3542\233\262\033\330#\363\327%\223\273\372_\356;A"
	.ascii	"\217\374\001=\272\035\364^\361=\301dr\254\206r\254\366"
	.ascii	"J@'\002j\226@\"6\270\203@\002\011\340\010\335\225%\300"
	.ascii	"w\021\0303\010\214S\012\212\251E\004\026\332\035\324"
	.ascii	"\333c\344O\215\310\301\024\205g\024\271bD\256\030\177"
	.ascii	"\314\005\360\306;O\223\0212\277\214\203\330\305\234"
	.ascii	"\217\224\333\353<\016\373\205JW\215\275\312\343\272"
	.ascii	"\344\364\324\331\353\334\027k\252*\316:\235\265NO\271"
	.ascii	"\203)\356\032wu5\324\202\313\366\217\341s\265.w\371"
	.ascii	"y\366\033}<\256\232"
	.text
	.section	.gnu.lto_beepInverted.2099428a065c88e8,"",%progbits
	.ascii	"x\234\225\223\313OSA\024\306\347\314}p\205b\210+\355"
	.ascii	"\202\030\011!F\241\177\201\211[\377\006\027\210\245"
	.ascii	"h\027RR\242;dZ.A7\246aa\210\242\321\200\001\255\264"
	.ascii	" \240\226\202^@\"\211Q\203\362\220G\240\032\232\350"
	.ascii	"F)\017\241Q\254\347\334\333*\017]\320\244\2359\347\236"
	.ascii	"\371\346\353\367k%\266\373u\002\337e2c\247p\005\225"
	.ascii	"\001\017\274a\314\247q.\365\3473\221-\217;\230\260I"
	.ascii	"\240Xm9\263Q\000h\303\200\325rIV\240\026\276\360\004"
	.ascii	"\207\200\021l\312)\272'\204XZ\016f\325\037Lr\306V\270"
	.ascii	"u\023\264A\021\216\304c\255\255\252T\010\014\367\357"
	.ascii	"\202s\245\205-B\370\215\321\2208\011I\016\320\016\022"
	.ascii	"\036\200\343v8jg\330`p\037\012i6\241oN\345\250:J\347"
	.ascii	"Y\222\360\000T\3005|\300\020\251Tw\317\340\034d\243"
	.ascii	"\000\216\313x\220+\370!\251\264\323h\307\330\"\036\""
	.ascii	"\317q\316i\225&@\237\256k\033\006\322Y\347\344~a\361"
	.ascii	"\355\230\366\231\323\255\014\202`7m\307\361l\177\276"
	.ascii	"4\003\376\306\256\336C\326\260\214\303\267\337_\013"
	.ascii	"\361\232\037\342\212\320\222\\\336$G[%d\263l\367\351"
	.ascii	"\315p\013n\372\004M)\360\020j\240\203\204!\204m6\011"
	.ascii	"\234\004qp\243\375\352\000\227\216\231\251DB\253\257"
	.ascii	"sHC=Le_\343h\223Je\226L\345\313\237\337'\366\027\334"
	.ascii	"\305\320b\013}\345\206~G\374J\2450:\015\302Vt\235`\207"
	.ascii	"\256\264y\274\350\021\024\340\251\261\265\017\211\\"
	.ascii	"\022\321D@\0272\203n\234\230\004\2771\341J;Xm\010\317"
	.ascii	"fI\305\246\203W\2376Vl\246\203<*oL\305W%\323\001\247"
	.ascii	"2\372\255\243Y\31188c\3703\016\024\350\261\034\364\242"
	.ascii	"\203\307\177\035<\201\002\214\214a\202\363\015\251x"
	.ascii	"\264\307\266\215fld\306F#d\324d\272\302a'ox\212?M\006"
	.ascii	"\021\312^\263\264\206\032\223\341\371\026'\365\266\306"
	.ascii	"\256\231\261G>\264\324\347R\354\001\212}\037}Y\350#"
	.ascii	"C\370l)\224\370j+\016\012\335g\\N\362l\210\"\210e\244"
	.ascii	"g\336\001\375P\274N\"\210]f\343\016\023{\344\343u\311"
	.ascii	"\342\256\376\227\373N\320\003\177@?\333\016z\257\370"
	.ascii	"\236c2\031V\323\031V{%`\020\0015M`-\332\271\203@\375"
	.ascii	"\254\215F\350\2564\001\276\213\300\240I`\210RP,-\"\260"
	.ascii	"P\347\244\336\036#\0376#\007K\024^P\344\212\031\271"
	.ascii	"b\3761\347\301\027\0339MF\310\374\"\016b\027s>R\342"
	.ascii	"\250\366:\035\027\312\334\225\216r\257\373\222\313["
	.ascii	"\355\250\366\\\254,/=\353rU\271\274%N\246x*=\025\025"
	.ascii	"P\005n\373?\206\317U\271=%\347\331oZj\256\261"
	.text
	.section	.gnu.lto_systemBeep.2099428a065c88e8,"",%progbits
	.ascii	"x\234e\220\277KBQ\024\307\317\367\\}\010.\321\350(\210"
	.ascii	"\024\341\373\027\232\232\373\017\244\364\011\016i<\251"
	.ascii	"M\274O\034\232\302\234\202~,\031Y\232\022\315\321\353"
	.ascii	"\037H\252!\010\251\006\205\332\222\206\220\020;W\307"
	.ascii	".\034\316\271_\276\337\317=\\E\377OD*\012\242E\351P"
	.ascii	"\004\256\336\023y!\006\314@\240\022\243\204O\0362\252"
	.ascii	"~s?\034?\325Z\177\325\272\336\252\217\021\023}\363\214"
	.ascii	"\2033\304\3053x\257\327-\025\003\311\374\330\354%c'"
	.ascii	"Z\227\375N[/\213\033h@I\000K\021,DH\004\3029b\306;\254"
	.ascii	"\214\237\303VE\330s3$.`\311Z\324\231\367\365dr}sW\265"
	.ascii	"\202,\021V\230f\250/.\263\342\200\331t\365\202r\355"
	.ascii	"\3526hr?l\326=~\332ms\361W\357\350\320\210\325\330@"
	.ascii	"E}\353w\037B\037,\312\364\332\360*\2078\302\201\247"
	.ascii	"\215\213\321D\021-\310\247\340Rd\352!`\200$D)5\342\000"
	.ascii	"\275\302\363\367V\246*\231-`^\027x4a\027\334\224\275"
	.ascii	"\261\226\315\331i7\273\355\270\005\273\220\337\312\245"
	.ascii	"\223\353\216\263\351\270\211\024\005\363\271|&\363\007"
	.ascii	"\311\204p\257"
	.text
	.section	.gnu.lto_beeperInit.2099428a065c88e8,"",%progbits
	.ascii	"x\234\215RMO\023Q\024\275\347\275\231\2662\020\214+"
	.ascii	"\302\202\030\223\246\013\002\263q\343\302\304\225?C"
	.ascii	"#\245\232.,\246\215\356\032\246X?V\006q\203\0014\321"
	.ascii	"\030\021\260X\024\024\2502\033E\023?BD\015\306\217\230"
	.ascii	" \301\205\211\265D\235\230\006\357\235*\"B\264\311\364"
	.ascii	"\275{s\3569\367\234\031M\177\377v\362\263]\0235\362"
	.ascii	"\211\000Au>&\312\204\224\322\205\006r\252\214Y\233\234"
	.ascii	"j\015\263\3226~]L@.\004jW\3320\321\216\017\252\250\320"
	.ascii	"\351\016v[\221K\216\343|\272\220\257;V\347)\242\222"
	.ascii	"\252(\3412\"\0149>\364z\332\320a\020\337\307sK\217\254"
	.ascii	"E\345)l\225r\242\353~w@JeH9\345\015\314\030\341\213"
	.ascii	"\216\323\341>\030qv\031\236\322\350\207f>\\A=\006PO"
	.ascii	"\334\"\014\",\360b\266\374\302\012dY{sE\023C\010\200"
	.ascii	"\317\341-\256\263\274\\\272{z1\002KC\360\006O\032A\376"
	.ascii	"3\211\346\031+^\336+%\247~\211\216\261\342t\321\224"
	.ascii	"\361\257\312`\346\267\363OfB\262\027\347\304\345\350"
	.ascii	"\267\363\037k\372\320\003O1@\343*/\"\375\336\2453s\265"
	.ascii	"M\215\236\012\"\207>|\366}c\030M\304\224]\357j\205\220"
	.ascii	"a\347\236\236\312\251\364w\347\244\023\362T\250,\250"
	.ascii	"\325\032!\277\354\317d{\231\243'\343\010*\210kH#/:\030"
	.ascii	"\3416\257E\257\220u\363\367\224\220\322Z\326M%\305\306"
	.ascii	"q\035i\342\005=UE\276\251\207E]1\025\374\037\027&n\370"
	.ascii	".$B\214\262\213g\310\316\035m\371\315\260\2622\207\210"
	.ascii	"1\031'IQS\241AB\374r\342\371\331=\353y\266\312\302\271"
	.ascii	"\232\300Z\307s5n\262\347[\276\347qn\377\301\342\356"
	.ascii	"`@\211_\030a\202M\212\254A\263vEv\341\037\262ku&Wt\012"
	.ascii	"\033\350\360{\307\355\237:\246\377\221H\372\223\033"
	.ascii	"\244\317\003\006\017\334\341\001\211\305S5\364\006\031"
	.ascii	"wj\267\217&\371\342 $\274\375\266f;\225\214\332\007"
	.ascii	"\367\305\023vk2~$\226L\331\251\266\303\211\326\275-"
	.ascii	"\261\330\241X\2629J\201h[b\177\374\300\017\311\2515"
	.ascii	";"
	.text
	.section	.gnu.lto_.symbol_nodes.2099428a065c88e8,"",%progbits
	.ascii	"x\234cf``\250d\200\002&\345z\006\206\011\347\030\030"
	.ascii	"\352\353\031\346\254\350\340a`UbX\300T\317\314\244R"
	.ascii	"\317\210\"\316\244Z\317\004\023\230\267\200\203\201"
	.ascii	"U\221q!S=\003\223Z=3\2620\243z=\013\204\317\320\320"
	.ascii	"\300\301\300\302\314p\345\301?F\006fV6\206'@\0063+3"
	.ascii	"CS\333\033y\006\000\246\204 \222"
	.text
	.section	.gnu.lto_.refs.2099428a065c88e8,"",%progbits
	.ascii	"x\234%\305\271\001\000 \014\3040\373\3103\012\373oH"
	.ascii	"\201\032\035\340\362\005\014n\362\367Pvk\254I\306\332"
	.ascii	"\260<\016\016\000\210"
	.text
	.section	.gnu.lto_.decls.2099428a065c88e8,"",%progbits
	.ascii	"x\234\235\027[P\024\331\265o\337\001f\232q\2644\321"
	.ascii	"\204\265\"j\325\224n\271LVS\371IRq\221Rq}P\250U\251"
	.ascii	"\312V\315\2423\352T!\220\231a\343V\345\243\007\324E"
	.ascii	"E\236\"\003\"\362PQ#\312C\021\025\001\025\037\200\242"
	.ascii	"\361\201(\362\\E\024\037\350\252\200\213L\316\275\267"
	.ascii	"\233\236!\260\331\244kN\367=\347\236\3679}\372\016\346"
	.ascii	"8\256\006q\234\013\256l\035\307\355\3429\316\013h!\000"
	.ascii	"@\346\016s\354\"\264\022\200\023\000e\000S`\363\327"
	.ascii	"\000\300\316}\002O\177\304y\\\204\327W\322Ct\370\003"
	.ascii	"L'\000|\327\341\011\2468-\300\023\200.\200[\034\323"
	.ascii	"\325\001\320\002\200%\035z\340\237\205\230/\237\214"
	.ascii	"\260q\342\377\264\321\"\331\301\222\016\242_?\206\215"
	.ascii	"2N\311\007\2611\025\366g\003\034\227\366\221\304C\236"
	.ascii	"#s@r\244\223de_&!\346'\3215Q\362\223\370\373)\300/%"
	.ascii	"\335S%\375\304W-\321\201\230\017r\316OH\271)\343\306"
	.ascii	"\316\377k\036\245\357\256\317\362\301<\202\265\352\321"
	.ascii	"@k\237\017\362\323\350\375\234\242\032\035F\032\356"
	.ascii	";Q\214\021{c\222&\374\215Cs\374\320l?\016\035Az\272"
	.ascii	"\305\241C\310\017\375\023\371q\373EQ\214\023\347\023"
	.ascii	"**@\330M\277\023\350L\021\271\201\265\372\316\376\037"
	.ascii	"\264\335<\322\011\023\210\361\314{\217\337b@\265\002"
	.ascii	"O\320\366\201\3151j\0258KU\375UEh\217\262:\035\374\224"
	.ascii	"4\221\\\261\342\004\036\205LFG\301p!\030\346\320q4\005"
	.ascii	"\356\307\220\212\005\223\370\2748\216\307j\022\014\312"
	.ascii	"wv\334\021\346\034\241\276U7\361J\3049\267\013{U\376"
	.ascii	"\331buQ\357\231\254\350\0141\307!\016\271\\\210*CE\010"
	.ascii	"\243b4\207\026\255H\212\005\225 \177\220\313\372\370"
	.ascii	"\346\202\012\377\211*\357q\276\236BU\344\264\225\210"
	.ascii	"\363c\304A\227\013S\371R7\371RY\376\004\225o*\331\233"
	.ascii	"8\036/\241\362w\032v\006\202|{Q\373\300Q\357Cb\265\313"
	.ascii	"\365g*~\322M\374\244,^F\305\323*\262R44u\"U!\247R\313"
	.ascii	"R\331\320\372\241M\205W\323\255cuMg\324\330D\327\247"
	.ascii	"\217\275\275\356K\305\374\011z&\345\252\323\233J\321"
	.ascii	"\354VU\366_\026\260\215r\306\307\265\327\012\370\037"
	.ascii	"t\3558x6\336\007\330\246\0134em{\006\366k(J&\300x \361"
	.ascii	"W\273\304|\035\322\013\244\370\275\211\007:\377\022"
	.ascii	"\013\035p\001\011\250r8\004*M\2568\322EI\261\242\346"
	.ascii	"\252\216Cg\241x\025P<t\036\032i\272@yQ\025\020\253\201"
	.ascii	"\010\212/\015Vn\366B\202~t\241\232Q\204\250\013\203"
	.ascii	"[R&\213\242\012]\004\027\316).\200G\303\205\317~Z\372"
	.ascii	"\007\334\205h\200iu{\022\275\360;\206$u\244\334V\341"
	.ascii	"!\344\021\272?\013=\275\247\377\204\232\242Pb\342_^"
	.ascii	"\313\315\016\315p\340\217w\377\206X\255\007\253W\024"
	.ascii	"\253\376\356\201C\333z\035\202\030\344\256Eu\020\203"
	.ascii	"\277\024\303U \326\262\300K;_\356\020d\305\203\227\022"
	.ascii	"h8\327A\361eEq=\372I\315\327F\325\214\256\344?O\343"
	.ascii	"\3616\372\222\243\263\375e\005:\332\020\355\024/\251"
	.ascii	"\350~7\236v\304T\20267\276\350\367\301\311\214\367\305"
	.ascii	"\205\375\233\2048b\347g\025\002$.<\350\213\361\302\331"
	.ascii	"L<\341\356\375\022_\234\307\220\252Z\307u\001\037d\310"
	.ascii	"\376\264\335G\275\250Q55\232\222[\240\303G\330^jS\336"
	.ascii	"\220\200\2171\244\2642.U\300\245\014)\256\251\214\365"
	.ascii	"\305\247\030\222\321w\3552\363\373W\200j\212\223\262"
	.ascii	"*4h\006\273&\351s\304\315\261\275\203\207\373\306\027"
	.ascii	"\226\210\325\2331\272\005y\274\013y\374\036MRbh\244"
	.ascii	"3\344S\270q\204?\247\255\312$\3636\215\344-\037\301"
	.ascii	"\373T\341}0\222\267y\004o\253\302{ot\037\316\242a\346"
	.ascii	"\207\012\363\235\221\314\263F\360v+\274\367Gw\330\215"
	.ascii	"\271Ya\276=\252b\352p2\031\264I\2428\337\316\241\033"
	.ascii	"\260}\223\252!\314Pj\364\010\252\336\211f\240v\200\207"
	.ascii	"\000m\000-\000\035\000\255h\006mM\322\277\355\367\253"
	.ascii	"L\244}A\216\223\007\232\374\036\362\231\373\022\036"
	.ascii	"#\244\237D\031\237UiE\204\272@\377\277\2246'b\364\032"
	.ascii	"\315\033\364\030\234\370_\034\202f)J\335\266\317K\273"
	.ascii	"]\031)\324\242\034>\207\236 \255\304\331\226\376\243"
	.ascii	"\017\036\220Z\266\270\363\205\006\307`\326\314\375\265"
	.ascii	"\255>8\236!\261/\353Z\274q\032C\344\231\272\204\315"
	.ascii	"\324\207\267ogh\361A\266w\250\263!e\034\335\233E\320"
	.ascii	"\273\035\216r\001\037g{\247\213\223\006tto1A\217f?\257"
	.ascii	"P\343r\266\227V_\336\"\320\275_\020\264ow\317Co\\\203"
	.ascii	"=&\377\0226\371ot'\337\034\207ob\217\267y\011{\233\013"
	.ascii	"\013\236t\373\342f\354\361\306,\241o\014\312\273\237"
	.ascii	"\337\245\205\257-\352\203\304\367\2234\000\261\372\315"
	.ascii	"\373\306q\204\370\016\210\357!?\003\210}\206\317\015"
	.ascii	"\366`B\377\001\350o\201\376\201\321;.\346\236\345\011"
	.ascii	"\3755\320\337\000\375GFw\245&\277\323\020\372+\240\367"
	.ascii	"\002}\220\321o9\233\253)\375\005\320_\002\375#\243\267"
	.ascii	"&\017\215'\344\036 ?\007\362\020#\307\237>pW \364g@"
	.ascii	"\237\351\207\\\214,\317\350\311lF'\324g\236\307\024"
	.ascii	"u\221@\371\364\256\027'1R\353\267\262\323\213\003;u"
	.ascii	"\362\361\205C\261\274\232v\316f^\217D^\205\034\274\037"
	.ascii	"\212\341\245\257H\303\215/I\333\002\317\177\266\355"
	.ascii	"\265\241\363\215>H\257\246m[\345\215\320V\320\364Ti"
	.ascii	"Z\"D\257Q\314\242-`m,\313d\314\025&\266!\354P\321:}"
	.ascii	"\274\3214\240\302\333U\036\015\244\243\015\344s\276"
	.ascii	"2\361\203\212\2159\375\244\0340t\263\260x\023\234a."
	.ascii	" \372\345\273\004\356$\361\243\276\330\204\271\275\256"
	.ascii	"\362\253j\007\246\236\177\3073V\311A\3179\004\254W+"
	.ascii	"\276\256\206\326'\037\240\006I\353\360wf\326\010\336"
	.ascii	"\332F:Z\340-B\335#=\360\030\262\300[_F] '\274\270\321"
	.ascii	"\\\330\306\373\311C\2442DM\366G\224\302}&\234\002+d"
	.ascii	"\320\2413\222Y\222\337D\310\357v~\006\212\007\330\011"
	.ascii	"\260\003 \201\227g\001\237\331\325\221\353%\217\237"
	.ascii	"kP\307\024\220;\255\324\221X\034\333P2(\377y\206\320"
	.ascii	"\305\313\351i\336\036C'\205w\037:\251\274<t\342\367"
	.ascii	"<\311\021\350\301\027h\322\301w\240\373\312I<\346\301"
	.ascii	"7\215'\007\337]\274t\360-\316\330\271\323\007\227\263"
	.ascii	"\226iK\255,\031\007\247\313\0348\340\356\332\212\335"
	.ascii	"N\270 \205v\363\312\021\023\326\354\210\231\316\223"
	.ascii	"#f\313\321x\2077\276\310\264l\2519\225\353M\316\250"
	.ascii	"bQa\361#>C\314u\327\342t\323\342\224\265dP-1;\366\236"
	.ascii	"B\270\221i\311pn\337\347;3W\024\363z\3178\017 '\361"
	.ascii	"E$\247]\332X\231L\213[\\\231L\027\332\303\317$\243-"
	.ascii	"\277\3448\366\310 9$+\031\314\032\316`\347\320\256Z"
	.ascii	"o\334\316\214\246\213u\371\232i/U{E5\335\354I\035,'"
	.ascii	"\357\020e'\307\215g\357+5\340TN^{]\021t\256H\003#\333"
	.ascii	"h\257\344\221b\203P\262\371i\034\332\007\215\211r\250"
	.ascii	"_\0157\356|\257\362\360\213D\243\310\3442\277\310\223"
	.ascii	"\034\307_}|\316\376\326\020.V\335\206{\011\203\276\224"
	.ascii	"F^\232<\236\225\274\246\373\2531+\276\237V<_\256\370"
	.ascii	"\361\232sw"
	.ascii	"4\330\341E\003\256+\257-S\263\2774\015\257\372\276N"
	.ascii	"\211\025w\211\355.\327\264\0345\021C\007\334\212u@."
	.ascii	"\326AV\254\267\257R5x\007S\343j\315\275\345\315\376"
	.ascii	"\326\264\346\263\277%U\342t\252\242\300ME\201\254\342"
	.ascii	"\020U\321\334]\332\246\366H\006I\244\222\214\303R2\016"
	.ascii	"\323d8\322\236=\360L\035i'\205\373\210\304M\236^\306"
	.ascii	"\300\310\310pa\215\331\034\265<\322\2721,\334{\321\362"
	.ascii	"\325\376\013\270\031\001\006\233u\255ac\230%\302`\262"
	.ascii	"Z\2761[m\006[dt\204\311HX\315\326\200\265\234\226\254"
	.ascii	"\202#`\313n6\011\266omv\363\306@ \351\030\307\202\310"
	.ascii	"\210u\226\365F\273'jSG[\"\354\363\346\032\355\202\321"
	.ascii	"(/\177g\210\266Y\015a\326\215\237EDF\230?3\207\255\261"
	.ascii	"\030,\021k\303\243Mf\360`\355\006K\204\331`4\231\327"
	.ascii	"\205E\207\333\215\366o\243\314\266\200\015\334\354\237"
	.ascii	"\020\002g\014F\233\335\004\372\201S\267>\312\022\031"
	.ascii	"b\266Z\2426\230\255a\341\324\203\317\177?\354\001Y\372"
	.ascii	"P\026K\204vQH\360\012\343*0\021d^\207\027\204.\005X"
	.ascii	"\214\203\203B\361\212\240PU\340\312\320P\034\030\032"
	.ascii	"\252Z\272\340\313\320?\006\030\302-kX\206\026,[\031"
	.ascii	"\274\022\356\363\014A\346o,k\315+\243\243\242\"\255"
	.ascii	"v\303\312U\360[6o\356\302\317\177\273\311`\263o\234"
	.ascii	"7w\035\254\300%5\265\007,\032jpY\244\311\254&7\343\027"
	.ascii	"\301\313'\320E\360r\343\302\245+\276X\025\274|\021\333"
	.ascii	"\011\016\011\222\027\253}\351bE\264\335\270\"HY\207"
	.ascii	"\204\010L\307B \017/CB\374F\251%\261/\373A8\005\213"
	.ascii	"M.\345\177-\375\006N`\253\340\010\213}\242\005n\201"
	.ascii	"\024]\034f5\375=\314j\326\260]H\3478\245+B\354\326\211"
	.ascii	"\001kl\266\000\017\222\306dYo\261\207\205/\215\224W"
	.ascii	"\213-\377\00635V\002"
	.text
	.section	.gnu.lto_.symtab.2099428a065c88e8,"",%progbits
	.ascii	"systemBeep\000\000\000\000\000\000\000\000\000\000\000"
	.ascii	"\000\266\000\000\000systemBeepPtr\000\000\000\000\000"
	.ascii	"\000\000\000\000\000\000\000 \001\000\000beeperInit"
	.ascii	"\000\000\000\000\000\000\000\000\000\000\000\000\027"
	.ascii	"\001\000\000initBeeperHardware\000\000\002\000\000\000"
	.ascii	"\000\000\000\000\000\000\031\001\000\000"
	.text
	.section	.gnu.lto_.opts,"",%progbits
	.ascii	"'-fno-trapv' '-mthumb' '-mcpu=cortex-m3' '-ggdb3' '"
	.ascii	"-Os' '-flto' '-fuse-linker-plugin' '-ffunction-sect"
	.ascii	"ions' '-fdata-sections'\000"
	.text
	.comm	__gnu_lto_v1,1,1
	.comm	__gnu_lto_slim,1,1
	.ident	"GCC: (GNU Tools for ARM Embedded Processors) 4.9.3 20150529 (release) [ARM/embedded-4_9-branch revision 224288]"
