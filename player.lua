player = {}

function player:generate_player_units(number_of_huitz, number_of_xipe, number_of_tez, number_of_quetz)
    self.units = {}

    for x=1, number_of_huitz do
        add(self.units, make_huitz())
    end
    for x=1, number_of_xipe do
        add(self.units, make_xipe())
    end
    for x=1, number_of_tez do
        add(self.units, make_tez())
    end
    for x=1, number_of_quetz do
        add(self.units, make_quetz())
    end

    position_set_index = 2
    for unit in all(self.units) do
        unit.positionX = position_set_index
        unit.positionY = 2

        position_set_index += 1
    end
end

function player:draw_units()
    for unit in all(self.units) do
        xPixelCoordinate = convertPositionToPixelCoordinate(unit.positionX)
        yPixelCoordinate = convertPositionToPixelCoordinate(unit.positionY)

        spr(unit.spriteId, xPixelCoordinate, yPixelCoordinate)
    end
end