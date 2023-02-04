function _init()
    palt(0)
    _update = update_menu
    _draw = draw_menu
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