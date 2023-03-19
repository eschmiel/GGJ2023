function setup_turn_manager(faction_manager)
    local turn_manager = {
        current_turn = 1,
        showingTurnStartNotice = true,
        number_of_factions = #faction_manager.factions,

        get_active_faction = function(self) 
            return faction_manager.factions[self.current_turn] 
        end,

        new_turn = function(self)
            self.current_turn += 1
            if self.current_turn > self.number_of_factions then
                self.current_turn = 1
            end
            
            local active_faction = self:get_active_faction()
        
            for unit in all(active_faction.units) do
                unit.active = true
            end
        
            game_scene_state.state = "new turn start"
        end,

        turn_logic = function(self)
           --log_table_count_external(faction_manager.factions[current_turn].units)
            local active_faction = self:get_active_faction()

            for unit in all(active_faction.units) do
                if (unit.active == true) return
            end
            
            self:new_turn()
        end,

        draw_new_turn_start_notice = function(self)
            local active_faction = self:get_active_faction()
            local turn_start_message = "USER PRIVILEGES GRANTED"
            local message_color = colorEnum.green

            if (active_faction.type != factionTypesEnum.PLAYER) then
                turn_start_message = "USER PRIVILEGES REVOKED"
                message_color = colorEnum.red
            end
        
            rectfill(10, 50, 118, 78, colorEnum.black)
            rect(10, 50, 118, 78, message_color)
            print(turn_start_message, 20, 61, message_color)
        end,

        new_turn_start_controller = function(self)
            local active_faction = self:get_active_faction()
            local controller = controllerListener()

            if controller[5] then
                if active_faction.type == factionTypesEnum.PLAYER then
                    selector.selected = nil

                    game_scene_state.state = "select"
                end
                if active_faction.type == factionTypesEnum.ENEMY then
                    game_scene_state.state = "enemy turn"
                end
            end
        end
        
    }

    return turn_manager
end

-- set all faction units to active on new turn
-- turn logic. If all units active status is false, end current turn, start new turn
-- if player's turn, run player controller. Else, disable player controller, run enemy turn
-- On turn start: play turn indicator, begin turn action
-- user privleges: revoked
-- use privledges: restored