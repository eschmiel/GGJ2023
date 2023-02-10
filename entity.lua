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

function make_huitz()
    new_unit = {}

    new_unit.type = "HUITZ"
    new_unit.maxHP = 40
    new_unit.hp = 40
    new_unit.attack = 5
    new_unit.magic = 1
    new_unit.movement = 3
    new_unit.spriteId = 45

    return new_unit

end

function make_xipe()
    new_unit = {}

    new_unit.type = "XIPE"
    new_unit.maxHP = 30
    new_unit.hp = 30
    new_unit.attack = 4
    new_unit.magic = 3
    new_unit.movement = 3
    new_unit.spriteId = 192

    return new_unit
end

function make_tez()
    new_unit = {}

    new_unit.type = "TEZ"
    new_unit.maxHP = 25
    new_unit.hp = 25
    new_unit.attack = 2
    new_unit.magic = 5
    new_unit.movement = 3
    new_unit.spriteId = 8

    return new_unit

end

function make_quetz()
    new_unit = {}

    new_unit.type = "QUETZ"
    new_unit.maxHP = 30
    new_unit.hp = 30
    new_unit.attack = 1
    new_unit.magic = 5
    new_unit.movement = 5
    new_unit.spriteId = 41

    return new_unit

end

function take_damage(defender, damage, attacker)
    modifyDamage = damage
    if attacker.isOnPhysicalAttackModifierTile() then
        modifyDamage = physicalAtkTileModifier(damage)
    end
    defender.hp -= damage

    if defender.hp <= 0 then
        --they dead
    end
end

function take_heal(patient, heal)
    modifyHeal = heal
    if patient.isOnHealingTileModifier() then
        modifyHeal = healingTileModifier(heal)
    end
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
