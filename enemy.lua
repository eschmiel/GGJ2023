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
        newEnemy = nil
        if unit.type == "huitz" then
           newEnemyBase = make_huitz(unit.positionX, unit.positionY) 
            newEnemy = self:create_enemy_unit(newEnemyBase)
        elseif unit.type == "xipe" then
            newEnemyBase = make_xipe(unit.positionX, unit.positionY) 
            newEnemyBase.spriteId = 192 
            newEnemy = self:create_enemy_unit(newEnemyBase)
        elseif unit.type == "tez" then
            newEnemyBase = make_tez(unit.positionX, unit.positionY)  
            newEnemy = self:create_enemy_unit(newEnemyBase)
        elseif unit.type == "quetz" then
            newEnemyBase = make_quetz(unit.positionX, unit.positionY)  
            newEnemy = self:create_enemy_unit(newEnemyBase)
        end
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

function enemy:create_enemy_unit(unit_base)
    enemyUnit = unit_base

    function enemyUnit:take_turn()
        self:move_action()
    end
    
    function enemyUnit:move_action()
        target_tile = self:find_tile_in_range_closest_to_nearest_player_unit()

        self:move(target_tile, false)
    end
    
    -- could probably abstract find_nearest_player_unit and find_tile_in_range_closest_to_nearest_player_unit into the same function, driven by parameters
    function enemyUnit:find_nearest_player_unit()
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

    function enemyUnit:find_tile_in_range_closest_to_nearest_player_unit()
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
    
    return enemyUnit
end