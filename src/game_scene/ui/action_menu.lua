pointer = nil

function make_menu()
    --have an array of choices (str)
    choices = {"attack", "magic", "heal", "buff", "debuff", "wait", "cancel"}

    local menuStart = 0
    local menuEndX = 4
    local menuEndY = 7
    local rectEndX = convertPositionToPixelCoordinate(menuEndX)
    local rectEndY = convertPositionToPixelCoordinate(menuEndY)
    --build a box for the menu itself
    rectfill(0, 0, rectEndX, rectEndY, colorEnum.black)
    draw_snake_box(0, 0, menuEndX, menuEndY)

    local i = 1
     menu_length = 1
    --print out the array inside the box
    --print the current choice with a different color (white)
    for c in all(choices) do
        local menu_button_color = colorEnum.grey
        if i == pointer then
            menu_button_color = colorEnum.white
        end
        print(c, (menuStart + 1)*8, (menuStart + i )*8, menu_button_color)

        i += 1
        menu_length += 1
    end
end

function menu_controls(unit)
    --moving up/down will make move what is printed in a different color to indicate choice
    controls = controllerListener()
    if controls[3] then
        if pointer > 1 then
            pointer -= 1
        end
    elseif controls[4] then
        if pointer < menu_length - 1 then
            pointer += 1
        end
    elseif controls[5] then
        --play action
        if choices[pointer] == "cancel" then
            game_scene_state.state = "select"
            unit.positionX = unit.oldPositionX
            unit.positionY = unit.oldPositionY
            selector.selected = nil
        elseif choices[pointer] == "wait" then
            game_scene_state.state = "select"
            unit.active = false
            selector.selected = nil
        elseif choices[pointer] == "attack" then
            game_scene_state.state = "attack"
            pointer = 1
        elseif choices[pointer] == "magic" then
            game_scene_state.state = "magic"
            pointer = 1
        elseif choices[pointer] == "heal" then
            game_scene_state.state = "heal"
            pointer = 1
        end
            
    elseif controls[6] then
        game_scene_state.state = "select"
        unit.positionX = unit.oldPositionX
        unit.positionY = unit.oldPositionY
    end
            
    
    --pointer inc/dec
    -- hitting z will activate function at choice[i] if i = pointer
    -- hitting x will cancel/change the state to select
end


function attack_menu(unit, category)
    local target_units = getTargetUnits(unit, category)
    local selectedTarget = target_units[pointer]

    local controls = controllerListener()

    if (controls[6]) then
        --cancel
        game_scene_state.state = "menu"
        pointer = 1
    end

    if (isEmpty(target_units)) return

    --right and up
    if (controls[2] or controls[3]) then
        pointer += 1
        if pointer > #target_units then
            pointer = 1
        end
    --left and down
    elseif (controls[1] or controls[4]) then
        pointer -= 1
        if pointer < 1 then
            pointer = #target_units
        end
    elseif (controls[5]) then
        --affirm
        if category == "attack" then
            attackTarget(unit, selectedTarget)
        elseif category == "magic" then
            magicAttackTarget(unit, selectedTarget)
        elseif category == "heal" then
            --heal method
            selectedTarget:take_heal((unit.magic + unit.mgbuff)*3/4)
        end

        selector.selected = nil
        unit.active = false
        game_scene_state.state = "select"
    end

    
end

function draw_target_selector(unit, category)
    local targets = getTargetUnits(unit, category)

    if #targets == 0 then
        return
    end

    cursor(0, 0)
    local selected_target_position_x = targets[pointer].positionX
    local selected_target_position_y = targets[pointer].positionY

    local selected_target_pixel_position_x = convertPositionToPixelCoordinate(selected_target_position_x)
    local selected_target_pixel_position_y = convertPositionToPixelCoordinate(selected_target_position_y)

    rect(selected_target_pixel_position_x, selected_target_pixel_position_y, selected_target_pixel_position_x + 8, selected_target_pixel_position_y + 8, colorEnum.red)
end

function getTargetUnits(unit, category)
    local range

    --list of units within range
    local possibleTargetUnitTable

    if category == "attack" then
        range = unit.attack_range
        possibleTargetUnitTable= faction_manager:get_all_units_based_on_faction_type(factionTypesEnum.ENEMY)
    elseif category == "magic" then
        range = unit.magic_range
        possibleTargetUnitTable= faction_manager:get_all_units_based_on_faction_type(factionTypesEnum.ENEMY)
    elseif category == "heal" then
        range = unit.heal_range
        possibleTargetUnitTable= faction_manager:get_all_units_based_on_faction_type(factionTypesEnum.ENEMY, true)
    end

    local target_units = findUnitsInRange(unit:get_coordinate_object(), range, possibleTargetUnitTable)

    return target_units
end

function attackTarget(unit, target)
    --attack method (may need some changes depending on buffs/debuffs)

    if(unit.attack > target.defence) then
        damage = (unit.attack + unit.atkbuff) - target.defence
    else
        damage = 0
    end

    target:take_damage(damage)
end

function magicAttackTarget(unit, target)
    --magic method

    if(unit.magic > target.resistance) then
        damage = (unit.magic + unit.mgbuff) - target.resistance
    else
        damage = 0
    end

    target:take_damage(damage)
end