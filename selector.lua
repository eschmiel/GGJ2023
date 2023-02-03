selector = { }
selector.positionX = 0
selector.positionY = 0

function selector:draw()
    x = self.positionX
    y = self.positionY

    rect(x, y, x+7, y+7, 4)
end

function selector:moveControls()
    controls = controllerListener()

    if controls[1] then
        self.positionX -= 8
    end
    if controls[2] then
        self.positionX += 8
    end
    if controls[3] then
        self.positionY -= 8
    end
    if controls[4] then
        self.positionY += 8
    end
    if controls[5] then
        if not (selectedPosition.x and selectedPosition.y) then
            selectedPosition.x = self.positionX
            selectedPosition.y = self.positionY
        elseif (entity.positionX == selectedPosition.x and entity.positionY == selectedPosition.y) then
            entity.positionX = self.positionX
            entity.positionY = self.positionY

            selectedPosition.x = nil
            selectedPosition.y = nil
        end
    end
    if controls[6] then
        selectedPosition.x = nil
        selectedPosition.y = nil
    end
end