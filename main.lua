function _init()
    palt(0)
    _update = update_testing
    _draw = draw_testing

end

function update_menu()
    if(btnp(4)) then
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
    draw_snake_box(0, 0, 10, 10)
end