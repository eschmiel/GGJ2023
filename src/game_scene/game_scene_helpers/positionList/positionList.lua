function createPositionList()
    local positionList = {}

    function positionList:add(setX, setY) 
        assert(type(setX) == "number" and type(setY) == "number", "Tried to set a non-number value on a coordinate for a positionList: setX="..tostr(setX)..", setY="..tostr(setY))
        assert(not self:includesCoordinates(setX, setY), "Tried to add a position to a positionList that already has the position.")
        local newPosition = {x=setX, y=setY}

        add(self, newPosition)
    end

    function positionList:remove(removeX, removeY)
        assert(type(removeX) == 'number' and type(removeY) == 'number', "Tried to remove a position from a positionList using a coordinate that is not a number: removeX="..tostr(removeX)..", removeY="..tostr(removeY))
        assert(self:includesCoordinates(removeX, removeY), "Tried to remove a position from a positionList that it does not contain.")
        
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
        for index=1, #self do
            local position = self[index]
            if (position.x == findX and position.y == findY) return index
        end
    end

    function positionList:getPositionListOfNeighboringPositions(originX, originY)
        local neighboringPositionList = createPositionList()

        local neighboringPositionIndexes = {}
        add(neighboringPositionIndexes, self:findIndexOfContainedPosition(originX - 1, originY))
        add(neighboringPositionIndexes, self:findIndexOfContainedPosition(originX, originY - 1))
        add(neighboringPositionIndexes, self:findIndexOfContainedPosition(originX + 1, originY))
        add(neighboringPositionIndexes, self:findIndexOfContainedPosition(originX, originY + 1))

        for index in all(neighboringPositionIndexes) do
            if index then
                local position = self[index]
                neighboringPositionList:add(position.x, position.y)
            end
        end

        return neighboringPositionList
    end

    return positionList
end