function _init()
    palt(0)
    _update = update_menu
    _draw = draw_menu

end

function update_menu()
    if(btnp(4)) then
        init_game()
        _update = update_game
        _draw = draw_game
    end
end

function draw_menu()
    cls()
    print("press the z button to start")
end



function update_testing()
    unit1 = make_quetz()
    unit2 = make_xipe()

    take_damage(unit2, 10)

    take_heal(unit2, unit1.magic)
end

function draw_testing()
    cls()
    print(unit1.type)
    print(unit1.hp)
    print(unit1.attack)


    print(unit2.type)
    print(unit2.hp)
    print(unit2.attack)
end