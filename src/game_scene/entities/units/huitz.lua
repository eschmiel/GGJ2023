function generate_huitz()
    new_unit = unit_constructor()

    new_unit.type = "huitz"
    new_unit.maxHP = 20
    new_unit.hp = 20
    new_unit.attack = 5
    new_unit.defence = 2
    new_unit.magic = 1
    new_unit.resistance = 1
    new_unit.movement = 3
    new_unit.spriteId = 45

----------------------
-- build animations --
----------------------

    idle_animation = {
        {animation_frame_sprite = 45, hold_frames = 15},
        {animation_frame_sprite = 46, hold_frames = 5},
        {animation_frame_sprite = 47, hold_frames = 5}
    }

    moving_animation = {
        {animation_frame_sprite = 13, hold_frames = 5},
        {animation_frame_sprite = 14, hold_frames = 5},
        {animation_frame_sprite = 15, hold_frames = 5},
    }

    state_animation_table = {
        "idle" = idle_animation,
        "moving" = moving_animation
    }

    new_unit.animation_manager = generate_animation_manager(state_animation_table)

    return new_unit
end