function _init()
    testAnimator = generate_animator()

    test_animation_object = {
        {animation_frame_sprite = 9, hold_frames = 5},
        {animation_frame_sprite = 10, hold_frames = 5},
        {animation_frame_sprite = 11, hold_frames = 5}
    }

    testAnimator:load_animation(test_animation_object)

    testAnimator2 = generate_animator()

    test_animation_object2 = {
        {animation_frame_sprite = 41, hold_frames = 5},
        {animation_frame_sprite = 42, hold_frames = 5},
        {animation_frame_sprite = 43, hold_frames = 5}
    }

    testAnimator2:load_animation(test_animation_object2)

    testAnimator3 = generate_animator()

    test_animation_object3 = {
        {animation_frame_sprite = 13, hold_frames = 5},
        {animation_frame_sprite = 14, hold_frames = 5},
        {animation_frame_sprite = 15, hold_frames = 5}
    }

    testAnimator3:load_animation(test_animation_object3)

    testAnimator4 = generate_animator()

    test_animation_object4 = {
        {animation_frame_sprite = 45, hold_frames = 5},
        {animation_frame_sprite = 46, hold_frames = 5},
        {animation_frame_sprite = 47, hold_frames = 5}
    }

    testAnimator4:load_animation(test_animation_object4)

    testAnimator5 = generate_animator()

    test_animation_object5 = {
        {animation_frame_sprite = 192, hold_frames = 5},
        {animation_frame_sprite = 193, hold_frames = 5},
        {animation_frame_sprite = 194, hold_frames = 5}
    }

    testAnimator5:load_animation(test_animation_object5)

    testAnimator6 = generate_animator()

    test_animation_object6 = {
        {animation_frame_sprite = 195, hold_frames = 5},
        {animation_frame_sprite = 196, hold_frames = 5},
        {animation_frame_sprite = 197, hold_frames = 5},
        {animation_frame_sprite = 198, hold_frames = 5},
        {animation_frame_sprite = 199, hold_frames = 5}
    }

    testAnimator6:load_animation(test_animation_object6)

    testAnimator7 = generate_animator()

    test_animation_object7 = {
        {animation_frame_sprite = 204, hold_frames = 5},
        {animation_frame_sprite = 205, hold_frames = 5},
        {animation_frame_sprite = 206, hold_frames = 5},
        {animation_frame_sprite = 207, hold_frames = 5},
        {animation_frame_sprite = 220, hold_frames = 5},
        {animation_frame_sprite = 221, hold_frames = 5},
        {animation_frame_sprite = 222, hold_frames = 5},
        {animation_frame_sprite = 223, hold_frames = 5}
    }

    testAnimator7:load_animation(test_animation_object7)

    testAnimator8 = generate_animator()

    test_animation_object8 = {
        {animation_frame_sprite = 235, hold_frames = 5},
        {animation_frame_sprite = 236, hold_frames = 5},
        {animation_frame_sprite = 237, hold_frames = 5},
        {animation_frame_sprite = 238, hold_frames = 5},
        {animation_frame_sprite = 239, hold_frames = 5}
    }

    testAnimator8:load_animation(test_animation_object8)

    testAnimator9 = generate_animator()

    test_animation_object9 = {
        {animation_frame_sprite = 227, hold_frames = 5},
        {animation_frame_sprite = 228, hold_frames = 5},
        {animation_frame_sprite = 229, hold_frames = 5},
        {animation_frame_sprite = 230, hold_frames = 5},
        {animation_frame_sprite = 231, hold_frames = 5}
    }

    testAnimator9:load_animation(test_animation_object9)

    testAnimator10 = generate_animator()

    test_animation_object10 = {
        {animation_frame_sprite = 240, hold_frames = 5},
        {animation_frame_sprite = 241, hold_frames = 5},
        {animation_frame_sprite = 242, hold_frames = 5},
        {animation_frame_sprite = 243, hold_frames = 5},
        {animation_frame_sprite = 244, hold_frames = 5},
        {animation_frame_sprite = 245, hold_frames = 5}
    }

    testAnimator10:load_animation(test_animation_object10)

    testAnimator11 = generate_animator()

    test_animation_object11 = {
        {animation_frame_sprite = 246, hold_frames = 5},
        {animation_frame_sprite = 247, hold_frames = 5},
        {animation_frame_sprite = 248, hold_frames = 5},
        {animation_frame_sprite = 249, hold_frames = 5},
        {animation_frame_sprite = 250, hold_frames = 5},
        {animation_frame_sprite = 251, hold_frames = 5},
        {animation_frame_sprite = 252, hold_frames = 5},
        {animation_frame_sprite = 253, hold_frames = 5},
        {animation_frame_sprite = 254, hold_frames = 5}
    }

    testAnimator11:load_animation(test_animation_object11)

    testAnimator12 = generate_animator()

    test_animation_object12 = {
        {animation_frame_sprite = 8, hold_frames = 5},
        {animation_frame_sprite = 24, hold_frames = 5}
    }

    testAnimator12:load_animation(test_animation_object12)

    testAnimator13 = generate_animator()

    test_animation_object13 = {
        {animation_frame_sprite = 211, hold_frames = 5},
        {animation_frame_sprite = 212, hold_frames = 5},
        {animation_frame_sprite = 213, hold_frames = 5},
        {animation_frame_sprite = 214, hold_frames = 5},
        {animation_frame_sprite = 215, hold_frames = 5}
    }

    testAnimator13:load_animation(test_animation_object13)

    testAnimator14 = generate_animator()

    test_animation_object14 = {
        {animation_frame_sprite = 203, hold_frames = 40},
        {animation_frame_sprite = 200, hold_frames = 2},
        {animation_frame_sprite = 203, hold_frames = 2},
        {animation_frame_sprite = 200, hold_frames = 2},
    }

    testAnimator14:load_animation(test_animation_object14)
end

function _update()
    testAnimator:run_animation()
    testAnimator2:run_animation()
    testAnimator3:run_animation()
    testAnimator4:run_animation()
    testAnimator5:run_animation()
    testAnimator6:run_animation()
    testAnimator7:run_animation()
    testAnimator8:run_animation()
    testAnimator9:run_animation()
    testAnimator10:run_animation()
    testAnimator11:run_animation()
    testAnimator12:run_animation()
    testAnimator13:run_animation()
    testAnimator14:run_animation()
end

function _draw()
    cls()
    testAnimator:draw_animation(50, 50)
    testAnimator2:draw_animation(66, 50)
    testAnimator3:draw_animation(82, 50)
    testAnimator4:draw_animation(98, 50)
    testAnimator5:draw_animation(114, 50)
    testAnimator6:draw_animation(34, 50)
    testAnimator7:draw_animation(18, 50)
    testAnimator8:draw_animation(2, 50)
    testAnimator9:draw_animation(50, 40)
    testAnimator10:draw_animation(66, 40)
    testAnimator11:draw_animation(98, 40)
    testAnimator12:draw_animation(114, 40)
    testAnimator13:draw_animation(34, 40)
    testAnimator14:draw_animation(18, 30, 1, 2)

end