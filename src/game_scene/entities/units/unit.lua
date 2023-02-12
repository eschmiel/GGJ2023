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

    function unit:move(coordinate_object, friendly)
        self.oldPositionX = self.positionX
        self.oldPositionY = self.positionY 
        
        self.positionX = coordinate_object.x
        self.positionY = coordinate_object.y

        if friendly then
            state = "menu"
            pointer = 1
           -- self:open_action_menu()
        end
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