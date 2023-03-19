function check_win(faction_manager)
    local win = nil

    local remaining_player_units = faction_manager:count_remaining_units_of_faction_type(factionTypesEnum.PLAYER)
    local remaining_enemy_units = faction_manager:count_remaining_units_of_faction_type(factionTypesEnum.ENEMY)

    if remaining_player_units <= 0 then
        win = false
        --state = "lose"

        print("LOSE")
    end

    if remaining_enemy_units <= 0 then
        win = true
        --state = "win"
        print("WIN")
    end

    return win
end