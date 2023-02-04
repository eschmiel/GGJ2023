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

function log_table(table)
    index = 0
    --print("YOOOOOOOOOO", 50,50, colorEnum.green)
    for k, v in pairs(table) do
            print("YOOOOOOOOOO", 50,50, colorEnum.green)
        print(k..": "..v, 42, 20+index, colorEnum.red)

        index += 8
    end
end