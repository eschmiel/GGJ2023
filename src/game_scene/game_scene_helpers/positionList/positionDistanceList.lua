function createPositionDistanceList(sourcePositionList)
    local positionDistanceList = copyPositionList(sourcePositionList)

    function positionDistanceList:setPositionDistance(setX, setY, setDistance)
        local targetPositionIndex = self:findIndexOfContainedPosition(setX, setY)
        self[targetPositionIndex].distance = setDistance
    end

    function positionDistanceList:getPositionDistance(findX, findY)
        local targetPositionIndex = self:findIndexOfContainedPosition(findX, findY)
        assert(targetPositionIndex, "no position at x="..tostr(findX).." y="..tostr(findY))
        return self[targetPositionIndex].distance
    end

    function positionDistanceList:reset()
        for position in all(self) do
            position.distance = nil
        end
    end

    -- sorts objects from least distance to largest distance
    function positionDistanceList:sort()
        local unsortedPositions = {}
        local sortedPositions = {}

        -- copy all of the current positions in the positionDistanceList
        for index=1, #self do
            unsortedPositions[index] = {
                x = self[index].x,
                y = self[index].y,
                distance = self[index].distance
            }
        end

        -- create a sorted list of positions
        while #unsortedPositions > 0 do
            local shortestDistanceIndex
            for index=1, #unsortedPositions do
                local currentDistance = unsortedPositions[index].distance
                if currentDistance then
                    if shortestDistanceIndex then
                        local shortestDistance = unsortedPositions[shortestDistanceIndex].distance
                        if (currentDistance < shortestDistance ) shortestDistanceIndex = index
                    else
                        shortestDistanceIndex = index
                    end
                end
            end

            if shortestDistanceIndex then
                local shortestDistancePosition = self:copyPosition(unsortedPositions[shortestDistanceIndex])
                add(sortedPositions, shortestDistancePosition)
                deli(unsortedPositions, shortestDistanceIndex)
            else -- The rest of the unsortedPositions have no distance assigned, so just add them to the end of the list.
                for position in all(unsortedPositions) do
                    local positionCopy = self:copyPosition(position)
                    add(sortedPositions, positionCopy)
                end
                unsortedPositions = {}
            end
        end

        -- make positionDistanceList order match the sortedPositions order
        for index=1, #self do
            local currentPosition = self:copyPosition(sortedPositions[index])
            self[index] = currentPosition
        end
    end

    function positionDistanceList:copyPosition(position)
        return {
            x = position.x,
            y = position.y,
            distance = position.distance
         }
    end

    return positionDistanceList
end