controlLog = {}
log = "button pressed: "
function logButtonPress()
    controls = controllerListener()
    pressed = false

    
    index = 1
    foreach(controls, function(control) if control then updatelog = log..index pressed = true end index += 1 end)
        print(updatelog, 2, 97, 9)
end


function log_table_changes(table)
    index = 0
    for value in all(table) do
       -- print(value, 12, 12+index)
       subindex = 0
        for k, v in pairs(value) do
            
            print(k..": "..v, 12 + subindex, 12+index, colorEnum.red)

            subindex += 30
        end
        --message = 'x: '..tile.x..', y: '..tile.y
      --  print(message, 5, 5 + index)
        index += 20
    end
end