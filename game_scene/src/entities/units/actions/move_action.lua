function prepareMoveAction(self, parameters)
    local currentPosition = self.loadedUnit:get_coordinate_object()
    local destination_coordinate_object = parameters.destination_coordinate_object
    local results = dijkstra:run(currentPosition.x, currentPosition.y, destination_coordinate_object.x, destination_coordinate_object.y)
    local path = results.path
    local targetPosition = #path - 1  -- The first postion in path is the destination. The last position in path is the starting point

    self.loadedUnit.animation_manager:set_animation_state(unitAnimationStateEnum.MOVE)

    self.action_state = {
        path = path,
        targetPosition = targetPosition,
        currentPosition = currentPosition,
        friendly = parameters.friendly
    }
end

function resolveMoveAction(self)
    local currentPosition = self.action_state.currentPosition
    local targetPosition = self.action_state.targetPosition
    local path = self.action_state.path

    if (not path[targetPosition]) then
        endMoveAction(self)
        return
    end

    prepareMove(self)

    if(not same_coordinates(currentPosition, path[1])) then
        if (same_coordinates(currentPosition, path[targetPosition])) then
            self.action_state.targetPosition -= 1
            prepareMove(self)
        end

        move(self)
        didUnitOvershootPosition(self)
    else
        endMoveAction(self)
    end
end

function prepareMove(self)
    local currentPosition = self.action_state.currentPosition
    local targetPosition = self.action_state.targetPosition
    local path = self.action_state.path
    local targetPositionObject = path[targetPosition]

    local speed = getSpeed()
    local xDirection = convertBooleanToNumber(currentPosition.x < targetPositionObject.x)
    local yDirection = convertBooleanToNumber(currentPosition.y < targetPositionObject.y)

    local xVelocity = xDirection * speed
    local yVelocity = yDirection * speed

    self.action_state.xDirection = xDirection
    self.action_state.yDirection = yDirection
    self.action_state.xVelocity = xVelocity
    self.action_state.yVelocity = yVelocity
end

function getSpeed() 
    local distanceToNextPosition = 1
    local framesToReachNextPosition = 5

    return distanceToNextPosition / framesToReachNextPosition
end

function move(self)
    local xVelocity = self.action_state.xVelocity
    local yVelocity = self.action_state.yVelocity
    local xDirection = self.action_state.xDirection
    local yDirection = self.action_state.yDirection

    local currentPosition = {
        x = self.action_state.currentPosition.x,
        y = self.action_state.currentPosition.y
    }

    local targetPosition = self.action_state.targetPosition
    local targetPositionObject = self.action_state.path[targetPosition]

    currentPosition.x += xVelocity
    currentPosition.y += yVelocity

    self.action_state.currentPosition.x += xVelocity
    self.action_state.currentPosition.y += yVelocity

    self.loadedUnit.positionX = self.action_state.currentPosition.x
    self.loadedUnit.positionY = self.action_state.currentPosition.y
end

function didUnitOvershootPosition(self)
    local currentPosition = {
        x = self.action_state.currentPosition.x,
        y = self.action_state.currentPosition.y
    }
    local targetPosition = self.action_state.targetPosition
    local targetPositionObject = self.action_state.path[targetPosition]

    if(self.action_state.xDirection > 0) then
        if (currentPosition.x > targetPositionObject.x) then
            self.action_state.currentPosition.x = targetPositionObject.x
        end
    elseif (self.action_state.xDirection < 0) then
        if (currentPosition.x < targetPositionObject.x) then
            self.action_state.currentPosition.x = targetPositionObject.x
        end
    end

    if(self.action_state.yDirection > 0) then
        if (currentPosition.y > targetPositionObject.y) then
            self.action_state.currentPosition.y = targetPositionObject.y
        end
    elseif (self.action_state.yDirection < 0) then
        if (currentPosition.y < targetPositionObject.y) then
            self.action_state.currentPosition.y = targetPositionObject.y
        end
    end

    self.loadedUnit.positionX = self.action_state.currentPosition.x
    self.loadedUnit.positionY = self.action_state.currentPosition.y
end

function endMoveAction(self)
    self.resolving = unitActionsEnum.NO_ACTION
    self.loadedUnit.animation_manager:set_animation_state(unitAnimationStateEnum.IDLE)
    if self.action_state.friendly == true then 
        game_scene_state.state = "menu"
        pointer = 1
    else
        self.loadedUnit.active = false
        game_scene_state.state = "enemy turn"
    end
end