selector = { }
selector.positionX = 0
selector.positionY = 0

function selector:draw()
    xPixelCoordinateOrigin = convertPositionToPixelCoordinate(self.positionX)
    yPixelCoordinateOrigin = convertPositionToPixelCoordinate(self.positionY)

    xPixelCoordinateEnd = xPixelCoordinateOrigin + 7
    yPixelCoordinateEnd = yPixelCoordinateOrigin + 7
    rect(xPixelCoordinateOrigin, yPixelCoordinateOrigin, xPixelCoordinateEnd, yPixelCoordinateEnd, 4)
end

function selector:moveControls()
    controls = controllerListener()

    if controls[1] then
        self.positionX -= 1
    end
    if controls[2] then
        self.positionX += 1
    end
    if controls[3] then
        self.positionY -= 1
    end
    if controls[4] then
        self.positionY += 1
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

function selector:checkMoveRange() 
    tiles = get_tiles_in_range(self.positionX, self.positionY, 3)

    foreach(tiles, drawSquareOnTile)
end

function drawSquareOnTile(tile)
    xPixelCoordinateOrigin = convertPositionToPixelCoordinate(tile.x)
    yPixelCoordinateOrigin = convertPositionToPixelCoordinate(tile.y)

    xPixelCoordinateEnd = xPixelCoordinateOrigin + 7
    yPixelCoordinateEnd = yPixelCoordinateOrigin + 7

    rectfill(xPixelCoordinateOrigin, yPixelCoordinateOrigin, xPixelCoordinateEnd, yPixelCoordinateEnd, colorEnum.red)
end