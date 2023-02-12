function generate_xipe()
    new_unit = unit_constructor()

    new_unit.type = "xipe"
    new_unit.maxHP = 16
    new_unit.hp = 16
    new_unit.attack = 4
    new_unit.defence = 3
    new_unit.magic = 3
    new_unit.resistance = 3
    new_unit.movement = 3

----------------------
-- build animations --
----------------------

    idle_animation = {
        {animation_frame_sprite = 208, hold_frames = 15},
        {animation_frame_sprite = 209, hold_frames = 15}
    }

    moving_animation = {
        {animation_frame_sprite = 208, hold_frames = 5},
        {animation_frame_sprite = 209, hold_frames = 5},
        {animation_frame_sprite = 210, hold_frames = 5},
    }

    state_animation_table = {
        "idle" = idle_animation,
        "moving" = moving_animation
    }

    new_unit.animation_manager = generate_animation_manager(state_animation_table)

    return new_unit
end