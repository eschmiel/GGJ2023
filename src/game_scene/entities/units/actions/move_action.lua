function prepareMoveAction(self, parameters)
    local destination_coordinate_object = parameters.destination_coordinate_object

    self.loadedUnit.animation_manager:set_animation_state(unitAnimationStateEnum.MOVE)

    local  oldPosition = self.loadedUnit:get_coordinate_object()

    local xPositionDifference = abs(destination_coordinate_object.x - oldPosition.x)
    local yPositionDifference = abs(destination_coordinate_object.y - oldPosition.y)

    local speedToCompleteXMovementIn1Second = xPositionDifference / 15
    local speedToCompleteYMovementIn1Second = yPositionDifference / 15

    local xDirection = convertBooleanToNumber(oldPosition.x < destination_coordinate_object.x)
    local yDirection = convertBooleanToNumber(oldPosition.y < destination_coordinate_object.y)

    self.action_state = {
        currentPositionX = oldPosition.x,
        currentPositionY = oldPosition.y,
        xSpeed = speedToCompleteXMovementIn1Second,
        ySpeed = speedToCompleteYMovementIn1Second,
        xDirection = xDirection,
        yDirection = yDirection,
        currentFrame = 1,
        endFrame = 15,
        friendly = parameters.friendly,
        destination_coordinate_object = destination_coordinate_object
    }
end

function resolveMoveAction(self)
    local moveX = self.action_state.xSpeed * self.action_state.xDirection
    local moveY = self.action_state.ySpeed * self.action_state.yDirection

    --log_table_external(self.action_state)
    self.action_state.currentPositionX += moveX
    self.action_state.currentPositionY += moveY

    self.loadedUnit.positionX = self.action_state.currentPositionX
    self.loadedUnit.positionY = self.action_state.currentPositionY

    self.action_state.currentFrame += 1

    if (self.action_state.currentFrame >= self.action_state.endFrame) then
        --self.action_state = {}
        self.loadedUnit.positionX = self.action_state.destination_coordinate_object.x
        self.loadedUnit.positionY = self.action_state.destination_coordinate_object.y
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
end