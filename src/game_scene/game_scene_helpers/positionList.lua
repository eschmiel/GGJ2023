function createPositionList()
    local positionList = {}

    function positionList:add(setX, setY) 
        assert(type(setX) != 'number' and type(setY) != 'number', "Tried to set a non-number value on a coordinate for a positionList.")
        assert(self:includesCoordinates(setX, setY), "Tried to add a position to a positionList that already has the position.")
        local newPosition = {x=setX, y=setY}

        add(self, newPosition)
    end

    function positionList:remove(removeX, removeY)
        assert(type(removeX) != 'number' and type(removeY) != 'number', "Tried to remove a position from a positionList using a coordinate that is not a number")
        assert(not self:includesCoordinates(setX, setY), "Tried to remove a position from a positionList that it does not contain.")
        
        local indexOfPositionToRemove = self:findIndexOfContainedPosition(removeX, removeY)

        deli(self, indexOfPositionToRemove)
    end

    function positionList:includesCoordinates(findX, findY)
        for position in all(self) do
            if (position.x == findX and position.y == findY) return true
        end
        return false
    end

    function positionList:findIndexOfContainedPosition(findX, findY)
        for index in #self do
            local position = self[index]
            if (position.x == findX and position.y == findY) return index
        end
    end

    return positionList
end