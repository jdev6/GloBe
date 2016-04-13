local classic = {
    _VERSION     = "Classic 0.10.0",
    _DESCRIPTION = "Simple class library for Lua",
    _URL         = "https://github.com/jdev6/classic",
    _LICENSE     = [[
        DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
        Version 2, December 2004

        Copyright (C) 2016 jdev6

        Everyone is permitted to copy and distribute verbatim or modified
        copies of this license document, and changing it is allowed as long
        as the name is changed.

        DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
        TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION

        0. You just DO WHAT THE FUCK YOU WANT TO.
    ]]
} 

local function constructor(self, arg) --Class template constructor
    local o = setmetatable({}, {__index = self})

    if arg then
        for k,v in pairs(arg) do
            o[k] = v
        end
    end

    return o
end

function classic.newClass(self, defaults) --Create new class
    return setmetatable({}, {__call = constructor, __index = defaults})
end

return classic.newClass
