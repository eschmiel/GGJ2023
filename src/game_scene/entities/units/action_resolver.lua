function generateActionResolver(unit)
    actionResolver = {
        loadedUnit = unit,
        resolving = unitActionsEnum.NO_ACTION,

        action_state = {},

        prepareResolver = {},

        resolvers = {},

        resolveAction = function(self)
            self.resolvers[self.resolving](self)
        end,

        beginAction = function(self, action, parameters)
            game_scene_state.state = "resolving action"
            self.resolving = action
            self.prepareResolver[action](self, parameters)
        end
    }

    actionResolver.prepareResolver[unitActionsEnum.MOVE] = prepareMoveAction
    
    actionResolver.resolvers[unitActionsEnum.NO_ACTION] = function() end
    actionResolver.resolvers[unitActionsEnum.MOVE] = resolveMoveAction
    return actionResolver
end