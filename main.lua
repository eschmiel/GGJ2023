function _init()

end

function _update()
    selector:moveControls()
end

function _draw()
    cls()
    drawGrid()
    entity:draw()
    selector:draw()
    selectedPosition:draw()
    logButtonPress()
end

function controllerListener()
    controller = { }

    -- set listener to a neutral state
    for i = 1, 6 do
        controller[i] = false
    end

    -- flag pressed buttons
    for i = 1, 6 do
        if btnp(i-1) then
            controller[i] = true
        end
    end

    return controller
end

function drawGrid()
    for count=0, 16 do
        adjustment = count*8
        beginning = 0 + adjustment
        ending = 7 + adjustment

        --Vertical lines
        line(beginning, 0, beginning, 128, 1)
        line(ending, 0, ending, 128, 3)

        --Horizontal lines
        line(0, beginning, 128, beginning, 1)
        line(0, ending, 128, ending, 3)
    end
end

function drawSelector()

end

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

entity = {}
entity.positionX = 0
entity.positionY = 0
entity.sprite = 1

function entity:draw()
    x = self.positionX
    y = self.positionY

    spr(self.sprite, x, y)
end

selectedPosition = {}
selectedPosition.x = nil
selectedPosition.y = nil
function selectedPosition:draw()
    if self.x and self.y then
        rect(self.x, self.y, self.x+7, self.y+7, 9)
    end
end

controlLog = {}
log = "button pressed: "
function logButtonPress()
    controls = controllerListener()
    pressed = false

    
    index = 1
    foreach(controls, function(control) if control then updatelog = log..index pressed = true end index += 1 end)


        print(updatelog, 2, 97, 9)
 


end
