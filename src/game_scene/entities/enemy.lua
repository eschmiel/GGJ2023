enemy = {}
enemy.units = {}
--enemyData is a table. Each element is an object that contains an x position, a y position and an enemy type
--{
--positionX,
--positionY,
--type
--}

function enemy:generate_enemies(enemyData)
    for unit in all(enemyData) do
        newEnemy = self:create_enemy_unit(unit)

        if (newEnemy) add(self.units, newEnemy)
    end

    return enemy
end

function enemy:draw_units()
    for unit in all(self.units) do
        xPixelCoordinate = convertPositionToPixelCoordinate(unit.positionX)
        yPixelCoordinate = convertPositionToPixelCoordinate(unit.positionY)

        if (unit.type == "huitz") pal(colorEnum.orange, colorEnum.pink)
        if (unit.type == "quetz") pal(colorEnum.green, colorEnum.pink)
        if (unit.type == "tez") pal(colorEnum.grey, colorEnum.pink)
        spr(unit.spriteId, xPixelCoordinate, yPixelCoordinate)
        pal()
        palt(colorEnum.black, false)
    end
end

function enemy:create_enemy_unit(unit_data)
    enemy_unit = {}

    if unit_data.type == "huitz" then
        enemy_unit = make_huitz(unit_data.positionX, unit_data.positionY) 
     elseif unit_data.type == "xipe" then
         enemy_unit = make_xipe(unit_data.positionX, unit_data.positionY) 
         enemy_unit.spriteId = 192 
     elseif unit_data.type == "tez" then
         enemy_unit = make_tez(unit_data.positionX, unit_data.positionY)  
     elseif unit_data.type == "quetz" then
         enemy_unit = make_quetz(unit_data.positionX, unit_data.positionY)  
     end

    function enemy_unit:take_turn()
        self:move_action()
    end
    
    function enemy_unit:move_action()
        target_tile = self:find_tile_in_range_closest_to_nearest_player_unit()

        self:move(target_tile, false)
    end
    
    -- could probably abstract find_nearest_player_unit and find_tile_in_range_closest_to_nearest_player_unit into the same function, driven by parameters
    function enemy_unit:find_nearest_player_unit()
        enemy_unit_coordinates = self:get_coordinate_object()
        coordinate_of_nearest_player_unit = {}
        distance_from_nearest_player_unit = distance_between_coordinates(enemy_unit_coordinates, player.units[1]:get_coordinate_object())

        for unit in all(player.units) do
            unit_coordinates = unit:get_coordinate_object()
            distance = distance_between_coordinates(enemy_unit_coordinates, unit_coordinates)

            if distance <= distance_from_nearest_player_unit then
                 coordinate_of_nearest_player_unit = unit_coordinates
                 distance_from_nearest_player_unit = distance
            end
        end
    
        return coordinate_of_nearest_player_unit
    end

    function enemy_unit:find_tile_in_range_closest_to_nearest_player_unit()
        tiles_in_range = get_tiles_in_range(self.positionX, self.positionY, self.movement)
        coordinates_of_nearest_player_unit = self:find_nearest_player_unit()
        tile_closest_to_nearest_player_unit = tiles_in_range[1]
        distance_for_tile_closest_to_player_unit = distance_between_coordinates(tile_closest_to_nearest_player_unit, coordinate_of_nearest_player_unit)

        for tile in all(tiles_in_range) do -- the fact that tile is already a coordinate object is what complicates combining the functions
           distance = distance_between_coordinates(coordinate_of_nearest_player_unit, tile)

           if distance < distance_for_tile_closest_to_player_unit then 
                distance_for_tile_closest_to_player_unit = distance
                tile_closest_to_nearest_player_unit = tile
           end
        end

        return tile_closest_to_nearest_player_unit
    end
    
    return enemy_unit
end