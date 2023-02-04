function draw_game()
    cls()
    map(2,0)
    --drawGrid()
    selector:checkMoveRange()
    entity:draw()
    selector:draw()
    selectedPosition:draw()
    logButtonPress()
end

function update_game()
    selector:moveControls()
end