function _init()
    reset_log()
    palt(colorEnum.black)
    music(1)

    _update = update_menu
    _draw = draw_menu

end

function update_testing()
    unit1 = make_quetz()
    unit2 = make_xipe()
end

function draw_testing()
    cls()

    dialogue("Carter", "")
   -- rect(0, 0, 127, 127)
   show_unit_stats(unit1, 0, 0)

end