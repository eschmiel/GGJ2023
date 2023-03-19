selector = { }
selector.positionX = 0
selector.positionY = 0
selector.tiles_in_range = {}
selector.selected = nil
selector.selectable = false

function selector:draw()
    local selector_color = colorEnum.brown
    if (self.selectable) selector_color = colorEnum.blue
    self:draw_rect({x=self.positionX, y=self.positionY}, selector_color)
    
    if self.selected then
        self:draw_rect({x=self.selected.positionX, y=self.selected.positionY}, colorEnum.yellow)
    end

    if self.hover_target then
        local statbox_x = 0
        local statbox_y = 0

        if self.hover_target.positionX < 6 and self.hover_target.positionY < 6 then
            statbox_x = 10
        end
        show_unit_stats(self.hover_target, statbox_x, statbox_y)
    end
end

function selector:draw_rect(coordinate_object, color)
    local xPixelCoordinateOrigin = convertPositionToPixelCoordinate(coordinate_object.x)
    local yPixelCoordinateOrigin = convertPositionToPixelCoordinate(coordinate_object.y)

    local xPixelCoordinateEnd = xPixelCoordinateOrigin + 7
    local yPixelCoordinateEnd = yPixelCoordinateOrigin + 7
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
        elseif coordinate_table_contains_coordinates(self.tiles_in_range, {x = self.positionX, y = self.positionY}) then
            self.selected:move({x = self.positionX, y = self.positionY}, true)
            self.tiles_in_range = {}
        end

    end
    if controls[6] then
        if self.selected != nil then
            self.selected = nil
            self.tiles_in_range = {}
        else
            local active_faction = game_scene_state.turn_manager:get_active_faction()
            active_faction:disable_all_units()
        end
    end
end

function selector:select()
    for unit in all(game_scene_state.turn_manager:get_active_faction().units) do
        if same_coordinates({x = unit.positionX, y = unit.positionY }, {x = self.positionX, y = self.positionY})
        and unit.active then
            self.selected = unit
            break
        end
    end
end

function selector:hover_logic()
    self.selectable = false
    self.hover_target = nil
    if not self.selected then
        for unit in all(game_scene_state.turn_manager:get_active_faction().units) do
            if self.positionX == unit.positionX and self.positionY == unit.positionY and unit.active then
                self.selectable = true
                self.tiles_in_range = get_tiles_in_range(self.positionX, self.positionY, unit.movement + unit.mvbuff)
                self.hover_target = unit
                break
            end
            self.tiles_in_range = {}
        end
    end
    for unit in all(faction_manager.factions[2].units) do
        if self.positionX == unit.positionX and self.positionY == unit.positionY then
            self.selectable = true
            self.hover_target = unit
            break
        end
    end
end

function selector:draw_tiles_in_range()
    for tile in all(self.tiles_in_range) do
        self:draw_rect(tile, colorEnum.red)
    end
end