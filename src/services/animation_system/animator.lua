function generate_animator()
    animator = {
        animation_frame = 1,
        frame_count = 1,
        loaded_animation = {},
        total_animation_frames = 0,
        switch_frame_at = 0
    }

    function animator:load_animation(animation_object)
        self.loaded_animation = animation_object
        self:initialize_animation()
    end

    function animator:initialize_animation()
        self:reset_animation()
        self.total_animation_frames = self:calculate_animation_length()
    end

    function animator:run_animation()
        if self.frame_count >= self.switch_frame_at then
            self.animation_frame += 1
            if self.animation_frame > #self.loaded_animation then
                self:reset_animation()
            else
                self.switch_frame_at = self:calculate_next_frame_switch()
            end
        end

        self.frame_count += 1
    end

    function animator:calculate_next_frame_switch()
        local frame_switch_at = 0

        for i=1, self.animation_frame do
            frame_switch_at += self.loaded_animation[self.animation_frame].hold_frames
        end

        return frame_switch_at
    end

    function animator:calculate_animation_length() 
        total_animation_frames = 0
        for animation_frame in all(self.loaded_animation) do 
            total_animation_frames += animation_frame.hold_frames
        end
        return total_animation_frames
    end
    

    function animator:reset_animation()
        self.animation_frame = 1
        self.frame_count = 1
        self.switch_frame_at = self:calculate_next_frame_switch()
    end


    function animator:draw_animation(pixelX, pixelY, w, h)
        w = w or 1
        h = h or 1
        current_frame_sprite = self.loaded_animation[self.animation_frame].animation_frame_sprite
        spr(current_frame_sprite, pixelX, pixelY, w, h)
    end

    return animator
end