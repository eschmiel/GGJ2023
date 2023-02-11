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
        if i == pointer then
            print(c, (menuStart + 1)*8, (menuStart + i )*8, colorEnum.white)

        else
            print(c, (menuStart + 1)*8, (menuStart + i )*8, colorEnum.grey)
        end

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