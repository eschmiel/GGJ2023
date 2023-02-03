entity = {}
entity.positionX = 0
entity.positionY = 0
entity.sprite = 13

function entity:draw()
    x = self.positionX
    y = self.positionY

    spr(self.sprite, x, y)
end