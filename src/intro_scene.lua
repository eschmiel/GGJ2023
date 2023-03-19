intro_count=1
function update_menu()
    if(btnp(4)) then
        intro_count += 1
    end
    if (intro_count==7) then
    init_game()
    _update = update_game
    _draw = draw_game
    end
end



function draw_menu()
    cls()
    if(intro_count==1) then
        print("press the z button to start")
    elseif(intro_count==2) then
        print("04.20.2075",0,12, colorEnum.blue)
        print("technochtitlan, is mesoamericas",0,28, colorEnum.grey)
        print("biggest software firm.", 0, 36)
        print("I wouldnt typically venture so", 0, 52) 
        print("far out of my normal stomping", 0, 60)
        print("grounds.", 0,68)
        print("however...",0,88)
        print("this is special.",0,108)
       

    elseif(intro_count==3) then
        x = 30
        print("the reward, while lucrative,", 0, x)
        print("wouldnt be anything compared",0,x+8)
        print("to the r.e.p.",0,x+16)
        print("no one has ever cracked their", 0, x+32)
        print("home node.",0,x+40)

    elseif(intro_count==4) then
        line = 8
        x= 30
        print("Ive go my best sprites loaded,",0,x)
        print("and Ive thawed the ice.",0,x + line)
        print("fy is scouring the net to see if",0,x+ line *3)
        print("there are any deets we can",0,x + line * 4)
        print("sniff out before load in.",0,x + line *5)
    elseif(intro_count==5) then
            print(map(64,0))
    elseif(intro_count==6) then
        init_game()
        _update = update_game
        _draw = draw_game
    end
    
end


