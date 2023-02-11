function init_game()
    enemyData = {}
    music(0)

    player:generate_player_units(1, 1, 1, 1)
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

    elseif state == "attack" or state == "magic" or state == "heal" then
        draw_target_selector(selector.selected, state)
    end
end



function update_game()
      if state == "select" then
        selector:moveControls()
        selector:hover_logic()
    elseif state == "menu" then
        menu_controls(selector.selected)
    else
        attack_menu(selector.selected, state)
    end
    
end