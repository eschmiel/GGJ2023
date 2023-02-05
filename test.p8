pico-8 cartridge // http://www.pico-8.com
version 39
__lua__
#include main.lua
#include debugging_tools.lua
#include entity.lua
#include selector.lua
#include selected_position.lua
#include helpers.lua
#include map_reference.lua
#include movement_system.lua
#include player.lua
#include dialogue.lua
#include enemy.lua
#include level.lua
#include game_scene.lua
__gfx__
00000000dddddddccddddddd00000000000000000000000000000000000000006666077700000707000007070000070700000000000000000400090900400000
00000000dddddcc00ccddddd00000000000000000000000000000000000000006006670700000707000007770000070700000000009009090090099909000909
00700700dddcc000000ccddd00000000000000000000000000000000000000000060707000000777000000700000077700000000040409990400009040000999
00077000dcc0000660000ccd00000000000000000000000000000000000000000067e77070000070070007e7000000700000000040000090404449e944000090
00077000c00000677600000c0000000cc000000000000000000000000000000005557727022227e702222777722227e700000000044449e904444440044449e9
007007001cc0000660000cc100000cc00cc0000000000000000000000000000005c5220002222777022222200222277700000000049494400494944004949440
00000000511cc000000cc116000cc000000cc0000000000000000000000000000022720007222220077227200722277000000000094444400444404004444440
0000000055511cc00cc116660cc0000660000cc000000000000000000000000006600770027020700072720070020207000000000f90f090900f900f09f090f0
000000005655511cc1166656c00000677600000c0000000000000000000000007770666600000000000000000000000000000000000000000000000000000000
000000000c655551166665c01cc0000660000cc10000000000000000000000007076660600000000000000000000000000000000000000000000000000000000
000000005650565566560656511cc000000cc1170000000000000000000000000707060000000000000000000000000000000000000000000000000000000000
0000000055556c0560c5666655511cc00cc11777000000000000000000000000077e660000000000000000000000000000000000000000000000000000000000
0000000056555650065666560555511cc11777700000000000000000000000007555620000000000000000000000000000000000000000000000000000000000
000000000c655555666665c0000555511777700000000000000000000000000005c5620000000000000000000000000000000000000000000000000000000000
00000000565056500656065600000555777000000000000000000000000000000022220000000000000000000000000000000000000000000000000000000000
0000000055556c0560c5666600000005700000000000000000000000000000000770066000000000000000000000000000000000000000000000000000000000
000000000000000cc000000000000000000000000000000007070000000000000000000000033000000330000003300000000000090904500909000009090000
0000000000000cc00cc00000000077777777777777770000070700000000000000000000000b30000003b000900b300900000000099954000999005409990000
00000000000cc000000cc0000000700000000000000700000707000000000000000000000b3553b00b3553b09b3553b900000000909094509090954590909000
000000000cc0000660000cc0000070777777777777070000070700000000000000000000bb5335bbbb5335bbbb5335bb0000000009e9040009e9045009e90050
00000000c00000677600000c000070700000000007070000070700000000000000000000bb3333bbbb3333bbbb3333bb00000000044449000444490004444444
000000001cc0000660000cc100007070000000000707000007070000000000000000000009333390903333090b3333b000000000049404000494f00004949505
00000000511cc000000cc11600007070000000000707000007070000000000000000000000933900900330090003300000000000044400000444000004440000
0000000055511cc00cc11666000070700000000007070000070700000000000000000000000bb000000bb000000bb00000000000090900000909000009090000
990330995655511cc116665600007070000000000707000000007070000000000000000000000000000000000000000000000000000000000000000000000000
9003b0090c655551166665c000007070000000000707000000007070000000000000000000000000000000000000000000000000000000000000000000000000
b035530b565056556656065600007070000000000707000000007070000000000000000000000000000000000000000000000000000000000000000000000000
bb5335bb55556c0560c5666600007070000000000707000000007070000000000000000000000000000000000000000000000000000000000000000000000000
0b3333b0055556500656666000007077777777777707000000007070000000000000000000000000000000000000000000000000000000000000000000000000
00333300000555556666600000007000000000000007000000007070000000000000000000000000000000000000000000000000000000000000000000000000
00033000000005556660000000007777777777777777000000007070000000000000000000000000000000000000000000000000000000000000000000000000
00b00b00000000056000000000000000000000000000000000007070000000000000000000000000000000000000000000000000000000000000000000000000
01677610110010017cccccc77cccccc77cccccc77cccccc7788888877c8cc8c7dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
0167761000100100c1111111111111111111111cc000000c8000900880800808d00000000000000dddddddddddddddddddddddddddd000000000000000000ddd
0167761010010110c1177777777777777777711cc007700c8009000888000088d07777777777770ddd66666666666666666666dddd66677777777777777666dd
0167761011011001c17cc7cccccccccccc7cc71cc07cc70c80099008c00c800cd07777777777770ddd60000000000000000006dddd60667777777777776606dd
0167761000100100c17c7777777777777777c71cc07cc70c809a8908c008c00cd07700000000770ddd60777777777777777706dddd60766000000000066706dd
0167761010010010c1777111111111111117771cc007700c8098890888000088d07706666660770ddd60777777777777777706dddd60776666666666667706dd
0167761001011011c17c7111111111111117c71cc000000c8009900880800808d07706dddd60770ddd60770000000000007706dddd60770dddddddddd07706dd
0167761000100100717c7111111111111117c7177cccccc7788888877c8cc8c7d07706dddd60770ddd60770dddddddddd07706dddd60770dddddddddd07706dd
000000dddd000000717c7111111111111117c71c7bbbbbb755500550ddddddddd07706dddd60770ddd60770d11001001d07706dddd60770dddddddddd07706dd
0000dd6666dd0000c17c7111111111111117c71cb007733b55666605d00000ddd07706dddd60770ddd60770d0a100a00d07706dddd60770dddddddddd07706dd
00dd66000066dd00c1777111111771111117771cb007703b56777065d0777066d07706666660770ddd60770d1001a7a0d07706dddd60776666666666667706dd
dd660007700066ddc17c7777117cc7117777c71cb77bb77b06700760d0777000d07700000000770ddd60770d11011a01d07706dddd60766000000000066706dd
d1dd77000077dd1dc17cc7c7117cc7117c7cc71cb77bb77b06700760d0777777d07777777777770ddd60770d00a001a0d07706dddd60667777777777776606dd
dc61dd7777dd16cdc1177777111771117777711cb307700b56777065d0777777d07777777777770ddd60770d1a7a0010d07706dddd66677777777777777666dd
dc6cc7dddd7cc6cdc1111111111111111111111cb337700b55666605d0000000d00000000000000ddd60770d01a11011d07706ddddd0000000000000000000dd
dc6cc7c77c7cc6cd7cccccc77cccccc77cccccc77bbbbbb755500555dddddddddddddddddddddddddd60770d70100100d07706dddddddddddddddddddddddddd
dc6cc7c77c7cc6cd0167761000011000dc6cc7c77c7cc6cd00000000dddddddddddddddddddddddddd60770dddddddddd07706ddd07706dddd60770dd07706dd
d16cc7c77c7cc61d01677610001cc100d11cc7c77c7cc11d000000000000000dd66666666666666ddd60770000000000007706ddd07706dddd60770dd0770666
dc6117c77c7116cd0167761001c77c10dc6117c77c7116cd000000007777770dd60000000000006ddd60777777777777777706ddd077000dd000770dd0770000
dc6cc717717cc6cd01677610011cc110dc6cc117711cc6cd000000007777770dd66667777776666ddd60777777777777777706ddd077770dd077770dd0777777
d16cc7c77c7cc61dd167761d01611610d11cc7c77c7cc11d000000000007770ddddd67777776dddddd60000000000000000006ddd077770dd077770dd0777777
dc6117c77c7116cddd1771dd01677610dc6117c77c7116cd000000006607770d000d60000006d000dd66666666666666666666ddd077770dd077770dd0770000
dc6cc717717cc6cdddd11ddd01677610dc6cc117711cc6cd00000000dd00000d000d66666666d000ddddddddddddddddddddddddd000000dd000000dd0770666
dc6cc7c77c7cc6cddddddddd01677610dc6cc7c77c7cc6cd00000000dddddddd000dddddddddd000ddddddddddddddddddddddddddddddddddddddddd07706dd
dc6cc7c77c7cc6cddc6cc7c77c7cc6cd0167761000000000a0000000dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd60770d
d16cc7c77c7cc61dd16cc7c77c7cc61d01677610000000000a00a000d0000000d66666666666666d66666666d066660ddd00000dd000000dd000000ddd60770d
dc6117c77c7116cddc6117c77c7116cd0167761000000000090a00a0d0777777d60000000000006d00000000d600006d6607770dd077770dd077770ddd607706
dc6cc717717cc6cdd16cc717717cc61d01677610000000009909900ad0777777d67777777777776d77777777d607706d0007770dd077770dd077770ddd607700
dd6cc7c77c7cc6dddd11c7c77c7c11dd0167761000000000899899a9d0777000d67777777777776d77777777d607706d7777770dd077770dd077770ddd607777
c0ddc7c77c71dd0cdddd11c77c11dddd101771010000000088aa8a99d0777066d60000000000006d00000000d600006d7777770dd000770dd077000ddd607777
c000ddc771dd000cdddddd1111dddddd0101101000000000888a88a8d00000ddd66666666666666d66666666d066660d0000000ddd60770dd07706dddd607700
7cccccddddccccc7dddddddddddddddd101010110000000088888888dddddddddddddddddddddddddddddddddddddddddddddddddd60770dd07706dddd60770d
00000000154455555544555500000000000000aa0000000000000000156655555566554411666655666666441144665566446651000000440000000000000000
00000000155544555555445500000000000077117700000000000000155566555555445511665566666644611166446666664461000044004400000000000000
00000000155555445555554400000000007750110577000000000000155555665544554411116666664466441111664466556644004400000044000000000000
00000066155555554455555500000000775050110505770000000000155555554455555511666666446666611166666644666661440000000000440000000000
00006655155555555544555500000077505050110505057700000000155555445544555511666644664466511166665566446651404400000000004400000000
00665555445555555555445500007750505071111705050577000000165544555555445511664466666644611166556666664461400044000000440400000000
00655555154455555555554400775050507700000077050505770000154455555555554411446666665566441155666666556644400000440044000400000000
006555551555445555555555aa505050770000000000770505057700445566555555555544664466556666614466666655666661440000004400000400000000
006555550000000000000044116650770000007700000077050505aa000000000000000011666644666666611144665566666661404400004400004400000000
00655555000000000000440011556600000077cc7700000077055511440000000000000011665566446666611166446666666661400044004400440400000000
006555550000000000440044115505660077cccccc77000000556061004400000000000011116666664466511111664466666651400000444444000400000000
00655555000000004400000016550505660077cc7700000055606061440044000000000044666666666644614466666644665561440000004400000400000000
00656655000000440044000015660505056600770000005560606051000000440000000011446666665566441144666666446661404400004400004400000000
00660066000044000000440015556605050566000000556060605561000044004400000011664466556666611166446655664461400044004400440400000000
00000000004400000000004415555566050505660055606060556661004400000044000011666644666666611166664466666644400000444444000400000000
0000000044004400000000001655555566050505aa60606055666661440000004400440044665566446666614466556644666661440000004400000400000000
00000044000000440000000015665555556605051160605566666651000000440000004400000000000000001544556655555555404400004400004400000000
00004400000000004400000015556655555566051160556666665561000044000000000044000000000000001555445566555555400044004400440400000000
00440044000000000044000015555566555555111111666666556661004400000000004400440000000000001555554455665555400000444444000400000000
44000000440000000000440015555555665555551166666655666661440000000000440000004400000000001655555544556655440000004400000400000000
00440000004400000000004415555555556655551166665566666651000000000044000000000044000000001566555555445511404400004400004400000000
00004400000044000000000016555555555566551166556666665561000000004400000000004400440000001555665555554455400044004400440400000000
0000004400000044000000001566555555a555111111666666556661000000440000000000440000004400004555556655555544400000444444000400000000
44000000440000004400000015556655555555551166666655666661000044000000000044000000440044001455555566555555400000004400000400000000
00440000004400000044000015555566555555551166665566666661004400000000004400000044000000440000000000000000400000004400004400000000
00004400000044000000440015555555665555551166556666666661440000000000440000004400000044004400000000000000440000004400440400000000
00000044000000440000004415555555556655551111666666666651000000000044000000440000004400000044000000000000404400004444000400000000
44000000440000004400000016555555555566551166666666665561000000004400000044000000440000000000440000000000400044004400000400000000
00440000004400000044000015665555555555111166666666556661000000440000004400000044000000000044004400000000400000444400000400000000
00004400000044000000440015556655555555551166666655666661000044000000440000004400000000004400000044000000400000004400000400000000
00000044000000440000004415a555665555aa551166665566666661004400000044000000440000000000440000000000440000400000004400004400000000
440000004400000000000000165555556655aaa51166556666666661440000004400000044000000000044000000000000004400440000004400440400000000
__map__
4141414141417e42447d4141414141414a4b4b4b4b4b4b4b4b4b4b4b4b4b4b4c4a4b4b4b4b4b4c45454a4b4b4b4b4b4c486b6b6b67454545454545776b6b6b4923242424242424242424242424242425232424242424242424242424242424255b486b6b6b497e42447d486b6b6b494100000000000000000000000000000000
41486b6b6b6b6c52546a6b6b6b6b49005a45454545454545454545454545455c5a76767676486c7b7b6a49454545455c5c5b41454545454545454545455b415a36414141414141414141414141414126364141414141414141414141414141265b5c4545456a6c52546a6c4545455a5b00000000000000000000000000000000
415c4545454545454545454545455a005a4545454545454545454541417d455c5a457676766f424343445a454555455c5c414545454545454545454545455b5a36838485860041414100418d8e41412636838485860041414100418d8e414126486c4546454545454545454547455a4100000000000000000000000000000000
415c4546455545454545564547455a005a4545776b494545486741414a59455c5a454576766f525353545a454545455c6d45454545454545454545454545456e36939495969798000041419d9e41412636939495969798000041419d9e4141265c454545457749454545454545456a4900000000000000000000000000000000
415c4545454545454545454545455a005a454541416e45455c4141416e45455c5a45454576584c7b7b4a59454545455c4545454545454545454545454545454536a3a4a5a6a7a897980041adae41412636a3a4a5a6a7a897980041adae4141265c45564545455a45486b6b6b4945455a00000000000000000000000000000000
41584b4b4b4b4c7b7b4a4b4b4b4b59005a457e41414545455c41414545457b7b7b7b454576766d45456e45454545455c4545454545687a7a7a7a69454545454536b3b4b5b6b7b8a7a89798414163412636b3b4b5b6b7b8a7a8979841414141265c45454545455a455c4545455a45455a00000000000000000000000000000000
0000004141416d7b7b6e4141410000005a45584b7c454545587c454545457b41417b454576764545454545454545455c454545455b5b4d4e4e4f5b5b4545454536a3a4a5a6a76341a7a7a8979874412636a3a4a5a6a74141a7a7a89798414126584b4b4c45455a456d4555457f4b4b5900000000000000000000000000000000
005051004141004545004141005051005a454545454545454545454545457b7b7b7b454576764576764545457645455c454545455b5b5d5e5e5f5b5b4545454536b3b4b5b6414041414141838485862636b3b4b5b641414141414183848586260050515c76765a45454545455a50510000000000000000000000000000000000
006061000041004545004100006061005a45454545454545454545454545455c5a45454545767676767676764545455c7e454545455b5b5b5b5b5b454545457d36a3a4b5b6417441419192939495962636a3a4b5b64141414191929394959626006061584b4b597b7b574b4b5960610000000000000000000000000000000000
006061005051004545005051006061005a45454545454545454545486b6b6b5c5a76454545457676767676454545765c5c4145454545455b5b4545454545415a36a3a4a5a641419192a1a2a3a4a5a62636a3a4a5a641419192a1a2a3a4a5a626006061005051417b7b4150510060610000000000000000000000000000000000
006465006061004545006061006465005a454545454545454545456d4141415c5a76764545454576764545454576765c5c41414545454545454545453241415a36b3b4b5b69192a1a2b1b2a3a4b5b62636b3b4b5b69192a1a2b1b2a3a4b5b6260064650060610045450060610064650000000000000000000000000000000000
636061636061002122006061636061635a45454545454545454545404141415c5a76767676454545454545767676765c5c415b4131454545454545415b5b415a36b3b4898aa1a2b1b2a1a2b3b4a5a62636b3b4898aa1a2b1b2a1a2b3b4a5a6266360616360610021220060616360616300000000000000000000000000000000
746061406061003132006061406061745a45505145454546564545405051415c5a76767676767676767676767676765c5c41415b4131324545313241415b5b5a368788999ab1b2a1a263b2a3a4a5a626368788999ab1b2a1a2b1b2a3a4a5a6267460614060610031320060614060617400000000000000000000000000000000
7b72736272730122210272736272737b6a6b60616b6b494244486b6b60616b6c5a76767676767676767676767676765c5c635b41414141131441415b4141635a36abac8b8ca1a2b1b240a2a3a4a5a62636abac8b8ca1a2b1b2a1a2a3a4a5a6267b72736272730122210272736272737b00000000000000000000000000000000
010201020102111211120102010201020000606100005a52546f0000606100005a76767676767676767676767676765c5c40414163415b21224141634141405a3681829b9cb1b2b1b240b2b3b4b5b6263681829b9cb1b2b1b2b1b2b3b4b5b6260102010201021112111201020102010200000000000000000000000000000000
111211121112111211123132313211120000606100005a53536f0000606100006a6b6b6b6b6b6b6b6b6b6b6b6b6b6b6c58404b4b404b7c3132574b404b4b405933343434343434343434343434343435333434343434343434343434343434353132313231321112111231323132111200000000000000000000000000000000
__sfx__
000100000000006000130000300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000f00000655006550065500655006560065600656006560065500655006550065500457004570045700457006550065500655006550065600656006560065600655006550065500655006570065700657006570
000f0000121501215012150121500d1601517015100214002140000000101500210014470000001010000100101501015010150101500d1601217012100000000000000000101500000012170000000f10010100
000a00180c600096000633021600006002160009330123000c6500962015320153301e300000000633024600080000500009330080000c6500962014320143300000000000000000000018000000000000000000
000a00001e0501e0501e0501e0501e0501e0502a300303002d1102d110301001c0001c0501c0501c0501c0501c0501c05016000217002c1102c11017000170001505015050150501505015050150501910024700
010e001000030000001f4500000000030000000000000000000300000000000000000003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000e00100f1000060000640006200000000000006400062000600000000064000620006000c600006400062000000000000000000000000000000000000000000000000000000000000000000000000000000000
000e000016200152000726007300093000b3000f150063000725001300072500430024350083000a1500b3000930006300072500530029350091000a1500510009300063000c2400130000300013000130000300
0010000007550075500755007550005500055000550165501250018550027000270002700027000355003550035500355000550005500055000550000002455000000000000000000000000000c7000000000000
000800000913008130010000815009150091500000009150041500015000000091500515000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__music__
03 01020304
03 05060708


