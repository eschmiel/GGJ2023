function controllerListener()
    controller = { }

    -- set listener to a neutral state
    for i = 1, 6 do
        controller[i] = false
    end

    -- flag pressed buttons
    for i = 1, 6 do
        if btnp(i-1) then
            controller[i] = true
        end
    end

    return controller
end

function drawGrid()
    for count=0, 16 do
        adjustment = count*8
        beginning = 0 + adjustment
        ending = 7 + adjustment

        --Vertical lines
        line(beginning, 0, beginning, 128, 1)
        line(ending, 0, ending, 128, 3)

        --Horizontal lines
        line(0, beginning, 128, beginning, 1)
        line(0, ending, 128, ending, 3)
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

function convertPositionToPixelCoordinate(position) 
    pixelCoordinate = position * 8

    return pixelCoordinate
end

function convertPositionToTextPixelCoordinate(position) 
    pixelCoordinate = position * 6

    return pixelCoordinate
end

colorEnum = {}
colorEnum.black = 0
colorEnum.navy = 1
colorEnum.magenta = 2
colorEnum.darkGreen = 3
colorEnum.brown = 4
colorEnum.charcoal = 5
colorEnum.grey = 6
colorEnum.white = 7
colorEnum.red = 8
colorEnum.orange = 9
colorEnum.yellow = 10
colorEnum.green = 11
colorEnum.blue = 12
colorEnum.greyPurple = 13
colorEnum.pink = 14
colorEnum.peach = 15

function distance_between_coordinates(coordinate_object_1, coordinate_object_2)
    difference_1 = abs(coordinate_object_1.x - coordinate_object_2.x)
    difference_2 = abs(coordinate_object_1.y - coordinate_object_2.y)

    distance = difference_1 + difference_2

    return distance
end

function convertBooleanToNumber(booleanValue) 
    if (booleanValue) return 1
    return -1
end