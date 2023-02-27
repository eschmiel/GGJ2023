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
    unit.atkbuff = 0
    unit.mvbuff = 0
    unit.mgbuff = 0
    unit.hpbuff = 0

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

        self:hp_clamp()
    
        if self:is_dead() then
            if check_win() != nil then
                if check_win() then
                    --print("WIN!!!", 0, 80, colorEnum.red)
                else
                    --print("LOSE!!", 0, 80, colorEnum.red)
                end
            end
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

    --checks if the unit is dead and if so remove from the lists
    function unit:is_dead()

        local dead = false

        if self.hp <= 0 then
            del(enemy.units, self)

            dead = true
        end

        return dead

    end

    function unit:search_for_mod_tile(mapx, mapy)

        c = self:get_coordinate_object()
        sprite_id = mget(c.x + mapx, c.y + mapy)

        

        

        --if sprite id matches magic
        if sprite_id == 70 then
            --buff magic
            self.mgbuff = 3
            self.mvbuff = 0
            self.atkbuff = 0
            self.hpbuff = 0
        elseif sprite_id == 71 then
        --else if phys
            --buff phys
            self.mgbuff = 0
            self.mvbuff = 0
            self.atkbuff = 3
            self.hpbuff = 0
        elseif sprite_id == 85 then
        --else if hp
            --buff hp
            self.mgbuff = 0
            self.mvbuff = 0
            self.atkbuff = 0
            self.hpbuff = 5
        elseif sprite_id == 86 then
        --else if movement
            --buff movement
            self.mgbuff = 0
            self.mvbuff = 1
            self.atkbuff = 0
            self.phbuff = 0

        else 
            self.mgbuff = 0
            self.mvbuff = 0
            self.atkbuff = 0
            self.phbuff = 0
        end

    end

    return unit
end