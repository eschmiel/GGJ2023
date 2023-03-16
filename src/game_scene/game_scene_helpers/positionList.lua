function createPositionList()
    local positionList = {
        xTable = {}
        yTable = {}
    }

    function positionList:getPositionCount()
        if (#self.xTable == #self.yTable) return #self.xTable
        return "xTable and yTable are out of sync"
    end

    function positionList:add(coordinateObject)
        local newX = coordinateObject.x
        local newY = coordinateObject.y
        add(self.xTable, newX)
        add(self.yTable, newY)
    end

    function positionList:remove(coordinateObject)
        local positionIndex = self:find(coordinateObject)

        if positionIndex then
            deli(self.xTable, positionIndex)
            deli(self.yTable, positionIndex)
            return true
        end
        return false -- let the caller know the remove failed.
    end

    function positionList:find(coordinateObject)
        local targetX = coordinateObject.x
        local targetY = coordinateObject.y
        local xTable = self.xTable
        local yTable = self.yTable
        local positionCount = self:getPositionCount()

        for index=1, positionCount do
            if xTable[index] == targetX and yTable[index] == targetY then
                return index
            end
        end
        return false -- let the caller know the find failed
    end

    function positionList:forEach(callback)
        local positionCount = self:getPositionCount()

        for index=1, positionCount do
            local x = self.xTable[index]
            local y = self.yTable[index]
            callback(x, y)
        end
    end

    return positionList
end