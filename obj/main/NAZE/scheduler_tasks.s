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
	.file	"scheduler_tasks.c"
	.text
.Ltext0:
	.section	.gnu.lto_.profile.70b92f22b7396bf3,"",%progbits
	.ascii	"x\234cf```d\200\002\000\000=\000\005"
	.text
	.section	.gnu.lto_.inline.70b92f22b7396bf3,"",%progbits
	.ascii	"x\234cf\300\016\230\340,\000\000\234\000\006"
	.text
	.section	.gnu.lto_.pureconst.70b92f22b7396bf3,"",%progbits
	.ascii	"x\234cf```d\200\002\000\000=\000\005"
	.text
	.section	.gnu.lto_.symbol_nodes.70b92f22b7396bf3,"",%progbits
	.ascii	"x\234M\307\273\001\202@\000D\301=\316\323SP*P\374\243"
	.ascii	"\2405>CB[\260!\3721#!\330\311&J\372k\226\366\372\025"
	.ascii	"(\034\220\276\243\204>CVh\010\336#\205\367D\364\236"
	.ascii	"Yx/$\357\225\245\367\306\312{'{[\326\336\007\033\357"
	.ascii	"\223\322\333Qy{\266\336\027;\357\233\332\252\011`E;"
	.ascii	"\341"
	.text
	.section	.gnu.lto_.refs.70b92f22b7396bf3,"",%progbits
	.ascii	"x\234%\301\307\001\200 \000\004\2603\200\005\033;\260"
	.ascii	"\377\216>LJ\222\231\337\210\005E\325\2546\273Cw\272"
	.ascii	"\334\036\257\221\017\021m\000\337"
	.text
	.section	.gnu.lto_.decls.70b92f22b7396bf3,"",%progbits
	.ascii	"x\234\255YkPT\331\271\355}\016\375\244i\214f4EU\322"
	.ascii	"dReMr'j\346\346Z\371\227A%\023\253\234\031\"LU&\371"
	.ascii	"\301\355@g\244\202`\350\366\326\230\252T\035y\211\210"
	.ascii	"\010\370B\020m\004\004\021\005y\311KAQA\336\010\362"
	.ascii	"\020\320\026\024A@[D\001E\270\337~\234\356>\0354\177"
	.ascii	"\322U\233}\3669\337^\275\366\332\337c\237\206\227\311"
	.ascii	"d;\240-\301\347\370\217e\262`^&C0\366\2239>+\240\025"
	.ascii	"@\273\010\255\010Z1\264Rh\345\320*\2405Ck\205\326\016"
	.ascii	"\255\023Z\027\264\273\320z\241\365C\033\220Q\3143H&"
	.ascii	"\371\274\340P\363\360\334K\355\030\207t\232\025x\230"
	.ascii	"\326\373x\206\207\241V\303\341a\371\374\353B\305\232"
	.ascii	"\243\002\376D\011+8\344\267\032\345\"/\224\207\274\000"
	.ascii	"\361\034Z\003\177\377\354F\221\206\353;\016)y\016\341"
	.ascii	"\353\254\324\207\335\232O\363aV\234P7\206\034_\227\\"
	.ascii	"\027\375P\356}J\260\012\266\202\322~\255%O\250[Z\372"
	.ascii	"-\201B\371\210G\347\321\247\330\022_\223)\250\000y\303"
	.ascii	"\264\310\241\370X\304\177F\260K\263{N\271\021\010Ke"
	.ascii	"\261\260)RXXZ\342\011\300\005'\200\013\"\300E\002\020"
	.ascii	"\177\273'E\316\177A\000NFv$((@\215\024\240\320\011\240"
	.ascii	"P\004(\"\000w\373o\276\323\360\177\"\000\347K\337\314"
	.ascii	"0\006UR\200KN\000\227D\200b\002\360,\265\3471\307G\020"
	.ascii	"\200\316\262\245F\015\005\250\226\002\2248\001\224\210"
	.ascii	"\000\245\004\340zRN\037\307G!\202p\373Y\264\232\002"
	.ascii	"\\\221\002\2249\001\224\211\000\345\004\340\364\301"
	.ascii	"\376\015\374\021:\177\276\246hBI\001\256J\001.;\001"
	.ascii	"\\\026\001*\010\300\361c\315'\225\374Y\202\340\366h"
	.ascii	"\376\376\254\022y\251\327z\245\012*T\215\324\262}\202"
	.ascii	"\020)\330\"\223V\374]\206>\365B?\367\222\241\032\264"
	.ascii	"\226<\222\241*\360\232+\3405\331\304'>\307wQ%\203\247"
	.ascii	"\237T\270O\201\340\253*/\316\264\272\023\267\364\306"
	.ascii	"\303\252\224\306T\005qK7<\254\275:wK\303\027\320\245"
	.ascii	"$\304Yok\3702:\330{\266:A\011\206?\325\020w{\220>\237"
	.ascii	"\255&C\034^\236p\213k\034\025\262th\255\006\023\261"
	.ascii	"\305\345\016\3771\012\330\334D\032t\315\276p2\033\177"
	.ascii	"\342\360\212\222\242\004u\243N\206\256\302\012ja\005"
	.ascii	"\350\006,\352\247\032b\213\256\303\315z\270\011\300"
	.ascii	"7\027\256F\313\221f\355\362\223\032\226\231D(L\355K"
	.ascii	"Y-\010n\350\026P\250sP\000F\366\240\211\273PT\243v\343"
	.ascii	"\340.6\3723\221`\354\2450\255r\216L,\250#4o\223\320"
	.ascii	"lD,6/\017\326\377\203?Mc\363`S\177\261;\013\301\305"
	.ascii	"AG\010\302\024\324\344\264\371M\342\3467\223\315\267"
	.ascii	"\305Ttz\362\227(F\367\322R\003G0\254\215\005\261\336"
	.ascii	"\024\202\270O\213\023B\213\210\320J\0202\236\355\375"
	.ascii	"\001\177\235\002$W\307]a\021\320$\365\2776'\2006\021"
	.ascii	"\240\235\000\034\352\351J\340\371n\212\320b\031\272"
	.ascii	"\257\243\010\315R\204\016'\204\016\021\241\223 \\J\210"
	.ascii	"LS\360#\024\341QSU$\013\242\026)\302\035'\204;\"B\027"
	.ascii	"A\250?\323\276\240\344_R\204w\217\262{X\024\265J\021"
	.ascii	"\272\235\020\272E\204\273\004a&\315\226\250\345\367"
	.ascii	"\363\004\341L\332\263QD\021\332\244\010=N\010=\"B/A"
	.ascii	"XL\210,U\362\351\024\341q\346\210\027\005h\227\002\364"
	.ascii	"9\001\364\211\000\375\004\340\330hI\232\007\177\216"
	.ascii	"\002\324Zs\313\265\024\241O\212p\317\011\341\236\210"
	.ascii	"0@\020ZNdg\323\262a\3411\310Ry\357CD\002\364\327\204"
	.ascii	"T\214\255\326\203/\247_\320x>\343\177\371Zr\3556r\262"
	.ascii	"\250\334\023\255\365\362\322\210\211`\004\\\372\301"
	.ascii	"\277$\202\271\337\342\0072\234ZpOb\312\226\"\360?\262"
	.ascii	"\247\026+\004\024~$C\303\340\365\017I\014\242\341\303"
	.ascii	"/\366\3135\314:\356\337Y\247\306\247\306i\265\361\216"
	.ascii	"xE\217\200\214\030\2622\364\030iY\004&\246\314\306j"
	.ascii	"\371\033t=\365\307\336~\307\267\322\353\256\302\254"
	.ascii	"E\245\004\002\207\221\003b\314\016q\246\242\267Z\301"
	.ascii	"\367\323i\331G\217\025\310\211\\*RP\012c\366yJP\316"
	.ascii	"IP&\354(\326\252\354$w~\204\242\\\251\332_\246\344'"
	.ascii	"\351@,\344ZZ\310\305D\270\232&\302\304\346\264k<\031"
	.ascii	".\021\353\343\235}\227\335\3707tj\374\300\271\026%\037"
	.ascii	"\351\206\007\\\312\310L\016\022\323\230T\362\031\020"
	.ascii	"q5\313a\317\201\234M\314aq\271\355kp\016{\011\362M;"
	.ascii	"r\330j{\012\343\254\2759\177X\036\364\365\373@\247\366"
	.ascii	"5\177\204A_\001\350\013\007\350K\247\304x\250\253\261"
	.ascii	"r\331\355^\016\024g\235\305\213e\012>\201,\024\035m"
	.ascii	"J?$\347\323\351 \351aJ\227\033\237\355&)\"\336T\273"
	.ascii	"\343\023s\245*2\204\300\300\21393\324\361Pm/!O\216\375"
	.ascii	"\004\323\\\004\232o\0344\275\235K\010dhy\036T\0031?"
	.ascii	"\243w\300\317\233\361{\0137\027h\011)\031~v@#\002O5"
	.ascii	"$\222\302 p\0324\357\000^D\037D^Z\026\031Y\342o\364"
	.ascii	"\250\371B\272\276\007\263\017\256+I\360n\300\303\272"
	.ascii	"\312\344!\035_K\237\235\230m\271\345I\334\350Gx\230"
	.ascii	"r\240wH\303\267\322g\267\343\366\203\013\017\322\201"
	.ascii	"X\241\265\264B/\035XHp\343'\350\263W\351\365\303</\310"
	.ascii	"\311 o\270-\305\203\030~\202\207Q%E\005j\376\010}vp"
	.ascii	"\274fI\303\347\310%\264\264\204\326\212\327\226DH\222"
	.ascii	"\037\263\317*hk\241Y`\325\266\2712\213\347\251b\241"
	.ascii	".\232'\025q?\307\243c\334*G\261\215\347p\324\374\002"
	.ascii	"\376\310,BR\244\265m\244\311]H\335\200f\301x\016Qc\346"
	.ascii	")\317H\200]E\324V\210\264\266\3267h\205\306\015\004"
	.ascii	"x\012\271\000S\353_\330\215[\242\2501\004(\232t5~\352"
	.ascii	"\012}\273\276\211XC^A\243\256\326\237H\221\373\353\367"
	.ascii	"i\205\274\015d\367\367\262\365\3317\231\322\210\344"
	.ascii	"\354\326MN\310O\226Ev\2421\340\264\302\030W\351\242"
	.ascii	"9\207u2>\\$\011\302\347f\031\032\004\203!\362\265\330"
	.ascii	"\034\334\013\245qkQ\012\3671:\002\355\004\264dhI\320"
	.ascii	"\016A;\014-\025\332Qh\307\241\235\204\226\010-\003Z"
	.ascii	":\3671\361_\314\3052\230\245`Lb]\231\354\343$\212X\356"
	.ascii	"E)\230\036Q\256zDKM\255\315Yt\205\220}\321\370\362\333"
	.ascii	"B\214q\234Yk\263\024\002\302&2\261\330\311\354\374\254"
	.ascii	"\023NZ%\2702<\350\302\360\201}1q\313/\306\261\011\226"
	.ascii	"\247v\333\003\313{/\265\205\244p\342\302\311.-Z\265"
	.ascii	"v\271\335@\247a\023\376S\033B\324\230\012R\241S\000"
	.ascii	"x\337\221q\2604b\306\355M8\274\212d\016+I\035K\303\231"
	.ascii	"\264\214%(\360\360R\346\300,}{\324\341a\311\253\034"
	.ascii	"\013\207\323\263 \2265\255sy\315\342p=\376\304\013\235"
	.ascii	"\341H\216\232\256\271\231\254]\231\304\226\351m&<,\234"
	.ascii	"\027\312$\202ds+\305I\330\272\350\306\213i\005\337A"
	.ascii	"SGj\371\276^w}\237<CP\221\207{\353.t\321\014\367\033"
	.ascii	"<\234\315\262N\320\323\211\222$\265\230\212\012\035"
	.ascii	"\031\022\326\331\331\266c\036\357\247\231/\322<GiNE"
	.ascii	"M\\P8h\"r\202\311\005\232y\204\346yB3_\244996\235'\227"
	.ascii	"\224v0pB/\340\304\322\036"
	.ascii	"\365\240\177Q\245\037\2055\244z\023\024\374\256;\330"
	.ascii	"=\241\370\347[!\025\316\352\335Fl\214.pzb>;-\304x\300"
	.ascii	"\2438\301:\361'\222\200\340U\231<\261\010\266yO\362"
	.ascii	"\322c9H\0268\331\225^\245%\305_\216\207\005S\221\013"
	.ascii	"\312\215\245B\234\305\233H\214}\346\"\367O\342/\205"
	.ascii	"\320c\237)\202\365`\277\271D\327\234x1\373%\255\012"
	.ascii	"\344\264\227\2279\330\302\277_\261RQ\261\022:\273\313"
	.ascii	"\2269\240c\212YD\305\034\346eD\261RQ\261\352\236\272"
	.ascii	"\233j\211be\022\305\312\355\212ef$\227y\350\237Q\305"
	.ascii	"\312\250bs\251y\323T1\353\374g\330\026]f\202\211uHG"
	.ascii	"\353\220(\212\226\212\222\377\350\322\230\352\375K\252"
	.ascii	"\026\227TK\353\351\323\224\353q*W'\250\004\321\252\210"
	.ascii	"\023\324\220%U\213K\352\312;\320'=h\326H\226t\305\276"
	.ascii	"\244\261\356\261R\017\375K\272\244\032\272\244\361\310"
	.ascii	"\224b\236,\311\362\017l\212\256\262\025\225\334J\254"
	.ascii	"\363\244.\360\226\272\300E\346\002\327\036\014]\321"
	.ascii	"\021\027\030\223x\374j\352\361\257\237\026\314\310\211"
	.ascii	"\007|b\367\200\012\330y\2349j\231'\3241O\270\306<\341"
	.ascii	":\335K\361\007\"\035\375\201\250\362R\322\274\216\014"
	.ascii	"\177\217\207}\215\307\377\207hJ^\342\027\242\246^\177"
	.ascii	"\300M\032DM\237RM\217v[\017\374K`\335\204\257\277E4"
	.ascii	"m$\2326\210\232V\344\337\034\324H4m\224hz\333\256ia"
	.ascii	"\373\213|7\375<\325\264\221jz/\2670\206\271\311\376"
	.ascii	",\0056FML\325\244\323w\256(\251\252\361Y\356D\326\""
	.ascii	"&\353\370\315\366\022\372sB\322W\316a\261\232\206\305"
	.ascii	"\320\263X\233\312%\260\232\231\234-L\316V&g\2334\260"
	.ascii	"t\024a\366\374D\231\356\375\212u\212\212U\321\331\326"
	.ascii	"\252\013\371jW\305\340X@R\025\274\272\022\305:E\305"
	.ascii	"\342,\205.\357*w$\212u\331\025+\261\234\316E\372(\005"
	.ascii	"Q\354\016U,c\240*\226z\2415\025\024\003c\324\315\024"
	.ascii	"k.:\035\247\243\212\235`\212\0253\305\372\256\226'\313"
	.ascii	"]$\271\313$\351Y^\022\361\267\036\035\375\255\247\371"
	.ascii	"Ht\211B\037\257pN\213Um\343\265*\312\3454p\301i\261"
	.ascii	"\237q\231{=\234\357N\271\3441.\245\214KC\306X\261\033"
	.ascii	"\331-z\312/\252Ov\335\255{\214\332\200\013\265AJM\314"
	.ascii	"\031:\2323\236\036I\217\321\352S$\324j\356\357\273\317"
	.ascii	"d*d\324\0360jw\257\037_\324Pj\025\214Z9\2436\363\244"
	.ascii	"\264O\353\302\305\312\270<\\\236\213\030\322:\032\322"
	.ascii	"\305Y9\345j2\374\234x\306b\222\340\371~Gz,:R\036\005"
	.ascii	";r4e\212w\315\320\2178/vX\032%\216\364Xt\244\013\335"
	.ascii	"w\217\"\211#\215J\034\351\211\335\221\206\336\015\277"
	.ascii	"\323\350\323\250B\243T\241\023m\335\331\210*\004G/l"
	.ascii	"\014\245\231*d\261D_WQ\205\032\231B\025L\241\336\216"
	.ascii	"\314bwZ\324N\222\355\033\236J\234\366p\221l\234I\366"
	.ascii	"\224I6!\225L<\006\350\3501@|\325\321\321W\235\342\236"
	.ascii	"\201\017(\366\334\256\030MV\371MGF\344\256\241\367\214"
	.ascii	"\2435O\206lD\261\347\242b\017+\307\247\2445\315&Q\354"
	.ascii	"\205]\261\354\330\276i\271>\213*f\243\212\025\246M\035"
	.ascii	"TS\305\332@10F\323L\261\250\273\011EnT\261\366zwr\340"
	.ascii	"mf\212=n\252\034G\364Q\037\023\263\225=*\1778z\335\303"
	.ascii	"%\377\277\004\315\360\251q\206i\370\312ECv\022\030\212"
	.ascii	"\214\356R\353s%;:\2670\3711;\244\330\032\264dGg\031"
	.ascii	"\277\321+\347\3228Jb\236\221hg$\272\236\037Zr\365\371"
	.ascii	"9\366\345\363.\307\020\266\201\254\274\350hy\2616\264"
	.ascii	"&+\365E\012\347Z\331\362\242\347\246\234\345\365\034"
	.ascii	"\005\251\226\013\214\312\211\332^\222\362q^\317\241"
	.ascii	"T:E=2\366\036Q\021\347\352\210%y8\267\242\265\233w\341"
	.ascii	"\366\216q[d\334\226\244\334\016\276y\321J\343QC\352"
	.ascii	"\344\313\251F\205\276\\\222B\313O\26670\317O\313\241"
	.ascii	")4\222\247\344\312FZkYnHg\344\272\030\271\222\256\361"
	.ascii	"Fw\027.Q<\345\022\315/\313\345IR^!\315S\356xx\261sr"
	.ascii	"\236\323_Q8\027\300\271\2731\245\356\224\313\371\034"
	.ascii	"Z\000\3671.M\343\2039\314\247\012\030\227\273\214\313"
	.ascii	"\331\334;\363T\250\274z\022\2053\325y\225\256g\3118"
	.ascii	"Fn?#\027\317K\2430\306\266_C\310iI]I\351\312V\352\033"
	.ascii	"$\016\025\177\255\255U\313<*\255\231z\324A\306\256\277"
	.ascii	"\350r\033s\3536\306\256\227\261\313\357\034\234sU*\221"
	.ascii	"\2219\304/\353Q\223\305\226[*B\306\203\010wuR\340\310"
	.ascii	"\320\317yO\265tO\253^\305V\177\340<s\204g)\342\026\305"
	.ascii	"\036\217?w\202sM\021) \306a\036\233\037\345W\212\223"
	.ascii	"\310Ww\225\237\222&U0pB?\306\213)\342X\363\375bw}\007"
	.ascii	"U\014\243\300\275\323iw\366R\305\254\367a;\301\030\035"
	.ascii	"g\202\235\237\313x\303N\211\017\230`\375L\260\373\266"
	.ascii	"[\227XR\325\223\222x\366y\277\306E\300T&\340\011&`\032"
	.ascii	"\333\315\3474\017\212\257|:\372\312\227s<\3670\247\037"
	.ascii	"\220\270\232\2550\177\202\225\304\347\314\3252\030\267"
	.ascii	"\214\203\302\024{\211\231c\334\006\030\267\205\242;"
	.ascii	"o\324.\\N1.\247yiId\\\022\007\012G\350ac\016\341\327"
	.ascii	"Ex5G\305\334F\364_^\250\036\272\033`\335\016}\007\364"
	.ascii	"\275\320\367A?\004\375}\350\207\241\037\201~\022\372"
	.ascii	")\350_C\377\251\027z\003\335[\030\012\374F\264\027\026"
	.ascii	"\036\003},\364\007\240O\200>\011\372d\350\323\241?\011"
	.ascii	"\275\205\337H\216\220\2231\037\375,S\260Xl\005\035!"
	.ascii	"{\005K\244 \340\377\217\020N9\034y\261vz\261\305w\316"
	.ascii	"B\222B\2310\033\235\341\177&\323\230\015\246\277\371"
	.ascii	"\3571\231\215;\025_|\365\215\367f\331\217\327\2557E"
	.ascii	"\004\255\337i\010\011[o\012\332a\014\336\035j\214\010"
	.ascii	"\304f\246uA\262\037\342\213/\341\231_H\360\266\360\360"
	.ascii	"]\233w\030\203\376\266\022\337\374fW\260\301l\3641\233"
	.ascii	"C\314\273\203\215k\234n\005\005\031\001\"|\247\321l"
	.ascii	"\214X\201\357\377\336\020\026\034j\3647F\204\030BW8"
	.ascii	"\0147\031\215\273\214\021?p\272a0\303\224=\362\300M"
	.ascii	"\341\341\241\252\335!a\346\377\376,\320\254\011\014"
	.ascii	"\024/\177\275~\267)b\275!b\347/\303\302\303\214\277"
	.ascii	"4\032\376\022\262>$,(\024\010\300\002\202v\204\204\031"
	.ascii	"\327\007\006\033\377j\330\035j\0164\357\331e4\255\333"
	.ascii	"!\373\371\007&\231\366\230\326\007\232\314\301\200\017"
	.ascii	"\226NT\266\177OV\272\302\371\016\226\301\311ds\370\316"
	.ascii	"]\006\223I\347\314?\"\334\3231\364\017\0173D|\204\307"
	.ascii	"\233\015\241A\273C\2616\241T.'\230-!\246]\241\206=\036"
	.ascii	"\370N\000\010\007\262E\354\321\342\3216c\260\2779\""
	.ascii	"d\227*\350\257\0010\0144\273\005\3550D\250\360\243\257"
	.ascii	"\014;\215\356\246\335\177\011`\327\352 \314\366w\273"
	.ascii	"\303\202\310c|\341\021l4\205D\030\203\375@\366\360`"
	.ascii	"%\226\3607\201f5\025\023\256t&\263\301\034\022\344\007"
	.ascii	"O#B\314{\210\334\277\332h\227\033_z\006\357\0113\354"
	.ascii	"t\330\020\216>\337\0317\357\011\0125\232t\241\006\223"
	.ascii	"\331\367{c\320n\2631\330\307L\206\376!\337\205\031B"
	.ascii	"\361\360\207\206\3773F\030"
	.ascii	"\2763R\203\220\360\260\200\220\235\306UdY\260h\223y"
	.ascii	"\2131\324l\300\367V\3544|/1Zi\0167\033B%\267\326,\347"
	.ascii	"\243\260aJ\252\214\311c\035(iX\307FJ\377o\375\003|\277"
	.ascii	"\224\271\371m\335\"\223\177\361\355\366\257ej\237\200"
	.ascii	"\200\255\001\337l\361\225)|6o\366\335&S\372\373n"
	.ascii	"\337\352\003\375&__?\337\3552\325&\260\360\335\376\255"
	.ascii	"\214\337\376G\231j\363\327_\372\371\370\373\313\344"
	.ascii	"\233|`\262\302\377\353\257|\266\003\3066\206\241\332"
	.ascii	"\262\325\337o\233\317\2672M\200\3576\337/}\003`\236"
	.ascii	"z\233\357\026\377\200\355[\375d\377\017\207\375\202"
	.ascii	"\202"
	.text
	.section	.gnu.lto_.symtab.70b92f22b7396bf3,"",%progbits
	.ascii	"cfTasks\000\000\000\000\000\000\000\000\000\000\000"
	.ascii	"\000\242\001\000\000taskSystem\000\000\002\000\000\000"
	.ascii	"\000\000\000\000\000\000\254\000\000\000taskMainPid"
	.ascii	"LoopCheck\000\000\002\000\000\000\000\000\000\000\000"
	.ascii	"\000\256\000\000\000taskUpdateAttitude\000\000\002\000"
	.ascii	"\000\000\000\000\000\000\000\000\260\000\000\000tas"
	.ascii	"kUpdateAccelerometer\000\000\002\000\000\000\000\000"
	.ascii	"\000\000\000\000\262\000\000\000taskHandleSerial\000"
	.ascii	"\000\002\000\000\000\000\000\000\000\000\000\264\000"
	.ascii	"\000\000taskUpdateBeeper\000\000\002\000\000\000\000"
	.ascii	"\000\000\000\000\000\266\000\000\000taskUpdateBatte"
	.ascii	"ry\000\000\002\000\000\000\000\000\000\000\000\000\270"
	.ascii	"\000\000\000taskUpdateRxCheck\000\000\002\000\000\000"
	.ascii	"\000\000\000\000\000\000\313\000\000\000taskUpdateR"
	.ascii	"xMain\000\000\002\000\000\000\000\000\000\000\000\000"
	.ascii	"\315\000\000\000taskUpdateCompass\000\000\002\000\000"
	.ascii	"\000\000\000\000\000\000\000\317\000\000\000taskUpd"
	.ascii	"ateBaro\000\000\002\000\000\000\000\000\000\000\000"
	.ascii	"\000\321\000\000\000taskUpdateSonar\000\000\002\000"
	.ascii	"\000\000\000\000\000\000\000\000\323\000\000\000tas"
	.ascii	"kCalculateAltitude\000\000\002\000\000\000\000\000\000"
	.ascii	"\000\000\000\325\000\000\000taskUpdateDisplay\000\000"
	.ascii	"\002\000\000\000\000\000\000\000\000\000\327\000\000"
	.ascii	"\000taskTelemetry\000\000\002\000\000\000\000\000\000"
	.ascii	"\000\000\000\331\000\000\000taskLedStrip\000\000\002"
	.ascii	"\000\000\000\000\000\000\000\000\000\333\000\000\000"
	.text
	.section	.gnu.lto_.opts,"",%progbits
	.ascii	"'-fno-trapv' '-mthumb' '-mcpu=cortex-m3' '-ggdb3' '"
	.ascii	"-Os' '-flto' '-fuse-linker-plugin' '-ffunction-sect"
	.ascii	"ions' '-fdata-sections'\000"
	.text
	.comm	__gnu_lto_v1,1,1
	.comm	__gnu_lto_slim,1,1
	.ident	"GCC: (GNU Tools for ARM Embedded Processors) 4.9.3 20150529 (release) [ARM/embedded-4_9-branch revision 224288]"
