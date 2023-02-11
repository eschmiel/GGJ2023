-- A tool for testing animations

-- Create animation object that represents an individual animation
-- Animation Object is a collection of objects consisting of:
-- -- The sprite for each individual animation frame
-- -- How many frames to stay on each individual sprite for
-- Run proper animation based on entity animation state

-- Inputs
-- -- sprite id
-- -- wait frames
-- -- delete frame
-- -- add frame



function _init()
    animation_frame_count = 0
    animation_object = {}
    animation_object[1] = {
        sprite = 123,
        wait_frames = 2
    }
    cursor = {
        frame_highlighted = 1,
        draw_x = 1,
        draw_y = 3
    }

    line_break = 8
    input_spacing = 4

    testAnimator = generate_animator()
    animation_object = {
        {animation_frame_sprite = 9, hold_frames = 5},
        {animation_frame_sprite = 10, hold_frames = 5},
        {animation_frame_sprite = 11, hold_frames = 5}
    }

    testAnimator:load_animation(animation_object) 
    
end

function _update()
    if (btnp(2) and cursor.frame_selected == nil and cursor.frame_highlighted > 1) cursor.frame_highlighted -=1
    if (btnp(3) and cursor.frame_selected == nil and cursor.frame_highlighted < 8 ) cursor.frame_highlighted +=1

    if (btnp(4) and cursor.frame_selected == nil) cursor.frame_selected = cursor.frame_highlighted
    if (btnp(5) and cursor.frame_selected) cursor.frame_selected = nil
    testAnimator:run_animation()
end

function _draw()
    cls()
    draw_animation_frame_menu(1)
    draw_cursor()
    testAnimator:draw_animation(50, 20)
end

function draw_cursor()
    buffer_data = get_animation_frame_menu_buffers(cursor.frame_highlighted)

    if(cursor.frame_selected == nil) then
        rect(buffer_data.left_buffer -3, buffer_data.top_buffer - 3, 127, buffer_data.top_buffer + line_break, colorEnum.yellow)
    end
end

function get_animation_frame_menu_buffers(animation_frame_number)
    left_margin = 3
    top_margin = 32
    
    buffer_data = {
        left_buffer = left_margin,
        top_buffer = top_margin + (line_break * animation_frame_number * 2)
    }

    return buffer_data
end

function draw_animation_frame_menu(animation_frame_number)
    buffer_data = get_animation_frame_menu_buffers(animation_frame_number)

    left_buffer = buffer_data.left_buffer
    top_buffer = buffer_data.top_buffer

    selected_sprite = animation_object[animation_frame_number].sprite
    wait_frames = animation_object[animation_frame_number].wait_frames
    
    frame_count_label = animation_frame_number..". "

    print(frame_count_label, left_buffer, top_buffer, colorEnum.white);
    
    sprite_id_input_label = "sprite"
    left_buffer += convertStringToPixelLength(frame_count_label)

    print(sprite_id_input_label, left_buffer, top_buffer, colorEnum.white);

    left_buffer += convertStringToPixelLength(sprite_id_input_label) + input_spacing

    print(selected_sprite, left_buffer, top_buffer, colorEnum.grey);

    wait_frames_input_label = "wait"
    left_buffer +=  convertStringToPixelLength("123") + input_spacing

    print(wait_frames_input_label, left_buffer, top_buffer, colorEnum.white )

    left_buffer += convertStringToPixelLength(wait_frames_input_label) + input_spacing

    print(wait_frames, left_buffer, top_buffer, colorEnum.grey)

    left_buffer += convertStringToPixelLength("123") + input_spacing
    add_button_label = "add"

    print(add_button_label, left_buffer, top_buffer)

    left_buffer += convertStringToPixelLength(add_button_label) + input_spacing
    delete_button_label = "del"

    print(delete_button_label, left_buffer, top_buffer)

end

function convertStringToPixelLength(string)
    return #string * 4
end



colorEnum = {}
colorEnum.black = 0
colorEnum.navy = 1
colorEnum.magenta = 2
colorEnum.darkGreen = 3
colorEnum.brown = 4
colorEnum.charcoal = 5
colorEnum.grey = 6
colorEnum.white = 7
colorEnum.red = 8
colorEnum.orange = 9
colorEnum.yellow = 10
colorEnum.green = 11
colorEnum.blue = 12
colorEnum.greyPurple = 13
colorEnum.pink = 14
colorEnum.peach = 15