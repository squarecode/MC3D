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
	.file	"accgyro_l3g4200d.c"
	.text
.Ltext0:
	.section	.gnu.lto_.profile.89040a518012e358,"",%progbits
	.ascii	"x\234cf```e\200\000F\206\016FG\000\002e\000\324"
	.text
	.section	.gnu.lto_.jmpfuncs.89040a518012e358,"",%progbits
	.ascii	"x\234m\317\271\016AA\024\006\340\363\317\265\025DM%"
	.ascii	"\361\000^J\341-H\334J\210N\241\021\215}\337:\015\021"
	.ascii	"\205\204\220h\024B\242P\211%\"\232\0333\347^Ka\232I"
	.ascii	"\276\374\363\2373\032\375?!\230\267F\000\2426q\021H"
	.ascii	"\214W\031\317Q<\005E\010E\370I\341<vJ\272\030K \224"
	.ascii	",\275\031\267\241`u\020\312\022I\325 \252\211\317\303"
	.ascii	"}\352\336\005G\002\204\212\031Q\236\326\007[\207r\330"
	.ascii	"\011U\351\254\213\3358\355\346\264 \324\244\3764\365"
	.ascii	"\313\353\215\271W\220P\267pz\315\0364\306\263\334\253"
	.ascii	"\361\356\311\031z\213\247\"Lh\252\254\371\275OYs2\033"
	.ascii	"\361x\362\022Z\026.\263\205\270\227Qv\265\277\273\366"
	.ascii	"\362\305\207\223\333|\204\216\362\027\345IV}"
	.text
	.section	.gnu.lto_.inline.89040a518012e358,"",%progbits
	.ascii	"x\234cf\300\016\016Aif\0066)\031F\006&\371o\363\031"
	.ascii	"\0318\217\3512\201\004\331\370\031\030X@\014F\006Y;"
	.ascii	"F\026\206\214\217L\214\3237\277hc\177\301\364\223\211"
	.ascii	"\301\214\201q9\243\024\003X\364\365\341y\233\230\300"
	.ascii	"\242~\014\214+`\242\267\247\315\332\302\015\026\215"
	.ascii	"e`\\\011\022e\004\332\304\366A\217\201m\201<\023\203"
	.ascii	"\300\001;\005\220\351,\274 \373\031&\3701q\203T@HV>"
	.ascii	"\260 \224\307\304( \017$9\357\2313p\366i\200\035\007"
	.ascii	"R\000v\034D\005\003\00077 6"
	.text
	.section	.gnu.lto_.pureconst.89040a518012e358,"",%progbits
	.ascii	"x\234cf```g\200\000f\006)F\011&)\000\001\266\000]"
	.text
	.section	.gnu.lto_l3g4200dRead.89040a518012e358,"",%progbits
	.ascii	"x\234e\224\373K\223Q\030\307\317s\336w\357n.M'\325\322"
	.ascii	"\012\314\"\250^\313\350\327\256\320\237\321E\313\202"
	.ascii	".`\024EHg:1\"\272\330\225\242B\272Y\231\245Y\315\345"
	.ascii	"r^*#\313\226FY\222\006\032\025\025\311\0066J\355y\316"
	.ascii	";sn\202\317{\316\367}\256\237w\347(,\361/\027\377\033"
	.ascii	"L\214-\301'\230\030\360\243/\031s[8W\033f0\221\244t"
	.ascii	"\351L\330\024P\015Y\005\240\005\003\266\237+*\354\207"
	.ascii	"\257|\220C{\375H'\314\275\"D\361\257b\377\236\323'\326"
	.ascii	"E8c!\316`\276\013\346\271\310\375\032\314E\277\326\222"
	.ascii	"W+\225y\300pY_\035~a\377\302#\034f\321\326W\336vF\243"
	.ascii	"-Wi\373\374fi\235#\373\022&\014\264\327\212\345j\204"
	.ascii	"+P\011\012\245\274\016.\270\001.\206\022\203\233\220"
	.ascii	"M\356\236\357_[5e\221L\334;\324\333l\226\211sh[^\352"
	.ascii	"\365N\222\2115\332V\334\365\336\261gU\210\200\350\373"
	.ascii	"vi\215h\023\236\276\321\321\231\021\256B\225\221\376"
	.ascii	"\026\246\257\006W\024\016F\014z\206\337\3325\217\020"
	.ascii	"\"\005nC\026\215\205\363\334\001\015\360A\312\355\324"
	.ascii	"\200\030\035\015\205\217U.\203Y\200}1\023\031\015\215"
	.ascii	"\311\214F\263\220\261\2421\333H\263\323*\211\214\003"
	.ascii	"h\200d\022S\310g2\231Tz\223F\232\223V\351d\246\320v"
	.ascii	"*\275\235F\206\2067O'-\203V\231d\030\353\307\306\350"
	.ascii	"\333\014pNO\245\007\312\002\335e\016ju\210\233p\222"
	.ascii	"\013\235\207\253y\321\037q@X\"\334\022\3424@\015\024"
	.ascii	"\321\220\007[^\237r\020%\353f\006\265\340B\351\245\370"
	.ascii	"y\310\"\245J`pWj\241\221\220\237KMcP'\245\252\340\361"
	.ascii	"\220\255h_\204\333\210\005\025cp\017\212\"\334\316\336"
	.ascii	"\200\247\273d\303x\375\336\376\216\240\314H\000\357"
	.ascii	"G\031\017\340g\354\322\225\367P\354\253\371\353\266"
	.ascii	"\032\336\032zwv\264\205\223\365\005XK&\316\222\356\360"
	.ascii	"\000t\206\276\037\313\372U\303\325\214\336\250\224\364"
	.ascii	"h\306\336\202\022F_>y\252\312D\265\220>x\261\026\006"
	.ascii	"\275+\353\342\206\223\025\375H\361}\322\015\301\226"
	.ascii	"Xp\266Q\260~\254\340X\254\035\275\251`8Z0I\246\263\223"
	.ascii	"Sy\205\223\264\330Q\025\371\033\272\367\373\342\017"
	.ascii	"\307y8\347\026\"\220\021\241\020\007\370\010\000<\204"
	.ascii	"\363\2009d3\203\377\347O\306\230\263o\007\302\212\234"
	.ascii	"\200S\212\017\265\215~\353xw\015\006>\360\307\363H\301"
	.ascii	"\350X\036\223QJ\004\220\212/&\000HK\004\220mTx\024\017"
	.ascii	"\300\211\336\261\000\322e:\347D\000\035}-G\222$\000"
	.ascii	"\331\275\373\231\367\2655\016@\243\004\020\220\000\322"
	.ascii	"e35\303c\000\246\304^\011\232\274\022>\364\034\272`"
	.ascii	"\033\357\256)\012\2409\036\300T\214\216\0050\015\245"
	.ascii	"D\000.|1\001\300t,\361\275\363\234O6\255\231\250\342"
	.ascii	"\221\246c^\363x\305\226h\305\326x \031\030\035\013$"
	.ascii	"S\246\317\230\010\344r\2607(?\247\"\247\371\3311|\335"
	.ascii	"\026\007\344\261\004\362D\002\311\224GC\225\007\371"
	.ascii	"=4\2773\311\033\007\333\300X\321\324=\244-\255\023\007"
	.ascii	"\000\357-\006Oa)\373\010\356\0246D'\3723\000\235-\336"
	.ascii	"\343\317G\327\340\331\253%\311\362\310\341\031n\003"
	.ascii	"\227\322\336\350\304\213\002(/\036\3039\013\365\235"
	.ascii	"\205y\372\266\365[\266\353\371\205[vo,\334\251\257\317"
	.ascii	"\313+\330[\270c\355\326\334\202%\213sr\362\027\3461"
	.ascii	"3\011+V\257R6\354\332\364\017c6\375\272"
	.text
	.section	.gnu.lto_l3g4200dInit.89040a518012e358,"",%progbits
	.ascii	"x\234}\223\357oSe\024\307\317y\236\366\336\313\332\341"
	.ascii	"\"oL\023\301dAB\242\024\321\270\350+|\243o\214\361\037"
	.ascii	"0\272t\210\213CH\207\032_\020n\307\265Q\020\206\013"
	.ascii	"A\304\204\215L\343\346\334\017\351\306\264\023\274\330"
	.ascii	"\271\032^\214\210\302\006LV]5\030\023\005Z2\252\223"
	.ascii	"z\316y:-Bl\322{\237\234\236\317y\316\367{N5\334\372"
	.ascii	"i\241o1\000\360\030\275q\011\240\332;\011\220pT\300"
	.ascii	"\032_\006\256\243\345\031\220g\320D\3202)\201\305Cp"
	.ascii	"\361`);\275\034\334\260s6\012n\215\215\216\011;\210"
	.ascii	"|\000\204\355J\007\202\226\355\340v\374E]Q\270\327\357"
	.ascii	";\020Z\365\201\353\272\227\257\246\266\272\373\236+"
	.ascii	")\200\2022\235\341\207\270\212rR\345B\177@\257F\240"
	.ascii	"\363G\251\216\016\275\262\333u\333\374\223\003\356z"
	.ascii	",)\304\036\324D\340}\021\\\035\001\012\000\366\342J"
	.ascii	"N\316\277\373\373HX\337/`zr\266\253\266\3760\201\271"
	.ascii	"\336\271\211\220{\300\365r\345\362\212\222\242\232\325"
	.ascii	"\274\371\0200w\342\372tP? prWW1d\340\276\356l\025\214"
	.ascii	"\370\361m\341+\336_S!\313#Yu\330\207\365\330\217\365"
	.ascii	"F\025\016\240\205\000j1:x\247\357\226\313\251\357\336"
	.ascii	"\356i\3000uN!\215\334\277\015\234RCz4@\236P6\360'\245"
	.ascii	"\370\255\317b\233?5\261T\212\021A\027\316\346O}\343"
	.ascii	"\\R\254\036p\020#p\016_\367/L(N\231W\2322N/,\364`;\356"
	.ascii	"Nxnn\240\333b\237\241(F\343\020\305)\343\235\324\245"
	.ascii	"\244-5\036f\015\2037~\273Vk\200\256\264\246|\374\204"
	.ascii	"\352\026\371\006\300#\006\3715s\350\210\022\344)F\206"
	.ascii	"\022\357?Z!\216\011\221\022B\204\017\033\342\302\376"
	.ascii	"\203\303!!\236ab2s\334S\025\344kAF\004\321\214\034%"
	.ascii	"\004X\265\206\361ez\032\023u,\207;`\003\346\223+\252"
	.ascii	"\014\350\234z\363\217\245Rw=\340(F\204\013\334\314)"
	.ascii	"\341\026\254*\2540{x\235P.\231\377i\005\013\336\214"
	.ascii	"i\301:\354*\254?5\366=\012\347\023\367Y\205\263d8\014"
	.ascii	"\212\263D\325\311D\347\251\343\031\364\374\367\2622"
	.ascii	"\017\326}\350\333=\003j\333\237\356\033\256SR\201\202"
	.ascii	"\214-\215\333\370\247\316\033\336\220\324\0166\001\216"
	.ascii	"a\244Dug0\351wf\303f\232\366\177y\273\300\026\343\347"
	.ascii	"\206\337\2319\275\277Vz{\001\360\030F(4\322{\346\274"
	.ascii	"\011\325\003\036\227P\366\352\301\274\226\320eR\360"
	.ascii	"\005_\343P\307\322 o\036]\003g\320;\267cn\317]\377^"
	.ascii	"\373\317\232\361}\276\310\206\237\021y\343\324[\243"
	.ascii	"\327\221\235\327\303\015\354d \337\300\306\004\367="
	.ascii	"B\316\330\220^\256\331\202\224\021q\213\005K\012<r<"
	.ascii	"a$\234\312e\332\303\322\034-\304\227\334[\215\030\354"
	.ascii	"\210\301\\g\364\377\255\314\230:\355\336\321\213\226"
	.ascii	"X\031\004\0347V\236\307\035\305\344\217w\033M54\032"
	.ascii	"\312\233\316\265\235\224\245\324w\000~E\262f\320\272"
	.ascii	"m\371\212\323\023T\276b\355\017\273\257\245\314&\334"
	.ascii	"\003\230\305\010\325d'/b\302\037{Bj\000\377\177\221"
	.ascii	";'\364\3365\321\326x,\272\251\261\371\245hS\274\371"
	.ascii	"\225\015\361\326hc,\266\361\265\370\346g[\036\334\370"
	.ascii	"\320\272\265k\233\326\304@\267ly^7\306^\254\333\264"
	.ascii	"\345\345'7\277\372tck\353\343\315-[7\304\377\006d\373"
	.ascii	"\317\007"
	.text
	.section	.gnu.lto_l3g4200dDetect.89040a518012e358,"",%progbits
	.ascii	"x\234\215\223\353KTA\030\306\337g\316\331\343\352jj"
	.ascii	"\364\305\215 \020\013+/]\360s\177\202\177@\020\266\212"
	.ascii	"\011]\300@\210\020gU\320B\272h\224]\254,\272\347j^\252"
	.ascii	"\265\262\243\225DWT\242\024+\021\215\242\242t\325\355"
	.ascii	"P\271\315;[Q\344\007\007v\347\314s\336\367\367\316<"
	.ascii	"\363\036\203\376\037k\325\357\272A\224\243f\270\010"
	.ascii	"b\377S\"\277[\010\363a6\3118\243w\011\311x\003fT6\001"
	.ascii	"~ P\2310L\224\341\275\230\020x\034\234\035\300\362\263"
	.ascii	"R\226\177\351\371\374*\327\206#\210B\202\260\312\213"
	.ascii	"t/\207\237\307r\025\327T>8\3566\322A\3529\030\230z\342"
	.ascii	"y'\034\201\245\274\354\254}Po\361R\230\274\234\256\031"
	.ascii	"\361\244\235Q@\273\253U\2567\035a\340\002\014F^\204"
	.ascii	"\027\227\340%%\021.#\215\243\003\025\375\273\205\221"
	.ascii	"\251\271\255\207\203u\236\324Fi\227\217\314vn\260\375"
	.ascii	"\247\344l$\2426d\342J\024\360{O<T\374D\345\217\027\036"
	.ascii	"\253RJ\231\204&\244\362\266\325~\003\260\240&V\232\027"
	.ascii	"\3322\022\011uuwZ\361Pe\311R\177\256\030\350\3424\246"
	.ascii	"\302\331\221q!x6\206Qi\037\350\025\014`\372\211\201"
	.ascii	"\275\001Q\372MVK\267#\254\220`h3J\371U{\343\371p\014"
	.ascii	"\2378&\205\320\002\257#\3344\214*\373\2405grlHU \\\215"
	.ascii	"&\357\271\333\177(\201\223\315\315\204Vx\225\324|\377"
	.ascii	"Q\217v\320L$\264i\251\357\350\271\212D-\201\320\256"
	.ascii	"\245\357\023g[\342Jw9\"\216\317\246+\241\003\245\216"
	.ascii	"\360\320\020\312k'\3567\272X\014\013K\273\361\034\225"
	.ascii	"\203\025\233~)*\275ax\272%\226\211\256\001\205\274\206"
	.ascii	"\250\221\343\352.z\227\030\0120S5S\237\313\341*\366"
	.ascii	"\315\330\263>7\307\032\332\350\216\257'?%4\340\230_"
	.ascii	"J;\305\021\361a\021\203\353\014P\357\216O\325\015&f"
	.ascii	"\254tD\002n\240\001\223|\007\204 2\376q\301^\341\210"
	.ascii	"\005!\306\241S\331\240\313\315\376)7/~\"nj>\230\177"
	.ascii	"k\016~RH5 \341v\224?\331\362\344\200k\036\374\323\037"
	.ascii	"\356\215.`~2\2724_7\321\035\315\017\216~\364\033\213"
	.ascii	"\217(~\365T$RF$y\3305\201}\252+\223\0116\026k\013M\335"
	.ascii	"?C\350y\251+\262\375*[v\017\206\255\234vY\315-L\350"
	.ascii	"F\016\275\206?\211\302|\204\267\300\337>s\315\036x\305"
	.ascii	"\275\325\177\337\275\372Vq\027^\343q\333\"\325\255\340"
	.ascii	"**rYf\326\216b_\326\326\274\242mY\371\305E%\005\305"
	.ascii	";\262\362|\276\302\235\305\3337nY[\270nMvv~\246\217"
	.ascii	"L\026\334\371\005%E\276\202\242\374\237\3724h\366"
	.text
	.section	.gnu.lto_.symbol_nodes.89040a518012e358,"",%progbits
	.ascii	"x\234cf``\330\300\000\005L\362\365\014\014\023\3161"
	.ascii	"0\324\3273\314Y\321\301\303\300$W\317\210* [\317\004"
	.ascii	"\023\230\267\200\203\201Q\261\236\031\302ghh\000r\225"
	.ascii	"\352Y\220\271\012\365\254\310\\\345z6$.3\020.y\360\217"
	.ascii	"\221\231\221\225\241\245\375\215<3#\013\303\0220\315"
	.ascii	"\306\320r\352\030\033H|I\027D\374\011\210fb\205\250"
	.ascii	"gbf8\002\244\031\000A\362/\317"
	.text
	.section	.gnu.lto_.refs.89040a518012e358,"",%progbits
	.ascii	"x\234cf``\340d\200\000&&&FV&\0066\006\000\001P\000!"
	.text
	.section	.gnu.lto_.decls.89040a518012e358,"",%progbits
	.ascii	"x\234\215V{PT\347\025\277\347\336]\226}\000\006\025"
	.ascii	"-\323L\301?\230\246c\304\232L\247\235\311L3\266\323"
	.ascii	"$\235i\307\246\323\351\037\371c\007a\223\354\014\202"
	.ascii	"\335]:C\377\351\345%\210H\021y\011&.\201(\004A\342\213"
	.ascii	"\345)*OQ\201H\202\012\001DE\023\004y\277D\266\347\373"
	.ascii	"\276{\367\356\342\322\351\2359{\357w\276\3379\347w\316"
	.ascii	"w\366\334+p\034W\000\034\347\304K\343\317q\300s\234"
	.ascii	"\012u\373P\360\221\253Bqp\354\322\240\334B\351EYF\001"
	.ascii	"\264\323\240\350Q\374\200{\345\"X?\224\006\024t\315"
	.ascii	"\031P:Q\002\021\033\204\367?\222g\224\315\300\342l!"
	.ascii	"<\360\336!\331\363\222\017\360\342\233p\320K<\253\244"
	.ascii	"\030\304\347V`|\265$\006\212\032\245\037\327\335\222"
	.ascii	"\235J\266\225\270\023\336D\267\015\357\333Q~\202\022"
	.ascii	"\274.\336\262\304\323=\217y)\356\372\230$\227\025\216"
	.ascii	"\3451\207r\217c\361\207P\006Q\336A\021P\236\243L\242"
	.ascii	"L\240\250\245\030\204\023\311\265W\312{\3755\315C~\357"
	.ascii	"\335\032\225\300\003y.)x\320\247\333\371\225(\212ib"
	.ascii	"s\017(\240\364\201\362\233\032\3415\012J8]\237\241y"
	.ascii	"\312C\220\216nev\025^\025\350\322I\266\371\354\207s"
	.ascii	"_\002\350\302\322D1Q\234\312\026\205\355\034\354\014"
	.ascii	"\2067\2029\250\2040\204A\031\354\344\340+\010\206\012"
	.ascii	"\010\346J1\330T\375J\003\210\242\012\316\202\016\312"
	.ascii	"A\240\010$N\"0\002\374H\377\227\177\361\356\364\334"
	.ascii	"FN\313\222\272\266\022\247U\350\364\214\342\024c0\257"
	.ascii	"d\003\371\327V\315\335\322#\177\177]\010I\247.\273\243"
	.ascii	"\300\007\227\006\235\212,\2574-\265\351\204\177\321"
	.ascii	"\3043\322F:uB\022xT!\224Ua\270h\271TK\227\244\355\003"
	.ascii	"\010\345\2161\261\304\037\302t,\303\354\266\327\011"
	.ascii	"\231\032$sA!\023*q\241ye%\211\332\016\177\016\2521\213"
	.ascii	"\2571\013\270\214\251\205J\251]D\345%T\242\343\326\325"
	.ascii	"\246d\265\\\214W\214j\275\030I\365\310\016\"\024\034"
	.ascii	"H\341\274B\241\306U\017\007\255G~^\327I\215\220I\263"
	.ascii	"T=Z\036Z\324@\2606,\270@\364\205\006\320r\251\364\004"
	.ascii	"\022\2636\375\303u\002\215\030\221lqP\217\361\232\244"
	.ascii	"xi\342\273D\013u \2705\\\001\352\231#\014\3255\2724"
	.ascii	"k\240\245\337D\226\205\375\217\347\004Zz\236,oO\227"
	.ascii	"\325\373\0129\254\334\017\213\033\323\015\302I\266\230"
	.ascii	"\233\355\353\323!0P'\212kNz\301\277Q\177\265&\271B\240"
	.ascii	"z'\353\305\242\325\266\373\032V)\274\222Du\031V\352"
	.ascii	"\012\222l&\225jC\336\201R\245\256\243\262\305\325\216"
	.ascii	"\347+i;\266b\245\256)\225\012T\332\261\370\274\323\341"
	.ascii	"#\235muY\211\277\010\320\201\340\253\012\270\025\224"
	.ascii	"\243\365\022\273\335Kl\314\240\374l\211\336\220\256"
	.ascii	"\234+\365*\037-\007\235`\220\376\220\003#icj\025\317"
	.ascii	"t\360\021\355\325\364\353K\031\272m\271R\274M<-\277"
	.ascii	"\034\221\203.\330\206\2777@\305<4,\314\024\353\204\323"
	.ascii	"\254\242gR*\362\264!\237\213\315\325S\343)+\007\217"
	.ascii	"%\2119\342\210\323\3713j\0057]iq\344\231u\313-\010A"
	.ascii	"\303\317g\0123})\017\3627c<\206[\322\212\300\235\307"
	.ascii	"\276 7\032\335\224\306m\231\306\361\316\362&\255p\237"
	.ascii	"\321hio\251\011\2404FN\225\264\033\3042\261\331\351"
	.ascii	"\374-\265\201\0367\022=2\211^J\242\245w\240\302\207"
	.ascii	"\366\221\235\272\311\355r|\257\243\215\264\205,\227"
	.ascii	"/:\222x\341\011\013q\371\207F\2330\311\236k\327z\342"
	.ascii	"\205y\366\374\305\203\276#\006\217\322\223\240J\351"
	.ascii	"\373\261\314,<\036\177\343P\3025?\0103\320n)\352<\262"
	.ascii	"\205t\313=D|\2474@?;+\216\333\310'\334\305\036pw\013"
	.ascii	"g\234'&5B\031\233\305\313/\023JTB%[\234\252L\375L\343"
	.ascii	"\301\256\313\203\335\240;\273\314\273\023\237\201\304"
	.ascii	"n\244\362C_\030\302\335\001\205\331\2407f\356\376\340"
	.ascii	"{d\346\356\0222JO\216\353\205+\214\314\330\342T\267"
	.ascii	"Zha\213\322\334\274\263jZk_\262\274\321\324xA\353A\224"
	.ascii	"4\241Bt\324\325\301\316\305\372o\375i\347\214\272:\270"
	.ascii	"\356\354\332\200\337\206\235\363\210v\316C\271s\332"
	.ascii	"{\273\257\012B\017\243q\363\331\251\006\317\002=\362"
	.ascii	"(\320\230{\201N6\027\227\033\300\020\266\021\034\236"
	.ascii	"b\376\212\005\255\343\271}\276\360\004U\217\225:\216"
	.ascii	"\311u\304\370\267\232\246\317\372\012O\030\031gj\355"
	.ascii	"|\2000\315\026\362\2203\320!\247\271`o\352\345a\007"
	.ascii	"^\233w\204\331\221\300\324\363\212\333\333N\210\366"
	.ascii	"k@\317i\004\375O\301f\205\313\003\312\377\027\370\303"
	.ascii	"\331\011\221\372\3137\2419Y\200w\364\360\343z\354\270"
	.ascii	"\0076q\3041\024E\240\304\357\360z\354\317\011\264\032"
	.ascii	"\\\330s\013\024K\272\370\276W,u{\214\034M\226(\276k"
	.ascii	"\343\340\033\334\276C\266\277\225\360X\027\230\301\322"
	.ascii	"=\207\0350\211\362\014e\032e\002v\320:\3218uK4\016\251"
	.ascii	"\345\017\336se\244h\325\253\260\352\210\340\344\177"
	.ascii	"\276k\000?n.\270\242\201\260\315\024\325\340\0030\207"
	.ascii	"~\372\224\263!F\364\362Jx\026I\376?\204\311;e\364\352"
	.ascii	"\264\347H\236sc\314\301\274\253\241g\032\356L\352iC"
	.ascii	"\317+\015\275\364\264V\273\361H^\244\035\275 w\364\217"
	.ascii	"i\227K\264B\256\300\206\330\275\331$2\222\355d$\017"
	.ascii	"\013\330!\011\344e\007\324\012\226\334\246\341\222<"
	.ascii	"\015\227\3514\034\030\314\310\001\017\306U\036/\221"
	.ascii	"\025\027\343\272\205\2162\366\022Yq1\236hm\213s\315"
	.ascii	"\363\027@u\225\366\371I\301\245\\e\312\243k\317\016"
	.ascii	"\007\270\224/\231\362Z{\347w\276\033\347\353\244\371"
	.ascii	"\256\311\3716\225\255\016\373\011\245,\337\302\274\231"
	.ascii	"\3671\335\021\261z\260\362\033\203]\036\375h\002\"\257"
	.ascii	"$\213\317,\331\004~\243\367\317\312\332\351\022\235"
	.ascii	"K\227\310S\345\365\321\347\277q\351\222\230\256&\347"
	.ascii	"\322\376\215\311\246\360\204l2/\221}P;{N%\334`dO\034"
	.ascii	"Kl\325S\266\366\216\363\342\336Dq\325\351\024\210\005"
	.ascii	"\034r\343zH\346\232J\271\246UV7h)\007\207\213\353\313"
	.ascii	"\214\2766\375\206\023\3570\245\220&S\250\250=\264]\270"
	.ascii	"\303\030\244\2678V\003(\203\251\332\356#\330\036\305"
	.ascii	"r{\240\021\244\273\261H\227Y\034\241,\356\327w\3356"
	.ascii	"\010\013\314\313h\373\231|)\217\006%\017\362\226\312"
	.ascii	"p\363\220!{8J=\014/\016_\323\320\327\355n\342#;\305"
	.ascii	"\341\360\247\003\316\207,\237\335)\252c\363NM\226\213"
	.ascii	"\025\343\227\374u\364#H\352F\203{3\036\343\3613\011"
	.ascii	"\347\013d\361\364\003\250\273\274\3424\004fI\177\332"
	.ascii	"\020\240\307\225\311\007\303\177x\002\317\346\003e#"
	.ascii	"\272@\213\202\225E\273\217G\273;=&\377q\236\266;\271"
	.ascii	"\2236(8\376\330\317\003\215^\334\3209\022:\207\242\207"
	.ascii	"&S;T\036hR\\\005\235+\241s):\177!\345\205\347\273/\305"
	.ascii	"\003\235'\241\363(\372\356\371\243\025\332\320S\344"
	.ascii	"K\271y/\036;\375\230ae\316\347C\021p1=\247C\240\200"
	.ascii	"\251\361\326\311\367\023\326\243\012(\252~\342\360\013"
	.ascii	"=E\331\033\361#\023<1'(\246\356\272\230\254c\230\216"
	.ascii	"W1\205|(\247\2113\307\330~m\264\371\274\367\347\277"
	.ascii	"\205\374\216\323\032\215\222\342\355\3608\253%<\302"
	.ascii	"r\340\315\230\330\030\323\233\246\210\375\346psLdt\\"
	.ascii	"\224)\374"
	.ascii	"@D\344\247\346\030S\2701\312\364qD\\\264\315h\213?h"
	.ascii	"\262\356\372\224{\343\177\030Y\343\255\341F\253-\012"
	.ascii	"\335#\322\227\204yk\217\321\246c\021\311\243\332\270"
	.ascii	"766Z\203\253_\376\312hC*\322\223!\372\255O\336\336\263"
	.ascii	"{w\324\207\246\210\250\260]\341VK$R0\307\204GY\314\377"
	.ascii	"4Y\254\341\021\221\221\237\304[b\2152nW$\347\262\371"
	.ascii	" \306l\363\241\273\322\315\272\325j\212\261\306Z\336"
	.ascii	"\303\005\331\374C\\L\344>\233\345\247^\3742 \262U\231"
	.ascii	"\021\370\032[\022\022\222\215\312\202\317z\233\351\300"
	.ascii	"A\223%\302\026g1\0051\310\00716\223\305\022wP\366\255"
	.ascii	"\305D\376jC\204Um\215\214\2106\275\276q\016\030\314"
	.ascii	"_\246\376{\223\315\024i\323\230\367D\222\230\336\214"
	.ascii	"\366\307Y\215\270M\352\211\267\277[\3146\223:\312\024"
	.ascii	"\035\021\3575\233x+RE\254\376\343\010s4\262\375Sl\224"
	.ascii	"\351\277\024m\365\375"
	.text
	.section	.gnu.lto_.symtab.89040a518012e358,"",%progbits
	.ascii	"l3g4200dDetect\000\000\000\000\000\000\000\000\000\000"
	.ascii	"\000\000\371\000\000\000i2cRead\000\000\002\000\000"
	.ascii	"\000\000\000\000\000\000\000\001\001\000\000i2cWrit"
	.ascii	"e\000\000\002\000\000\000\000\000\000\000\000\000\007"
	.ascii	"\001\000\000delay\000\000\002\000\000\000\000\000\000"
	.ascii	"\000\000\000\013\001\000\000failureMode\000\000\002"
	.ascii	"\000\000\000\000\000\000\000\000\000\015\001\000\000"
	.text
	.section	.gnu.lto_.opts,"",%progbits
	.ascii	"'-fno-trapv' '-mthumb' '-mcpu=cortex-m3' '-ggdb3' '"
	.ascii	"-Os' '-flto' '-fuse-linker-plugin' '-ffunction-sect"
	.ascii	"ions' '-fdata-sections'\000"
	.text
	.comm	__gnu_lto_v1,1,1
	.comm	__gnu_lto_slim,1,1
	.ident	"GCC: (GNU Tools for ARM Embedded Processors) 4.9.3 20150529 (release) [ARM/embedded-4_9-branch revision 224288]"