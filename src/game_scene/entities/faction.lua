function generate_faction(set_type)
    faction = {
        units = {},
        type = set_type
     }

    --unitData is a table. Each element is an object that contains an x position, a y position and an enemy type
    --{
    --positionX,
    --positionY,
    --type
    --}
     function faction:generate_units(unit_data)
        for unit in all(unit_data) do
            new_unit = {}
            if unit.type == "huitz" then
                new_unit = generate_huitz()
            elseif unit.type == "xipe" then
                new_unit = generate_xipe()
            elseif unit.type == "tez" then
                new_unit = generate_tez()
            elseif unit.type == "quetz" then
                new_unit = generate_quetz()
            end
    
            new_unit.positionX = unit.positionX
            new_unit.positionY = unit.positionY

            new_unit.oldPositionX = unit.positionX
            new_unit.oldPositionY = unit.positionY

            add(self.units, new_unit)
        end
    end

    function faction:resolve_unit_actions()
        for unit in all(self.units) do
            unit.action_resolver:resolveAction()
        end
    end

    function faction:run_unit_animations()
        for unit in all(self.units) do
            unit.animation_manager:run_animation()
        end
    end

    function faction:draw_unit_animations()
        for unit in all(self.units) do
            if self.type == factionTypesEnum.ENEMY then
                if (unit.type == "huitz") pal(colorEnum.orange, colorEnum.pink)
                if (unit.type == "quetz" or unit.type == "xipe") pal(colorEnum.green, colorEnum.pink)
                if (unit.type == "tez") pal(colorEnum.grey, colorEnum.pink)
            end

            if not unit.active and self.type == factionTypesEnum.PLAYER then
                if (unit.type != nil) pal(colorEnum.black, colorEnum.greyPurple)
            end

            xPixelCoordinate = convertPositionToPixelCoordinate(unit.positionX)
            yPixelCoordinate = convertPositionToPixelCoordinate(unit.positionY)

            unit.animation_manager:draw_animation(xPixelCoordinate, yPixelCoordinate)
            pal()
            palt(colorEnum.black)
            unit:search_for_mod_tile(96, 0)
        end
    end

    function faction:disable_all_units()
        for unit in all(self.units) do
            unit.active = false
        end
    end

    return faction
end

factionTypesEnum = {
    PLAYER = "player",
    ENEMY = "enemy"
}