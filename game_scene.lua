function draw_game()
    cls()
    map(0,0)
    --drawGrid()
    entity:draw()
    selector:draw()
    selectedPosition:draw()
    logButtonPress()
end

function update_game()
    selector:moveControls()
end