log = require("log/log")

function findIndex(arr, str)
    for i, v in ipairs(arr) do
        if v == str then
            return i
        end
    end
    return -1 -- If the string is not found
end

function dump(o)
    if o == nil then
        return "nil"
    elseif type(o) == 'string' then
        return '"' .. o .. '"'
    elseif type(o) == 'table' then
        local s = '{ '
        for k, v in pairs(o) do
            if type(k) ~= 'number' then
                k = dump(k)
            end
            s = s .. k .. ' = ' .. dump(v) .. ','
        end
        return s .. '} '
    else
        return tostring(o)
    end
end
