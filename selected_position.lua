selectedPosition = {}

selectedPosition.x = nil
selectedPosition.y = nil

function selectedPosition:draw()
    if self.x and self.y then
        rect(self.x, self.y, self.x+7, self.y+7, 9)
    end
end