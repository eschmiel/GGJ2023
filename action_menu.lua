pointer = nil

function make_menu()

    --have an array of choices (str)
    choices = {"attack", "magic", "heal", "wait", "cancel"}

    menuStart = 0
    menuEndX = 4
    menuEndY = 5
    rectEndX = convertPositionToPixelCoordinate(menuEndX)
    rectEndY = convertPositionToPixelCoordinate(menuEndY)
    --build a box for the menu itself
    rectfill(0, 0, rectEndX, rectEndY, colorEnum.black)
    draw_snake_box(0, 0, menuEndX, menuEndY)

    i = 1
    menu_length = 1
    --print out the array inside the box
    for c in all(choices) do
        menu_button_color = colorEnum.grey
        if i == pointer then
            menu_button_color = colorEnum.white
        end
        print(c, (menuStart + 1)*8, (menuStart + i )*8, menu_button_color)

        i += 1
        menu_length += 1
    end
    --print the current choice with a different color (red)

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
            state = "select"
            unit.positionX = unit.oldPositionX
            unit.positionY = unit.oldPositionY
        elseif choices[pointer] == "wait" then
            state = "select"
            unit.active = false
            selector.selected = nil
        elseif choices[pointer] == "attack" then
            state = "attack"
            pointer = 1
        elseif choices[pointer] == "magic" then
            state = "magic"
            pointer = 1
        elseif choices[pointer] == "heal" then
            state = "heal"
            pointer = 1
        end
            
    elseif controls[6] then
        state = "select"
        unit.positionX = unit.oldPositionX
        unit.positionY = unit.oldPositionY
    end
            
    
    --pointer inc/dec
    -- hitting z will activate function at choice[i] if i = pointer
    -- hitting x will cancel/change the state to select
end


function attack_menu(unit, category)
    local range

    if category == "attack" then
        range = unit.attack_range
    elseif category == "magic" then
        range = unit.magic_range
    elseif category == "heal" then
        range = unit.heal_range
    end

    targets = get_tiles_in_range(unit.positionX, unit.positionY, range, category)
    controls = controllerListener()

    if (controls[1] or controls[3]) then
        pointer += 1
        if pointer > #targets then
            pointer = 1
        end
    elseif (controls[2] or controls[4]) then
        pointer -= 1
        if pointer < 1 then
            pointer = #targets
        end
    elseif (controls[5]) then
        --affirm
    elseif (controls[6]) then
        --cancel
        state = "menu"
        pointer = 1
    end

    
end

function draw_target_selector(unit, category)
    local range

    if category == "attack" then
        range = unit.attack_range
    elseif category == "magic" then
        range = unit.magic_range
    elseif category == "heal" then
        range = unit.heal_range
    end

    targets = get_tiles_in_range(unit.positionX, unit.positionY, range, category)

    if #targets == 0 then
        return
    end

    print(targets[0], 0, 120, colorEnum.red)

    cursor(0, 0)
    selected_target_position_x = targets[pointer].x
    selected_target_position_y = targets[pointer].y

    selected_target_pixel_position_x = convertPositionToPixelCoordinate(selected_target_position_x)
    selected_target_pixel_position_y = convertPositionToPixelCoordinate(selected_target_position_y)

    rect(selected_target_pixel_position_x, selected_target_pixel_position_y, selected_target_pixel_position_x + 8, selected_target_pixel_position_y + 8, colorEnum.red)
end