function get_tiles_in_range(origin_x, origin_y, range, category)

    checked_tiles = { {x = origin_x, y = origin_y} } 
    tiles_in_range = {}
    distance_checked = 1

    if (category == "movement" or category == "heal") add(tiles_in_range, {x = origin_x, y = origin_y})

    tiles_to_check = get_neighboring_tiles({x = origin_x, y = origin_y})

    while(distance_checked <= range) do

        distance_checked += 1
        new_tiles_to_check = {}

        for tile in all(tiles_to_check) do
            neighboring_tiles_to_check = check_tile(tile, checked_tiles, tiles_in_range, category)
            concatenate_tables_no_dupes(new_tiles_to_check, neighboring_tiles_to_check)
        end

        tiles_to_check = new_tiles_to_check

    end

    return tiles_in_range
end


function check_tile(tile_coordinates, checked_tiles, tiles_in_range, category)

    add(checked_tiles, {x= tile_coordinates.x, y= tile_coordinates.y})
    
    if category == "movement" then
        if is_tile_navigable(tile_coordinates) then
            add(tiles_in_range, {x= tile_coordinates.x, y= tile_coordinates.y})
        else
            return
        end
    elseif category == "attack" or category == "magic" then
        if is_tile_unit(tile_coordinates, "enemy") then
            add(tiles_in_range, {x= tile_coordinates.x, y= tile_coordinates.y})
        end
    elseif category == "heal" then
        if is_tile_unit(tile_coordinates, "player") then
            add(tiles_in_range, {x= tile_coordinates.x, y= tile_coordinates.y})
        end
    end

    tiles_to_check = {}

    neighboring_tiles = get_neighboring_tiles(tile_coordinates)

    

    for tile in all(neighboring_tiles) do
        if not has_tile_been_checked(tile, checked_tiles) then
           add(tiles_to_check, {x= tile.x, y= tile.y})
        end
    end

    return tiles_to_check
end

function is_tile_navigable(tile_coordinates)
    tile_sprite = mget(tile_coordinates.x + 96, tile_coordinates.y)

    if table_has_value(map_reference.wall_sprites, tile_sprite) then
        return false
    end

    return true
end

function is_tile_unit(tile_coordinates, unit_type)
    local unit_collections

    if unit_type == "player" then
        unit_collections = player.units
    elseif unit_type == "enemy" then
        unit_collections = enemy.units
    end

    for unit in all(unit_collections) do
        if same_coordinates(tile_coordinates, unit:get_coordinate_object()) then
            return true
        end
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