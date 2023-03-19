function show_unit_stats(unit, x, y)
    convertX = convertPositionToPixelCoordinate(x)
    convertY = convertPositionToPixelCoordinate(y)
    rectfill(convertX, convertY, convertX+40, convertY+40, colorEnum.black)
    draw_snake_box(x, y, 5, 5)

    i = x + 1
    j = y + 1

    --showing the type/name
    print(unit.type, i*8, j*8, colorEnum.white)
    j += 1

    local color
    if unit.hpbuff > 0 then
        color = colorEnum.green
    elseif unit.hpbuff < 0 then
        color = colorEnum.red
    else
        color = colorEnum.white
    end

    print(unit.hp.."/"..(unit.maxHP + unit.hpbuff), i*8, j*8, color)

    i = x + 4

    spr(211, i*8 - 2, j*8 - 2)

    j += 1
    i = x + 1

    --showing ATK
    atk = unit.attack
    spr(224, i*8 - 2, j*8 - 1)

    i += 1

    if unit.atkbuff > 0 then
        color = colorEnum.green
    elseif unit.atkbuff < 0 then
        color = colorEnum.red
    else
        color = colorEnum.white
    end

    print(unit.attack + unit.atkbuff, i*8, j*8, color)

    i += 1

    --showing MAG
    mag = unit.magic
    spr(226, i*8 - 2, j*8 - 1)

    i += 1

    if unit.mgbuff > 0 then
        color = colorEnum.green
    elseif unit.mgbuff < 0 then
        color = colorEnum.red
    else
        color = colorEnum.white
    end

    print(unit.magic + unit.mgbuff, i*8, j*8, color)

    j += 1
    i = x + 1

    --showing DEF
    def = unit.defence
    color = colorEnum.white

    spr(225, i*8 - 2, j*8)

    i += 1

    print(unit.defence, i*8, j*8 + 1, color)

    i += 1

    --showing MAG
    res = unit.resistance

    spr(227, i*8 - 2, j*8)

    i += 1

    print(unit.resistance, i*8, j*8 + 1, color)
end