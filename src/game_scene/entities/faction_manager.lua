-- faction_setup_table is a table of object used to set up the factions for a level
-- Each object has the following shape:
-- {
--  name: this is the name of the faction
--  unit_generation_table: this is a table of objects used to create the units for a faction
-- }
function generate_faction_manager(faction_setup_table)
    faction_manager = {
        factions = {}
    }

    for faction_setup in all(faction_setup_table) do
        new_faction = generate_faction(faction_setup.type)
        new_faction:generate_units(faction_setup.unit_generation_table)

        add(faction_manager.factions, new_faction)
    end

    function faction_manager:draw_factions()
        for faction in all(self.factions) do
            faction:draw_unit_animations()
        end
    end

    function faction_manager:update_factions()
        for faction in all(self.factions) do
            faction:resolve_unit_actions()
            faction:run_unit_animations()
        end
    end

    function faction_manager:count_remaining_units_of_faction_type(faction_type)
        local unit_count = 0
        for faction in all(self.factions) do
            if faction.type == faction_type then
                unit_count += #faction.units
            end
        end
        return unit_count
    end

    -- If should_exclude_faction_type is true, then this function will return a table of all units that do not have the supplied faction_type
    -- If should_exclude_faction_type is false, then this function will return a table of all units that DO have the supplied faction_type
    function faction_manager:get_all_units_based_on_faction_type(faction_type, should_exclude_faction_type)
        should_exclude_faction_type = should_exclude_faction_type or false
        local units = {}
        
        for faction in all(self.factions) do
            
            local faction_is_type = (faction.type == faction_type)
            if (not faction_is_type) == should_exclude_faction_type then
                concatenate_tables(units, faction.units)
            end
        end
        log_table_count_external(units)
        return units
    end

    function faction_manager:get_units_from_all_factions()
        local units = {}
        for faction in all(self.factions) do
            concatenate_tables(units, faction.units)
        end

        return units
    end

    function faction_manager:get_all_unit_positions()
        local unit_positions = {}
        log_external("beep")
        local all_units = self:get_units_from_all_factions()
        log_external("bingo")
        for unit in all(all_units) do
            log_external("in unit loop")
            add(unit_positions, unit:get_coordinate_object())
        end

        return unit_positions
    end

    function faction_manager:kill_unit(unit)
        for faction in all(self.factions) do
            delete_success = del(faction.units, unit)
            if (delete_success) break
        end
    end

    return faction_manager
end