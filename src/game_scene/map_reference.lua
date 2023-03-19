function get_wall_sprites()
    wall_sprites = {}
    starting_wall_sprite = 71
        
    for y = 0, 3 do
        for x = 0, 9 do
            add(wall_sprites, starting_wall_sprite + x + (y * 16))
        end
    end
    return wall_sprites
end

map_reference = {}

map_reference.wall_sprites = get_wall_sprites()

navigableTileSpriteIDs = {
    66,
    67,
    68,
    69,
    70,
    71,
    82,
    83,
    84,
    85,
    86,
    118,
    123
}

function createListOfNavigablePositions() 
    local navigablePositions = createPositionList()
    for x=0, 15 do
        for y=0, 15 do 
            local tileSpriteID = mget(x + 96, y)
            if count(navigableTileSpriteIDs, tileSpriteID) > 0 then
                navigablePositions:add(x, y)
            end
        end
    end
    return navigablePositions 
end