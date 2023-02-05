function _init()

    palt(colorEnum.black, false)

    _update = update_menu
    _draw = draw_menu

end


count=1
function update_menu()
    if(btnp(4)) then
        count += 1
    end
    if (count==7) then
    init_game()
    _update = update_game
    _draw = draw_game
    end
end


function draw_menu()
    cls()
    if(count==1) then
        print("press the z button to start")
    elseif(count==2) then
        print("04.20.2075",20,20)
        print("technochtitlan, is mesoamerica’s biggest software firm.",20,28)
        print("I wouldn’t typically venture so far out of my normal stomping grounds.",20,36)
        print("however…",20,52)
        print("this is special.",20,68)
        print("the reward, while lucrative, wouldn’t be anything",20,84)
        print("compared to the r.e.p.",20,92)
        print("no one has ever cracked their home node.",20,108)
        print("I’ve go my best sprites loaded, and",20,124)
        print("I’ve thawed the ice.",20,132)
        print("fy is scouring the net to see if there",20,148)
        print("are any deets we can sniff out before",20,156)
        print("load in.",20,164)
    
        if(count==5) then
            print(map(96,0))
        end
        print("page")
    
end



function update_testing()
    unit1 = make_quetz()
    unit2 = make_xipe()
end

function draw_testing()
    cls()

    dialogue("Carter", "")
    rect(0, 0, 127, 127)
    show_stats(unit1, 0, 0)

end