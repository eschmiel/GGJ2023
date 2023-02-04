entity = {}
entity.positionX = 0
entity.positionY = 0
entity.sprite = 13

function entity:draw()
    if self.positionX and self.positionY then
        xPixelCoordinate = convertPositionToPixelCoordinate(self.positionX)
        yPixelCoordinate = convertPositionToPixelCoordinate(self.positionY)
        
        spr(self.sprite, xPixelCoordinate, yPixelCoordinate)
    end
end