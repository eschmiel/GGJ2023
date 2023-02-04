function get_tiles_in_range(origin_x, origin_y, range)
    checked_tiles = {}
    tiles_in_range = {}
    distance_checked = 1

    tiles_to_check = get_neighboring_tiles({x = origin_x, y = origin_y})

    while(distance_checked <= range) do
        distance_checked += 1
        new_tiles_to_check = {}

        for tile in all(tiles_to_check) do
            neighboring_tiles_to_check = check_tile(tile, checked_tiles, tiles_in_range)
            concatenate_tables(new_tiles_to_check, neighboring_tiles_to_check)
        end

        tiles_to_check = new_tiles_to_check
    end
    return tiles_in_range
end


function check_tile(tile_coordinates, checked_tiles, tiles_in_range)
    add(checked_tiles, {x= tile_coordinates.x, y= tile_coordinates.y})
    
    if not is_tile_navigable(tile_coordinates) then
        add(bingoCheck, "bingo")
         return
    end

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

    if table_has_value(map_reference.wall_sprites, tile_sprite) then
        return false
    end

    return true
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