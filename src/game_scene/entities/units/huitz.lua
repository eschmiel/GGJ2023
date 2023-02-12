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
    state_animations = {
        idle = generate_animator(),
        moving = generate_animator()
    }

    idle_animation = {
        {animation_frame_sprite = 45, hold_frames = 15},
        {animation_frame_sprite = 46, hold_frames = 5},
        {animation_frame_sprite = 47, hold_frames = 7},
        {animation_frame_sprite = 46, hold_frames = 5},
    }

    moving_animation = {
        {animation_frame_sprite = 13, hold_frames = 5},
        {animation_frame_sprite = 14, hold_frames = 5},
        {animation_frame_sprite = 15, hold_frames = 5},
    }

    state_animations.idle:load_animation(idle_animation)
    state_animations.moving:load_animation(moving_animation)

    new_unit.animation_manager = generate_animation_manager(state_animations)

    return new_unit
end