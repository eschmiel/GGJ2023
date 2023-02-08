function concatenate_tables(table, table_to_add)
    for value in all(table_to_add) do
        add(table, value)
    end
end

function table_has_value(table, check_value) 
    for key, value in pairs(table) do
        if (value == check_value) return true
    end
    return false
end

function table_has_key(table, check_key)
    for key, value in pairs(table) do
        if (key == check_key) return true
    end
    return false
end

function same_coordinates(coordinate_object_1, coordinate_object_2)
    if coordinate_object_1.x == coordinate_object_2.x and coordinate_object_1.y == coordinate_object_2.y then
        return true
    end
    return false
end

function coordinate_table_contains_coordinates(coordinate_table, coordinate_object)
    for table_object in all(coordinate_table) do
        if (same_coordinates(coordinate_object, table_object)) return true
    end
    return false
end

function find_sub_table_with_smallest_value(table, value)
    smallest_value = table[0][value]
    sub_table_with_smallest_value = table[0]

    for sub_table_key, sub_table in pairs(table) do
        if sub_table[value] <= smallest_value then 
            smallest_value = value
            sub_table_with_smallest_value = sub_table
        end
    end

    return sub_table_with_smallest_value
end