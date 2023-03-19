function generate_quetz()
    new_unit = unit_constructor()

    new_unit.type = "quetz"
    new_unit.maxHP = 12
    new_unit.hp = 12
    new_unit.attack = 40
    new_unit.defence = 40
    new_unit.magic = 40
    new_unit.resistance = 4
    new_unit.movement = 5

----------------------
-- build animations --
----------------------
    state_animations = {
        idle = generate_animator(),
        moving = generate_animator()
    }

    idle_animation = {
        {animation_frame_sprite = 48, hold_frames = 100}
    }

    moving_animation = {
        {animation_frame_sprite = 41, hold_frames = 5},
        {animation_frame_sprite = 42, hold_frames = 5},
        {animation_frame_sprite = 43, hold_frames = 5},
    }

    state_animations.idle:load_animation(idle_animation)
    state_animations.moving:load_animation(moving_animation)

    new_unit.animation_manager = generate_animation_manager(state_animations)

    return new_unit
end