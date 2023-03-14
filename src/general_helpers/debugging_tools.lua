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

function log_table_changes_external(table)
    printh("", "bingo2.txt", true)
    for value in all(table) do
        for k, v in pairs(value) do      
            printh(k..": "..v, "bingo2.txt")
        end
    end
end

function log_table(table)
    index = 0
    for k, v in pairs(table) do
        print(k..": "..v, 42, 20+index, colorEnum.red)

        index += 8
    end
end

function log_table_external(table)
    printh("", "bingo.txt", true)
    --printh(#table, "bingo.txt", false)
    for k, v in pairs(table) do
        printh(k..": "..v, "bingo.txt", false)


      --  index += 8
    end
end

function log_table_count_external(table)
    printh("table count", "bingo.txt", true)
    printh(#table, "bingo.txt")
end

function reset_log()
    printh("", "log.txt", true)
end

function log_external(message, value)
    printh(message, "log.txt")
    printh(value, "log.txt")
end