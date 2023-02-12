-- state_animations is a table that represents connections between states and the animations that play
-- during those states
-- { state_name_string: animation_object}

function generate_animation_manager(state_animation_table)
    animation_manager = {
        animation_state = "",
        state_animations = state_animation_table
    }

    function animation_manager:get_current_animation()
        return self.state_animations[self.animation_state]
    end

    function animation_manager:set_animation_state(new_state)
        self.animation_state = new_state
    end

    function animation_manager:run_animation()
        current_animation = self:get_current_animation()
        current_animation.run_animation()
    end

    function animation_manager:draw_animation()
        current_animation = self:get_current_animation()
        current_animation.draw_animation()
    end

    return animation_manager
end