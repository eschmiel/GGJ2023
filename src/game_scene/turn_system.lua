turn_manager = {
    active_faction = "player",
    faction = player,
    showingTurnStartNotice = true
}

-- set all faction units to active on new turn
-- turn logic. If all units active status is false, end current turn, start new turn
-- if player's turn, run player controller. Else, disable player controller, run enemy turn
-- On turn start: play turn indicator, begin turn action
-- user privleges: revoked
-- use privledges: restored

function turn_manager:new_turn()
    if self.active_faction == "enemy" then 
        self.active_faction = "player"
        self.faction = player
    elseif self.active_faction == "player" then
        self.active_faction = "enemy"
        self.faction = enemy
    end

    for unit in all(self.faction.units) do
        unit.active = true
    end

    state = "new turn start"
end

function turn_manager:turn_logic()
    for unit in all(self.faction.units) do
        if (unit.active == true) return
    end
    
    self:new_turn()
end

function turn_manager:draw_new_turn_start_notice()
    turn_start_message = "USER PRIVILEGES GRANTED"
    message_color = colorEnum.green
    if (self.active_faction == "enemy") then
        turn_start_message = "USER PRIVILEGES REVOKED"
        message_color = colorEnum.red
    end

    rectfill(10, 50, 118, 78, colorEnum.black)
    rect(10, 50, 118, 78, message_color)
    print(turn_start_message, 20, 61, message_color)
end

function turn_manager:new_turn_start_controller()
    controller = controllerListener()

    if controller[5] then
        if self.active_faction == "player" then
            state = "select"
        end
        if self.active_faction == "enemy" then
            state = "enemy turn"
        end
    end
end