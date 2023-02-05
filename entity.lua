entity = {}
entity.positionX = 0
entity.positionY = 0
entity.sprite = 45

function entity:draw()
  if self.positionX and self.positionY then
        xPixelCoordinate = convertPositionToPixelCoordinate(self.positionX)
        yPixelCoordinate = convertPositionToPixelCoordinate(self.positionY)
        
        spr(self.sprite, xPixelCoordinate, yPixelCoordinate)
    end
end

function unit_constructor()

    unit = {}
    unit.type = ""
    unit.positionX = 0
    unit.positionY = 0
    unit.maxHP = 20
    unit.hp = 20
    unit.attack = 4
    unit.magic = 2
    unit.movement = 3
    unit.sprite = 13
    unit.oldPositionX = 0
    unit.oldPositionY = 0
    unit.active = true

    function unit:move(coordinate_object)
        self.oldPositionX = self.positionX
        self.oldPositionY = self.positionY 
        
        self.positionX = coordinate_object.x
        self.positionY = coordinate_object.y

        state = "menu"
        pointer = 1
       -- self:open_action_menu()
    end

    return unit
end



function make_huitz(positionX, positionY)
    new_unit = unit_constructor()

    new_unit.positionX = positionX
    new_unit.positionY = positionY

    new_unit.type = "huitz"
    new_unit.maxHP = 20
    new_unit.hp = 20
    new_unit.attack = 5
    new_unit.defence = 2
    new_unit.magic = 1
    new_unit.resistance = 1
    new_unit.movement = 3
    new_unit.spriteId = 45

    return new_unit

end

function make_xipe(positionX, positionY)
    new_unit = unit_constructor()

    new_unit.positionX = positionX
    new_unit.positionY = positionY

    new_unit.type = "xipe"
    new_unit.maxHP = 16
    new_unit.hp = 16
    new_unit.attack = 4
    new_unit.defence = 3
    new_unit.magic = 3
    new_unit.resistance = 3
    new_unit.movement = 3
    new_unit.spriteId = 208

    return new_unit
end

function make_tez(positionX, positionY)
    new_unit = unit_constructor()

    new_unit.positionX = positionX
    new_unit.positionY = positionY

    new_unit.type = "tez"
    new_unit.maxHP = 16
    new_unit.hp = 16
    new_unit.attack = 2
    new_unit.defence = 2
    new_unit.magic = 5
    new_unit.resistance = 3
    new_unit.movement = 3
    new_unit.spriteId = 8

    return new_unit

end

function make_quetz(positionX, positionY)
    new_unit = unit_constructor()

    new_unit.positionX = positionX
    new_unit.positionY = positionY

    new_unit.type = "quetz"
    new_unit.maxHP = 12
    new_unit.hp = 12
    new_unit.attack = 1
    new_unit.defence = 2
    new_unit.magic = 5
    new_unit.resistance = 3
    new_unit.movement = 5
    new_unit.spriteId = 41

    return new_unit

end

function take_damage(defender, damage)
    defender.hp -= damage

    if defender.hp <= 0 then
        --they dead
    end
end

function take_heal(patient, heal)
    patient.hp += heal
    patient.hp = hp_clamp(patient.hp, 0, patient.maxHP)
end

function hp_clamp(hp, min, max)
	if hp > max then
        hp = max
    elseif hp < min then
        hp = min
    end

    return hp
end

function show_stats(unit, x, y)
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
