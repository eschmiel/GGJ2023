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
end

function draw_testing()
    cls()
    rect(0, 0, 127, 127)
    show_stats(unit1, 0, 0)
end