function _init()
    palt(0)
end

function _update()
    selector:moveControls()
end

function _draw()
    cls()
    map(0,0)
    --drawGrid()
    entity:draw()
    selector:draw()
    selectedPosition:draw()
    logButtonPress()

end