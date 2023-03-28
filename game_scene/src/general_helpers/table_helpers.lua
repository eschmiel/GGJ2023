function concatenate_tables(table, table_to_add)
    for value in all(table_to_add) do
        add(table, value)
    end
end

function concatenate_tables_no_dupes(table, table_to_add)
    for add_value in all(table_to_add) do
    add_value_is_in_table = false
        for current_value in all(table) do 
            if same_coordinates(add_value, current_value) then
                add_value_is_in_table = true
            end
        end
        if not add_value_is_in_table then
            add(table, add_value)
        end
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

function isEmpty(table)
    if (#table > 0) return false
    return true
end