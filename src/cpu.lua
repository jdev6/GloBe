local cpu   = require "lib.classic"()
local bit32 = require "lib.bit-numberlua".bit32

local nintendo_banner = { --Scrolling nintendo text
    0xCE, 0xED, 0x66, 0x66, 0xCC, 0x0D, 0x00, 0x0B, 0x03, 0x73, 0x00, 0x83, 0x00, 0x0C, 0x00, 0x0D,
    0x00, 0x08, 0x11, 0x1F, 0x88, 0x89, 0x00, 0x0E, 0xDC, 0xCC, 0x6E, 0xE6, 0xDD, 0xDD, 0xD9, 0x99,
    0xBB, 0xBB, 0x67, 0x63, 0x6E, 0x0E, 0xEC, 0xCC, 0xDD, 0xDC, 0x99, 0x9F, 0xBB, 0xB9, 0x33, 0x3E
}

local function merge_binary_numbers(a,b)
    local bits = select(2,math.frexp(b))
    local result = a
    result = bit32.bor(bit32.lshift(result, bits), b)
    return result
end

function cpu:new()
    return cpu {
        cycle_wait = 0,
        reg = setmetatable({
            a = 0,
            b = 0,
            d = 0,
            h = 0,
            l = 0,
            e = 0,
            c = 0,
            f = {
                z = false, --zero flag
                n = false, --subtract flag
                h = false, --half carry flag
                c = false  --carry flag
            },
            pc = 0x100, --program counter
        },
        { --Metatable for special registers (combined registers)
            __index = function(self,k)
                if k == "hl" then
                    return merge_binary_numbers(self.h,self.l)
                end
            end
        }
        )
    }
end

function cpu:wait(c) self.cycle_wait = c end

function cpu:cycle(dt)
    if self.cycle_wait < 1 then
        self.opcode = mem[self.reg.pc]
        self.reg.pc = self:executeOP().pc
    else
        self.cycle_wait = self.cycle_wait-1
    end
end

cpu.executeOP = require "src.opcodes"

return cpu
