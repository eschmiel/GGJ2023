function setup_turn_manager(factions)
    local turn_manager = {
        active_faction = 1,
        factions = factions,
        showingTurnStartNotice = true,

        get_active_faction_manager = function(self) 
            return self.factions[self.active_faction] 
        end,

        new_turn = function(self)
            self.active_faction += 1

            if self.active_faction > #self.factions then
                self.active_faction = 1
            end
            
            local active_faction_manager = self:get_active_faction_manager()
        
            for unit in all(active_faction_manager.units) do
                unit.active = true
            end
        
            state = "new turn start"
        end,

        turn_logic = function(self)
            local active_faction_manager = self:get_active_faction_manager()

            for unit in all(active_faction_manager.units) do
                if (unit.active == true) return
            end
            
            self:new_turn()
        end,

        draw_new_turn_start_notice = function(self)
            local active_faction_manager = self:get_active_faction_manager()
            local turn_start_message = "USER PRIVILEGES GRANTED"
            local message_color = colorEnum.green

            if (active_faction_manager.type != "player") then
                turn_start_message = "USER PRIVILEGES REVOKED"
                message_color = colorEnum.red
            end
        
            rectfill(10, 50, 118, 78, colorEnum.black)
            rect(10, 50, 118, 78, message_color)
            print(turn_start_message, 20, 61, message_color)
        end,

        new_turn_start_controller = function(self)
            local active_faction_manager = self:get_active_faction_manager()
            local controller = controllerListener()

            if controller[5] then
                if active_faction_manager.type == "player" then
                    selector.selected = nil

                    state = "select"
                end
                if active_faction_manager.type == "enemy" then
                    state = "enemy turn"
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