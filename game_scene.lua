function draw_game()
    cls()
    map(0,0)
    entity:draw()
    selector:draw()
    selectedPosition:draw()
end

function update_game()
    selector:moveControls()
end