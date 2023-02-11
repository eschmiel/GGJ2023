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
    elseif state == "new turn start" then
        turn_manager:draw_new_turn_start_notice()
    end
end

pointer = nil

function update_game()
    if state == "new turn start" then
        turn_manager:new_turn_start_controller()
    else
        turn_manager:turn_logic()
    end

    if state == "select" then
        selector:moveControls()
        selector:hover_logic()
    elseif state == "menu" then
        menu_controls(selector.selected)
    elseif state == "enemy turn" then
        for unit in all(enemy.units) do
            unit:move_action()
        end
    end
    
end