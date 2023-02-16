function generate_tez()
    new_unit = unit_constructor()

    new_unit.type = "tez"
    new_unit.maxHP = 16
    new_unit.hp = 16
    new_unit.attack = 2
    new_unit.defence = 2
    new_unit.magic = 5
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
        {animation_frame_sprite = 08, hold_frames = 15},
        {animation_frame_sprite = 24, hold_frames = 15}
    }

    moving_animation = {
        {animation_frame_sprite = 09, hold_frames = 5},
        {animation_frame_sprite = 10, hold_frames = 5},
        {animation_frame_sprite = 11, hold_frames = 5},
    }

    state_animations.idle:load_animation(idle_animation)
    state_animations.moving:load_animation(moving_animation)

    new_unit.animation_manager = generate_animation_manager(state_animations)

    return new_unit
end