function createTable()
    local table = {}

    function table:includes(value)
        for existingValue in all(self) do
            if (existingValue == value) return true
        end
        return false
    end
end