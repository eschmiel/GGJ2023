function _init()
    music(0)
    
    local factions_setup_table = {
        { type = factionTypesEnum.PLAYER, unit_generation_table = levels[1].startingPlayerUnitData},
        { type = factionTypesEnum.ENEMY, unit_generation_table = levels[1].startingEnemyUnitData}
    }
    local faction_manager = generate_faction_manager(factions_setup_table)

    game_scene_state = {
        navigablePositionList = createListOfNavigablePositions(),
        faction_manager = faction_manager,
        turn_manager = setup_turn_manager(faction_manager),
        enemy_ai = setup_faction_ai(faction_manager.factions[2]),
        state = "select"
    }
end

function _draw()
    local faction_manager = game_scene_state.faction_manager
    local turn_manager = game_scene_state.turn_manager
    local state = game_scene_state.state

    cls()
    map(96,0)
    selector:draw_tiles_in_range()
    faction_manager:draw_factions()

    selector:draw()

    if state == "menu" then
    --draw the menu itself
        make_menu()
    elseif state == "new turn start" then
        turn_manager:draw_new_turn_start_notice()
    elseif state == "attack" or state == "magic" or state == "heal" then
        draw_target_selector(selector.selected, state)
    end

    check_win(faction_manager)
    
end

function _update()
    local state = game_scene_state.state
    local faction_manager = game_scene_state.faction_manager
    local turn_manager = game_scene_state.turn_manager
    local enemy_ai = game_scene_state.enemy_ai

    if state != "new turn start" then
        turn_manager:turn_logic()
    end

    faction_manager:update_factions()

    if state == "new turn start" then
        turn_manager:new_turn_start_controller()
    elseif state == "select" then
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