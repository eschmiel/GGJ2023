function _init()
    palt(0)
end

function _update()
    selector:moveControls()
end

function _draw()
    cls()
    map(0,0)
    --drawGrid()
    entity:draw()
    selector:draw()
    selectedPosition:draw()
    logButtonPress()

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