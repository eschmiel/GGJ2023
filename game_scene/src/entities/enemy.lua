function setup_faction_ai(faction_manager_to_run)
    faction_ai = {
        faction_manager = faction_manager_to_run,

        take_turn = function(self)
            if not self:areAnyUnitsResolving() then
                for unit in all(self.faction_manager.units) do
                    if unit.active != false then
                        self:move_towards_nearest_player_unit(unit)
                        break
                    end
                end
            end
        end,
        
        areAnyUnitsResolving = function(self)
            for unit in all(self.faction_manager.units) do
                if unit.action_resolver.resolving != unitActionsEnum.NO_ACTION then
                    return true
                end
            end
            return false
        end,

        move_action = function(self, unit)
            target_tile = self:find_tile_in_range_closest_to_nearest_player_unit(unit)

            unit:move(target_tile, false)
        end,
        
        move_towards_nearest_player_unit = function(self, unit)
            local closestPlayerUnit = self:find_nearest_player_unit2(unit)
            local path = dijkstra:getPath(unit.positionX, unit.positionY, closestPlayerUnit.positionX, closestPlayerUnit.positionY)
            local all_unit_positions = faction_manager:get_all_unit_positions()
            local targetPosition 
            
            if unit.movement < #path then
                targetPosition = #path - unit.movement
            else
                targetPosition = 1
            end

            for position in all(all_unit_positions) do
                local pathStep = path:findIndexOfContainedPosition(position.x, position.y)
                if pathStep then
                    path:remove(position.x, position.y)
                    if pathStep < targetPosition then
                        targetPosition -= 1
                    end
                end
            end
            if (targetPosition > 0 and #path > 0) then
                unit:move(path[targetPosition], false)
            else
                unit.active = false
            end
        end,

        find_nearest_player_unit2 = function(self, unit)
            local player_units = faction_manager:get_all_units_based_on_faction_type(factionTypesEnum.PLAYER)
            local enemy_unit_coordinates = unit:get_coordinate_object()

            local closestPlayerUnit = player_units[1]
            local closestPlayerUnitDistance = dijkstra:getDistanceBetweenPositions(enemy_unit_coordinates.x, enemy_unit_coordinates.y, closestPlayerUnit.positionX, closestPlayerUnit.positionY)
            for player_unit in all(player_units) do
                local player_unit_distance = dijkstra:getDistanceBetweenPositions(enemy_unit_coordinates.x, enemy_unit_coordinates.y, player_unit.positionX, player_unit.positionY)
                if player_unit_distance < closestPlayerUnitDistance then
                    closestPlayerUnit = player_unit
                    closestPlayerUnitDistance = player_unit_distance
                end
            end

            return closestPlayerUnit
        end,

        -- could probably abstract find_nearest_player_unit and find_tile_in_range_closest_to_nearest_player_unit into the same function, driven by parameters
        find_nearest_player_unit = function(self, unit)
            local player_units = faction_manager:get_all_units_based_on_faction_type(factionTypesEnum.PLAYER)
            local enemy_unit_coordinates = unit:get_coordinate_object()
            local coordinates_of_nearest_player_unit = player_units[1]:get_coordinate_object()
            local distance_from_nearest_player_unit = distance_between_coordinates(enemy_unit_coordinates, coordinates_of_nearest_player_unit)
           -- printh(distance_from_nearest_player_unit, "bingo.txt")
            for player_unit in all(player_units) do
                local unit_coordinates = player_unit:get_coordinate_object()
                local distance = distance_between_coordinates(enemy_unit_coordinates, unit_coordinates)

                if distance <= distance_from_nearest_player_unit then
                    coordinates_of_nearest_player_unit = unit_coordinates
                    distance_from_nearest_player_unit = distance
                end
            end
        
            return coordinates_of_nearest_player_unit
        end,

        find_tile_in_range_closest_to_nearest_player_unit = function(self, unit)
            tiles_in_range = get_tiles_in_range(unit.positionX, unit.positionY, unit.movement)
            coordinates_of_nearest_player_unit = self:find_nearest_player_unit(unit)
            
            tile_closest_to_nearest_player_unit = tiles_in_range[1]
            distance_for_tile_closest_to_player_unit = distance_between_coordinates(tile_closest_to_nearest_player_unit, coordinates_of_nearest_player_unit)

            for tile in all(tiles_in_range) do -- the fact that tile is already a coordinate object is what complicates combining the functions
            distance = distance_between_coordinates(coordinates_of_nearest_player_unit, tile)

            if distance < distance_for_tile_closest_to_player_unit then 
                    distance_for_tile_closest_to_player_unit = distance
                    tile_closest_to_nearest_player_unit = tile
            end
            end

            return tile_closest_to_nearest_player_unit
        end
    }

    return faction_ai

end