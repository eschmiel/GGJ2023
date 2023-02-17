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
