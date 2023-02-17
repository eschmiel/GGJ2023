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
    rectfill(0, 0, 64, 128, colorEnum.black)
    for value in all(table) do
       subindex = 0
        for k, v in pairs(value) do
            
            print(k..": "..v, 12 + subindex, 12+index, colorEnum.red)

            subindex += 30
        end
        index += 8
    end
end

function log_table(table)
    index = 0
    for k, v in pairs(table) do
        print(k..": "..v, 42, 20+index, colorEnum.red)

        index += 8
    end
end