function unit_constructor()
    unit = {}
    unit.type = ""
    unit.positionX = 0
    unit.positionY = 0
    unit.maxHP = 20
    unit.minHP = 0
    unit.hp = 20
    unit.attack = 4
    unit.magic = 2
    unit.movement = 3
    unit.sprite = 13
    unit.oldPositionX = 0
    unit.oldPositionY = 0
    unit.active = true
    unit.attack_range = 1
    unit.magic_range = 2
    unit.heal_range = 3
    unit.action_resolver = generateActionResolver(unit)

    function unit:move(coordinate_object, friendly)
        self.action_resolver.beginAction(self.action_resolver, unitActionsEnum.MOVE, {destination_coordinate_object = coordinate_object})
    end

    function unit:get_coordinate_object()
        coordinate_object = {
            x = self.positionX,
            y = self.positionY
        }

        return coordinate_object
    end

    function unit:take_damage(damage)
        self.hp -= damage
    
        if self.hp <= 0 then
            --they dead
        end
    end

    function unit:take_heal(heal)
        self.hp += heal
        self:hp_clamp()
    end

    function unit:hp_clamp()
        if self.hp > self.maxHP then
            self.hp = self.maxHP
        elseif self.hp < self.minHP then
            self.hp = self.minHP
        end
    end

    return unit
end