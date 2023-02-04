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

function convertPositionToPixelCoordinate(position) 
    pixelCoordinate = position * 8

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

function concatenate_tables(table, table_to_add)
    for value in all(table_to_add) do
        add(table, value)
    end
end

function table_has_value(table, check_value) 
    for key, value in pairs(table) do
        if (value == check_value) return true
    end
    return false
end

function table_has_key(table, check_key)
    for key, value in pairs(table) do
        if (key == check_key) return true
    end
    return false
end

function same_coordinates(coordinate_object_1, coordinate_object_2)
    if coordinate_object_1.x == coordinate_object_2.x and coordinate_object_1.y == coordinate_object_2.y then
        return true
    end
    return false
end