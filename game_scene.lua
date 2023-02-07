function init_game()
    enemyData = {}
    music(0)

    player:generate_player_units(1, 1, 1, 1)
    --enemies:generate_enemies()
    state = "select"
end

function draw_game()
    cls()
    map(96,0)
    --selector:checkMoveRange()
    selector:draw_tiles_in_range()
    player:draw_units()
    enemy:draw_units()
    entity:draw()
    selector:draw()
    selectedPosition:draw()

    if state == "menu" then
    --draw the menu itself
        make_menu()
    end
end

pointer = nil

function update_game()
      if state == "select" then
        selector:moveControls()
        selector:hover_logic()
    elseif state == "menu" then
        menu_controls(selector.selected)
        
    end
    
end