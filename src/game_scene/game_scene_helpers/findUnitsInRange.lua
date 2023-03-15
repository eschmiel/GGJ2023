function findUnitsInRange(origin, range, targetUnitTable)
    local unitsInRange = {}
    for unit in all(targetUnitTable) do
        local unitCoordinates = unit:get_coordinate_object()
        local xDifference = abs(origin.x - unitCoordinates.x)
        local yDifference = abs(origin.y - unitCoordinates.y)
        local distance = xDifference + yDifference

        if (distance <= range) add(unitsInRange, unit)
    end

    return unitsInRange
end