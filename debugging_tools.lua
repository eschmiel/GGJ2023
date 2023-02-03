controlLog = {}
log = "button pressed: "
function logButtonPress()
    controls = controllerListener()
    pressed = false

    
    index = 1
    foreach(controls, function(control) if control then updatelog = log..index pressed = true end index += 1 end)


        print(updatelog, 2, 97, 9)
 


end