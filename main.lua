function _init()
    palt(0)
end

function _update()
    update_game()
end

function _draw()
    draw_game()
end

function update_menu()
    if(btnp(4)) then
        _update = update_game
    end
end

function draw_menu()
    cls()
    print("press the x button to start")
end