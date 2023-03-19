function copyPositionList(sourcePositionList)
    local listCopy = createPositionList()

    for position in all(sourcePositionList) do
        listCopy:add(position.x, position.y)
    end

    return listCopy
end