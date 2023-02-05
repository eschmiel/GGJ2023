selector = { }
selector.positionX = 0
selector.positionY = 0
selector.tiles_in_range = {}
selector.selected = nil
selector.selectable = false

function selector:draw()
    selector_color = colorEnum.brown
    if (self.selectable) selector_color = colorEnum.blue
    self:draw_rect({x=self.positionX, y=self.positionY}, selector_color)
    
    if self.selected then
        self:draw_rect({x=self.selected.positionX, y=self.selected.positionY}, colorEnum.yellow)
    end
end

function selector:draw_rect(coordinate_object, color)
    xPixelCoordinateOrigin = convertPositionToPixelCoordinate(coordinate_object.x)
    yPixelCoordinateOrigin = convertPositionToPixelCoordinate(coordinate_object.y)

    xPixelCoordinateEnd = xPixelCoordinateOrigin + 7
    yPixelCoordinateEnd = yPixelCoordinateOrigin + 7
    rect(xPixelCoordinateOrigin, yPixelCoordinateOrigin, xPixelCoordinateEnd, yPixelCoordinateEnd, color)
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
        if not self.selected then
            self:select()
        elseif coordinate_table_contains_coordinates(tiles_in_range, {x = self.positionX, y = self.positionY}) then
            self.selected:move({x = self.positionX, y = self.positionY})
            self.tiles_in_range = {}
        end

    end
    if controls[6] then
        self.selected = nil
        tiles_in_range = {}
    end
end

function selector:select()
    indexCount = 1
    for unit in all(player.units) do
        if same_coordinates({x = unit.positionX, y = unit.positionY }, {x = self.positionX, y = self.positionY}) then
            print("bingo", 20, 20, colorEnum.yellow)
            self.selected = unit
            self.index = indexCount
            break
        end
        indexCount += 1
    end
end

function selector:hover_logic()
    self.selectable = false
    if not self.selected then
        for unit in all(player.units) do
            if self.positionX == unit.positionX and self.positionY == unit.positionY then
                self.selectable = true
                tiles_in_range = get_tiles_in_range(self.positionX, self.positionY, unit.movement)
                break
            end
            tiles_in_range = {}
        end
    end
end

function selector:draw_tiles_in_range()
    for tile in all(tiles_in_range) do
        self:draw_rect(tile, colorEnum.red)
    end
end