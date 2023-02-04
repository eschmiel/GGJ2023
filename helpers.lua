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

function get_tiles_in_range(origin_x, origin_y, range)
    checked_tiles = {}
    tiles_in_range = {}
    distance_checked = 0

    tiles_to_check = get_neighboring_tiles({x = origin_x, y = origin_y})

    --log_table_changes(tiles_to_check)
    while(distance_checked <= range) do
        distance_checked += 1
        new_tiles_to_check = {}

        for tile in all(tiles_to_check) do
            neighboring_tiles_to_check = check_tile(tile, checked_tiles, tiles_in_range)
            concatenate_tables(new_tiles_to_check, neighboring_tiles_to_check)
        end

        tiles_to_check = new_tiles_to_check
       -- log_table_changes(new_tiles_to_check)
    end

    return tiles_in_range
end

function concatenate_tables(table, table_to_add)
    for value in all(table_to_add) do
        add(table, value)
    end
end

for new_tiles_to_check_item in all(new_tiles_to_check) do
                if not has_tile_been_checked(new_tiles_to_check_item, tiles_to_check) then
                    add(tiles_to_check, new_tiles_to_check_item)
                end
            end

function check_tile(tile_coordinates, checked_tiles, tiles_in_range)
    add(checked_tiles, {x= tile_coordinates.x, y= tile_coordinates.y})
    
    --log_table_changes(checked_tiles)
    if (not is_tile_navigable(tile_coordinates)) return
print("bingo", 90,80)
    tiles_to_check = {}

    neighboring_tiles = get_neighboring_tiles(tile_coordinates)

    add(tiles_in_range, {x= tile_coordinates.x, y= tile_coordinates.y})

    for tile in all(neighboring_tiles) do
        if not has_tile_been_checked(tile, checked_tiles) then
           add(tiles_to_check, {x= tile.x, y= tile.y})
        end
    end

    return tiles_to_check
end

function is_tile_navigable(tile_coordinates)
    tile_sprite = mget(tile_coordinates.x, tile_coordinates.y)

    if tile_sprite >= 65 and tile_sprite <= 70 then
        return false
    end

    return true
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

function has_tile_been_checked(tile_coordinates, checked_tiles)
    tile_has_been_checked = false

    for checked_tile in all(checked_tiles) do
        if same_coordinates(tile_coordinates, checked_tile) then
            tile_has_been_checked = true
            break
        end
    end

    return tile_has_been_checked
end

function get_neighboring_tiles(tile_coordinates)
    neighboring_tiles = {}
    neighboring_tiles[1] = { x= tile_coordinates.x - 1, y = tile_coordinates.y } -- tile to the left
    neighboring_tiles[2] = { x= tile_coordinates.x, y = tile_coordinates.y - 1 } -- tile above
    neighboring_tiles[3] = { x= tile_coordinates.x + 1, y = tile_coordinates.y } -- tile to the right
    neighboring_tiles[4] = { x= tile_coordinates.x, y = tile_coordinates.y + 1 } -- tile below

    return neighboring_tiles
end
