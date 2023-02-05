function init_game()
    enemyData = {}
    

    player:generate_player_units(1, 1, 1, 1)
  enemies:generate_enemies()
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

function draw_snake_box(x, y, width, height)

    local w = 1
    local h = 1



    x_pixel = convertPositionToPixelCoordinate(x) 
    y_pixel = convertPositionToPixelCoordinate(y) 

    width_pixel = convertPositionToPixelCoordinate(width)
    height_pixel = convertPositionToPixelCoordinate(height)

    spr(203, x_pixel, y_pixel)

    while w < width do
        w_pixel = convertPositionToPixelCoordinate(w)
        spr(201, x_pixel+w_pixel, y_pixel)
        w += 1
    end

    spr(202, x_pixel+width_pixel, y_pixel)

    while h < height do
        h_pixel = convertPositionToPixelCoordinate(h)
        spr(218, x_pixel+width_pixel, y_pixel+h_pixel)
        h += 1
    end

    while w >= 0 do
        w_pixel = convertPositionToPixelCoordinate(w)
        spr(233, x_pixel+w_pixel, y_pixel+height_pixel)
        w -= 1
    end

    

    while h >= 2 do
        h_pixel = convertPositionToPixelCoordinate(h)
        spr(217, x_pixel, y_pixel+h_pixel)
        h -= 1
    end

    spr(234, x_pixel+width_pixel, y_pixel+height_pixel)
    spr(232, x_pixel, y_pixel + height_pixel)
    spr(216, x_pixel,y_pixel+8)
end

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