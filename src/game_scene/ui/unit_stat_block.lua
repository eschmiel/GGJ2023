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

    --showing health in 4s
    print(unit.hp.."/"..unit.maxHP, i*8, j*8)

    i = x + 4

    spr(211, i*8 - 2, j*8 - 2)

    j += 1
    i = x + 1

    --showing ATK
    atk = unit.attack
    spr(224, i*8 - 2, j*8 - 1)

    i += 1

    print(unit.attack, i*8, j*8)

    i += 1

    --showing MAG
    mag = unit.magic
    spr(226, i*8 - 2, j*8 - 1)

    i += 1

    print(unit.magic, i*8, j*8)

    j += 1
    i = x + 1

    --showing DEF
    def = unit.defence

    spr(225, i*8 - 2, j*8)

    i += 1

    print(unit.defence, i*8, j*8 + 1)

    i += 1

    --showing MAG
    res = unit.resistance

    spr(227, i*8 - 2, j*8)

    i += 1

    print(unit.resistance, i*8, j*8 + 1)
end