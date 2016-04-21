local band,bor,lshift,rshift
do
    local bit = require "bit"
    band = bit.band
    bor = bit.bor
    lshift = bit.lshift
    rshift = bit.rshift
end

local ops = setmetatable({
    ------
    --LD--
    ------
    [0x06] = function(self)
        --LD B,n
        self.reg.b = mem[self.reg.pc]
        self:wait(8)
        return band(self.reg.pc +1, 0xFFFF)
    end,

    [0x0E] = function(self)
        --LD C,n
        self.reg.c = mem[self.reg.pc]
        self:wait(8)
        return band(self.reg.pc +1, 0xFFFF)
    end,

    [0x16] = function(self)
        --LD D,n
        self.reg.d = mem[self.reg.pc]
        self:wait(8)
        return band(self.reg.pc +1, 0xFFFF)
    end,

    [0x1E] = function(self)
        --LD E,n
        self.reg.e = mem[self.reg.pc]
        self:wait(8)
        return band(self.reg.pc +1, 0xFFFF)
    end,

    [0x26] = function(self)
        --LD H,n
        self.reg.h = mem[self.reg.pc]
        self:wait(8)
        return band(self.reg.pc +1, 0xFFFF)
    end,

    [0x2E] = function(self)
        --LD L,n
        self.reg.l = mem[self.reg.pc]
        self:wait(8)
        return band(self.reg.pc +1, 0xFFFF)
    end,

    [0x7F] = function(self)
        --LD A,A
        self:wait(4)
    end,

    [0x78] = function(self)
        --LD A,B
        self.reg.a = self.reg.b
        self:wait(4)
    end,

    [0x79] = function(self)
        --LD A,C
        self.reg.a = self.reg.c
        self:wait(4)
    end,

    [0x7A] = function(self)
        --LD A,D
        self.reg.a = self.reg.d
        self:wait(4)
    end,

    [0x7B] = function(self)
        --LD A,E
        self.reg.a = self.reg.e
        self:wait(4)
    end,

    [0x7C] = function(self)
        --LD A,H
        self.reg.a = self.reg.h
        self:wait(4)
    end,

    [0x7D] = function(self)
        --LD A,L
        self.reg.a = self.reg.l
        self:wait(4)
    end,

    [0x7E] = function(self)
        --LD A,(HL)
        self.reg.a = mem[self.reg.hl]
        self:wait(8)
    end,

    [0x40] = function(self)
        --LD B,B
        self:wait(4)
    end,

    [0x41] = function(self)
        --LD B,C
        self.reg.b = self.reg.c
        self:wait(4)
    end,

    [0x42] = function(self)
        --LD B,D
        self.reg.b = self.reg.d
        self:wait(4)
    end,

    [0x43] = function(self)
        --LD B,E
        self.reg.b = self.reg.e
        self:wait(4)
    end,

    [0x44] = function(self)
        --LD B,H
        self.reg.b = self.reg.h
        self:wait(4)
    end,

    [0x45] = function(self)
        --LD B,L
        self.reg.b = self.reg.l
        self:wait(4)
    end,

    [0x46] = function(self)
        --LD B,(HL)
        self.reg.b = mem[self.reg.hl]
        self:wait(8)
    end,

    [0x48] = function(self)
        --LD C,B
        self.reg.c = self.reg.b
        self:wait(4)
    end,

    [0x49] = function(self)
        --LD C,C
        self:wait(4)
    end,

    [0x4A] = function(self)
        --LD C,D
        self.reg.c = self.reg.d
        self:wait(4)
    end,

    [0x4B] = function(self)
        --LD C,E
        self.reg.c = self.reg.e
        self:wait(4)
    end,

    [0x4C] = function(self)
        --LD C,H
        self.reg.c = self.reg.h
        self:wait(4)
    end,

    [0x4D] = function(self)
        --LD C,L
        self.reg.c = self.reg.l
        self:wait(4)
    end,

    [0x4E] = function(self)
        --LD C,(HL)
        self.reg.c = mem[self.reg.hl]
        self:wait(8)
    end,

    [0x50] = function(self)
        --LD D,B
        self.reg.d = self.reg.b
        self:wait(4)
    end,
    
    [0x51] = function(self)
        --LD D,C
        self.reg.d = self.reg.c
        self:wait(4)
    end,

    [0x52] = function(self)
        --LD D,D
        self:wait(4)
    end,

    [0x53] = function(self)
        --LD D,E
        self.reg.d = self.reg.e
        self:wait(4)
    end,

    [0x54] = function(self)
        --LD D,H
        self.reg.d = self.reg.h
        self:wait(4)
    end,

    [0x55] = function(self)
        --LD D,L
        self.reg.d = self.reg.l
        self:wait(4)
    end,

    [0x56] = function(self)
        --LD D,(HL)
        self.reg.d = mem[self.reg.hl]
        self:wait(8)
    end,
    
    [0x58] = function(self)
        --LD E,B
        self.reg.e = self.reg.b
        self:wait(4)
    end,

    [0x59] = function(self)
        --LD E,C
        self.reg.e = self.reg.c
        self:wait(4)
    end,

    [0x5A] = function(self)
        --LD E,D
        self.reg.e = self.reg.d
        self:wait(4)
    end,

    [0x5B] = function(self)
        --LD E,E
        self:wait(4)
    end,

    [0x5C] = function(self)
        --LD E,H
        self.reg.e = self.reg.h
        self:wait(4)
    end,

    [0x5D] = function(self)
        --LD E,L
        self.reg.e = self.reg.l
        self:wait(4)
    end,

    [0x5E] = function(self)
        --LD E,(HL)
        self.reg.e = mem[self.reg.hl]
        self:wait(8)
    end,

    [0x60] = function(self)
        --LD H,B
        self.reg.h = self.reg.b
        self:wait(4)
    end,

    [0x61] = function(self)
        --LD H,C
        self.reg.h = self.reg.c
        self:wait(4)
    end,

    [0x62] = function(self)
        --LD H,D
        self.reg.h = self.reg.d
        self:wait(4)
    end,

    [0x63] = function(self)
        --LD H,E
        self.reg.h = self.reg.e
        self:wait(4)
    end,

    [0x64] = function(self)
        --LD H,H
        self:wait(4)
    end,

    [0x65] = function(self)
        --LD H,L
        self.reg.h = self.reg.l
        self:wait(4)
    end,

    [0x66] = function(self)
        --LD H,(HL)
        self.reg.h = mem[self.reg.hl]
        self:wait(8)
    end,

    [0x68] = function(self)
        --LD L,B
        self.reg.l = self.reg.b
        self:wait(4)
    end,

    [0x69] = function(self)
        --LD L,C
        self.reg.l = self.reg.c
        self:wait(4)
    end,

    [0x6A] = function(self)
        --LD L,D
        self.reg.l = self.reg.d
        self:wait(4)
    end,

    [0x6B] = function(self)
        --LD L,E
        self.reg.l = self.reg.e
        self:wait(4)
    end,

    [0x6C] = function(self)
        --LD L,H
        self.reg.l = self.reg.h
        self:wait(4)
    end,

    [0x6D] = function(self)
        --LD L,L
        self:wait(4)
    end,

    [0x6E] = function(self)
        --LD L,(HL)
        self.reg.c = mem[self.reg.hl]
        self:wait(4)
    end,

    [0x70] = function(self)
        --LD (HL),B
        mem[self.reg.hl] = self.reg.b
        self:wait(8)
    end,
        
    [0x71] = function(self)
        --LD (HL),C
        mem[self.reg.hl] = self.reg.c
        self:wait(8)
    end,

    [0x72] = function(self)
        --LD (HL),D
        mem[self.reg.hl] = self.reg.d
        self:wait(8)
    end,

    [0x73] = function(self)
        --LD (HL),E
        mem[self.reg.hl] = self.reg.e
        self:wait(8)
    end,

    [0x74] = function(self)
        --LD (HL),H
        mem[self.reg.hl] = self.reg.h
        self:wait(8)
    end,

    [0x75] = function(self)
        --LD (HL),L
        mem[self.reg.hl] = self.reg.l
        self:wait(8)
    end,
    
    [0x36] = function(self)
        --LD (HL),n
        mem[self.reg.hl] = mem[self.reg.pc]
        self:wait(12)
        return band(self.reg.pc +1, 0xFFFF)
    end,
    
    [0x7F] = function(self)
        --LD A,A
        self:wait(4)
    end,
    
    [0x78] = function(self)
        --LD A,B
        self.reg.a = self.reg.b
        self:wait(4)
    end,
    
    [0x79] = function(self)
        --LD A,C
        self.reg.a = self.reg.c
        self:wait(4)
    end,
    
    [0x7A] = function(self)
        --LD A,D
        self.reg.a = self.reg.d
        self:wait(4)
    end,
    
    [0x7B] = function(self)
        --LD A,E
        self.reg.a = self.reg.e
        self:wait(4)
    end,
    
    [0x7C] = function(self)
        --LD A,H
        self.reg.a = self.reg.h
        self:wait(4)
    end,
    
    [0x7D] = function(self)
        --LD A,L
        self.reg.a = self.reg.l
        self:wait(4)
    end,
    
    [0x0A] = function(self)
        --LD A,(BC)
        self.reg.a = mem[self.reg.bc]
        self:wait(8)
    end,
    
    [0x1A] = function(self)
        --LD A,(DE)
        self.reg.a = mem[self.reg.de]
        self:wait(8)
    end,
    
    [0x7E] = function(self)
        --LD A,(HL)
        self.reg.a = mem[self.reg.hl]
        self:wait(8)
    end,
    
    [0xFA] = function(self)
        --LD A,(nn)
        self.reg.a = mem[bor(
            lshift(
                mem[band(
                    self.reg.pc + 1,
                    0xFFFF)]
                ,8),
            mem[self.reg.pc])] --> mem[mem[self.reg.pc+1 & 0xFFFF] << 8] | mem[self.reg.pc]

        self:wait(16)
        return band(self.reg.pc+2, 0xFFFF)
    end,
    
    [0x3E] = function(self)
        --LD A,n
        self.reg.a = mem[self.reg.pc]
        self:wait(4)
        return band(self.reg.pc+1, 0xFFFF)
    end,
    
    [0x47] = function(self)
        --LD B,A
        self.reg.a = self.reg.b
        self:wait(4)
    end,
    
    [0x4F] = function(self)
        --LD C,A
        self.reg.c = self.reg.a
        self:wait(4)
    end,
    
    [0x57] = function(self)
        --LD D,A
        self.reg.d = self.reg.a
        self:wait(4)
    end,
    
    [0x5F] = function(self)
        --LD E,A
        self.reg.e = self.reg.a
        self:wait(4)
    end,
    
    [0x67] = function(self)
        --LD H,A
        self.reg.h = self.reg.a
        self:wait(4)
    end,
    
    [0x6F] = function(self)
        --LD L,A
        self.reg.l = self.reg.a
    end,
    
    [0x02] = function(self)
        --LD (BC),A
        mem[self.reg.bc] = self.reg.a
        self:wait(8)
    end,
    
    [0x12] = function(self)
        --LD (DE),A
        mem[self.reg.de] = self.reg.a
        self:wait(8)
    end,
    
    [0x77] = function(self)
        --LD (HL),A
        mem[self.reg.hl] = self.reg.a
        self:wait(8)
    end,
    
    [0xEA] = function(self)
        --LD (nn),A 
        mem[lshift(bor(mem[self.reg.pc], mem[self.reg.pc+1]), 8)] = self.reg.a
        
        self:wait(16)
        return band(self.reg.pc+2, 0xFFFF)
    end,
    
    [0xF2] = function(self)
        --LD A,(0xFF00 + C)
        self.reg.a = mem[0xFF00+self.reg.c]
        self:wait(8)
    end,
    
    [0xE2] = function(self)
        --LD (0xFF00 + C),A
        mem[0xFF00+self.reg.c] = self.reg.a
        self:wait(8)
    end,
    
    [0x3A] = function(self)
        --LDD A,(HL) or LD A,(HL) - DEC HL
        self.reg.a = mem[self.reg.hl]
        self.reg.hl = band(self.reg.hl-1, 0xFFFF)
        self:wait(8)

    end,

    [0x32] = function(self)
        --LDD (HL),A or LD (HL),A - DEC HL
        mem[self.reg.hl] = self.reg.a
        self.reg.hl = band(self.reg.hl-1, 0xFFFF)
        self:wait(8)
    end,

    [0x2A] = function (self)
        --LDI A,(HL) or LD A,(HL) - INC HL
        self.reg.a = mem[self.reg.hl]
        self.reg.hl = band(self.reg.hl+1, 0xFFFF)
        self:wait(8)
    end,

    [0x22] = function (self)
        --LDI (HL),A or LD (HL),A - INC HL
        mem[self.reg.hl] = self.reg.a
        self.reg.hl = band(self.reg.hl+1, 0xFFFF)
        self:wait(8)
    end,

    [0xE0] = function (self)
        --LD (0xFF00+n),A 
        mem[0xFF00+mem[self.reg.pc]] = self.reg.a
        self:wait(12)
        return band(self.reg.pc+1, 0xFFFF)
    end,

    [0xF0] = function (self)
        --LD A,(0xFF00+n)
        self.reg.a = mem[0xFF00+mem[self.reg.pc]]
        self:wait(12)
        return band(self.reg.pc+1, 0xFFFF)
    end,
    
    [0x01] = function(self)
        --LD BC,nn
        self.reg.bc = lshift(bor(mem[self.reg.pc], mem[self.reg.pc+1]), 8) --mem[self.reg.pc] | mem[self.reg.pc] << 8
        self:wait(12)
        return band(self.reg.pc+2, 0xFFFF)
    end,
    
    [0x11] = function(self)
        --LD DE,nn
        self.reg.de = lshift(bor(mem[self.reg.pc], mem[self.reg.pc+1]), 8) --mem[self.reg.pc] | mem[self.reg.pc] << 8
        self:wait(12)
        return band(self.reg.pc+2, 0xFFFF)
    end,
    
    [0x21] = function(self)
        --LD HL,nn
        self.reg.hl = lshift(bor(mem[self.reg.pc], mem[self.reg.pc+1]), 8) --mem[self.reg.pc] | mem[self.reg.pc] << 8
        self:wait(12)
        return band(self.reg.pc+2, 0xFFFF)
    end,
    
    [0x31] = function(self)
        --LD SP,nn
        self.reg.sp = lshift(bor(mem[self.reg.pc], mem[self.reg.pc+1]), 8) --mem[self.reg.pc] | mem[self.reg.pc] << 8
        self:wait(12)
        return band(self.reg.pc+2, 0xFFFF)        
    end,
    
    [0xF9] = function(self)
        --LD SP,HL
        self.reg.sp = self.reg.hl
        self:wait(8)
    end,
    
    [0xF8] = function(self)
        --LD HL,SP+n
        local n = mem[self.reg.pc]
        
        --Reset flag register
        self.reg.f.z = false
        self.reg.f.h = false
        self.reg.f.n = false
        self.reg.f.c = false
        
        if n >= 0 then
            if (band(n, 0xF) + band(self.reg.sp, 0xF)) > 0xF then
                self.reg.f.h = true
            end

            if self.reg.sp + n > 0xFFFF then
                self.reg.f.c = true
            end
        else
            if (band(n, 0xF) + band(self.reg.sp, 0xF)) < 0 then
                self.reg.f.h = true
            end
            
            if self.reg.sp + n < 0 then
                self.reg.f.c = true
            end
        end

        return band(self.reg.pc+1, 0xFFFF)
    end,

},
{__index=function() return function(self) printf("Unrecognized opcode: 0x%2X", self.opcode) end end})

return function(self)
    local pc = ops[self.opcode](self) or self.reg.pc
    return {
        pc = pc
    }
end
