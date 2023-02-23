function init_game()
    music(0)

    player = generate_faction("player")
    enemy = generate_faction("enemy")
    enemy:generate_units(levels[1].startingEnemyUnitData)
    player:generate_units(levels[1].startingPlayerUnitData)
    state = "select"

end

function draw_game()
    cls()
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

    elseif state == "attack" or state == "magic" or state == "heal" then
        draw_target_selector(selector.selected, state)
    end
end



function update_game()
   print(#player.units[1])
    player:run_unit_animations()
    enemy:run_unit_animations()

      if state == "select" then
        selector:moveControls()
        selector:hover_logic()
    elseif state == "menu" then
        menu_controls(selector.selected)
    else
        attack_menu(selector.selected, state)
    end
end

function check_win()
    local win = nil
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

