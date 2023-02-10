selectedPosition = {}

selectedPosition.x = nil
selectedPosition.y = nil

function selectedPosition:draw()
    if self.x and self.y then
        xPixelCoordinateOrigin = convertPositionToPixelCoordinate(self.x)
        yPixelCoordinateOrigin = convertPositionToPixelCoordinate(self.y)

        xPixelCoordinateEnd = xPixelCoordinateOrigin + 7
        yPixelCoordinateEnd = yPixelCoordinateOrigin + 7
        
        rect(xPixelCoordinateOrigin, yPixelCoordinateOrigin, xPixelCoordinateEnd, yPixelCoordinateEnd, colorEnum.yellow)
    end
end