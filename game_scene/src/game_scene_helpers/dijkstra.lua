function createDijkstra()
    local navigablePositionList = game_scene_state.navigablePositionList
    local dijkstra = {
        navigablePositionList = game_scene_state.navigablePositionList,
        positionDistanceList = createPositionDistanceList(navigablePositionList),
        unvisitedPositionList = {}
    }

    function dijkstra:run(startX, startY, endX, endY)
        self.unvisitedPositionList = copyPositionList(self.navigablePositionList)

        local unvisitedPositionList = self.unvisitedPositionList
        local positionDistanceList = self.positionDistanceList
        
        positionDistanceList:reset()
        positionDistanceList:setPositionDistance(startX, startY, 0)
        
        while(unvisitedPositionList:includesCoordinates(endX, endY)) do
            positionDistanceList:sort()

            local unvisitedPositionWithLeastDistance = self:findPositionWithLeastDistance(unvisitedPositionList)
            if (not unvisitedPositionWithLeastDistance) then break end

            self:calculateDistanceOfNeighboringPositions(unvisitedPositionWithLeastDistance.x, unvisitedPositionWithLeastDistance.y)
            unvisitedPositionList:remove(unvisitedPositionWithLeastDistance.x, unvisitedPositionWithLeastDistance.y)
        end

        local path = self:createPath(endX, endY)
        local checkedPositionList = self:createCheckedPositionList()

        return {path = path, checkedPositionList = checkedPositionList}
    end

    function dijkstra:findPositionWithLeastDistance(positionList)
        for position in all(self.positionDistanceList) do
            if (not position.distance) return
            local positionWithLeastDistanceIndex = positionList:findIndexOfContainedPosition(position.x, position.y)
            if (positionWithLeastDistanceIndex) return positionList[positionWithLeastDistanceIndex]
        end
    end

    function dijkstra:calculateDistanceOfNeighboringPositions(originX, originY)
        local neighboringPositionList = self.navigablePositionList:getPositionListOfNeighboringPositions(originX, originY)
        local originDistance = self.positionDistanceList:getPositionDistance(originX, originY)
        local newDistance = originDistance + 1

        for position in all(neighboringPositionList) do
            printh()
            local currentDistance = self.positionDistanceList:getPositionDistance(position.x, position.y)
            if (not currentDistance or newDistance < currentDistance) self.positionDistanceList:setPositionDistance(position.x, position.y, newDistance)
        end
    end

    function dijkstra:createPath(endX, endY)
        local path = createPositionList()
        path:add(endX, endY)

        local currentDistance = self.positionDistanceList:getPositionDistance(endX, endY)

        while(currentDistance > 0) do
            local currentPositionIndex = #path
            local currentPosition = path[currentPositionIndex]

            local neighboringPositionList = navigablePositionList:getPositionListOfNeighboringPositions(currentPosition.x, currentPosition.y)
            local positionWithLeastDistance = self:findPositionWithLeastDistance(neighboringPositionList)

            path:add(positionWithLeastDistance.x, positionWithLeastDistance.y)

            currentDistance = self.positionDistanceList:getPositionDistance(positionWithLeastDistance.x, positionWithLeastDistance.y)
        end
        
        return path
    end

    function dijkstra:createCheckedPositionList()
        local checkedPositionList = createPositionList()
        for position in all(self.navigablePositionList) do
            if not self.unvisitedPositionList:includesCoordinates(position.x, position.y) then
                checkedPositionList:add(position.x, position.y)
            end
        end
        return checkedPositionList
    end

    return dijkstra
end
