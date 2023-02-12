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
    state_animations = {
        idle = generate_animator(),
        moving = generate_animator()
    }

    idle_animation = {
        {animation_frame_sprite = 208, hold_frames = 15},
        {animation_frame_sprite = 209, hold_frames = 15}
    }

    moving_animation = {
        {animation_frame_sprite = 208, hold_frames = 5},
        {animation_frame_sprite = 209, hold_frames = 5},
        {animation_frame_sprite = 210, hold_frames = 5},
    }

    state_animations.idle:load_animation(idle_animation)
    state_animations.moving:load_animation(moving_animation)

    new_unit.animation_manager = generate_animation_manager(state_animations)

    return new_unit
end