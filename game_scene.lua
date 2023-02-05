function init_game()
    enemyData = {}
    

    player:generate_player_units(1, 1, 1, 1)
   -- enemies:generate_enemies()
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
end

function update_game()
    selector:moveControls()
    selector:hover_logic()
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