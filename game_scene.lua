function draw_game()
    cls()
    map(0,0)
    --drawGrid()
    selector:checkMoveRange()
    entity:draw()
    selector:draw()
    selectedPosition:draw()
    logButtonPress()
    --log_table(checkedTileSprites)
end

function update_game()
    selector:moveControls()
end