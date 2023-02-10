function _init()

    palt(colorEnum.black, false)
    music(1)
    _update = update_testing
    _draw = draw_testing

end

function update_testing()
    unit1 = make_quetz()
    unit2 = make_xipe()
end

function draw_testing()
    cls()

    dialogue("Carter", "")
   -- rect(0, 0, 127, 127)
    show_stats(unit1, 0, 0)

end