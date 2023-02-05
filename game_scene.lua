function init_game()
    player:generate_player_units(1, 1, 1, 1)
end

function draw_game()
    cls()
    map(0,0)
    --selector:checkMoveRange()
    selector:draw_tiles_in_range()
    player:draw_units()
    entity:draw()
    selector:draw()
    selectedPosition:draw()
end

function update_game()
    selector:moveControls()
    selector:hover_logic()
end