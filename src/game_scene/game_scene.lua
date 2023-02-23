function init_game()
    music(0)

    player = generate_faction("player")
    enemy = generate_faction("enemy")
    enemy:generate_units(levels[1].startingEnemyUnitData)
    player:generate_units(levels[1].startingPlayerUnitData)
    turn_manager = setup_turn_manager({player, enemy})
    enemy_ai = setup_faction_ai(enemy)
    state = "select"

end

function draw_game()
    cls()
    check_win()
    map(96,0)
    --selector:checkMoveRange()
    selector:draw_tiles_in_range()
    player:draw_unit_animations()
    enemy:draw_unit_animations()
    selector:draw()
    selectedPosition:draw()

    if state == "menu" then
    --draw the menu itself
        make_menu()
    elseif state == "new turn start" then
        turn_manager:draw_new_turn_start_notice()

    elseif state == "attack" or state == "magic" or state == "heal" then
        draw_target_selector(selector.selected, state)
    end
end



function update_game()
    if state == "new turn start" then
        turn_manager:new_turn_start_controller()
    else
        turn_manager:turn_logic()
    end

    player:run_unit_animations()
    enemy:run_unit_animations()

      if state == "select" then
        selector:moveControls()
        selector:hover_logic()
    elseif state == "menu" then
        menu_controls(selector.selected)
    elseif state == "enemy turn" then
        enemy_ai:take_turn()
    elseif state == "attack" or state == "heal" or state == "magic" then
        attack_menu(selector.selected, state)
    end
end

function check_win()
    local win = nil
<<<<<<< HEAD
    if #enemy <= 0 then
        win = true
        state = "win"
    end

    if #player <= 0 then
        win = false
        state = "lose"
    end 

    return win
end

=======

    if #player.units <= 0 then
        win = false
        --state = "lose"

        print("LOSE")
    end

    if #enemy.units <= 0 then
        win = true
        --state = "win"
        print("WIN")
    end

    return win
end
>>>>>>> main
