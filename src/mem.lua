local mem = setmetatable({}, {__index=function(self,k)
    printf("mem[0x%0X] doesn't exist, gonna return 0\n %s", k,debug.traceback()); return 0  end
})

function mem:init()
    for i=0,0xFFFF do
        self[i] = 0
    end
end

function mem:loadRom(data)
    for k,v in pairs(data) do
        self[k] = v
    end
end

return mem
