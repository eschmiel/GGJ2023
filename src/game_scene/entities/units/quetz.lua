function generate_quetz()
    new_unit = unit_constructor()

    new_unit.type = "quetz"
    new_unit.maxHP = 12
    new_unit.hp = 12
    new_unit.attack = 1
    new_unit.defence = 2
    new_unit.magic = 5
    new_unit.resistance = 3
    new_unit.movement = 5

----------------------
-- build animations --
----------------------

    idle_animation = {
        {animation_frame_sprite = 48, hold_frames = 100}
    }

    moving_animation = {
        {animation_frame_sprite = 41, hold_frames = 5},
        {animation_frame_sprite = 42, hold_frames = 5},
        {animation_frame_sprite = 43, hold_frames = 5},
    }

    state_animation_table = {
        "idle" = idle_animation,
        "moving" = moving_animation
    }

    new_unit.animation_manager = generate_animation_manager(state_animation_table)

    return new_unit
end