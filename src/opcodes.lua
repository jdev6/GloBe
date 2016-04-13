--begin switch
local _v; local function switch(v) _v = v end; local function case(x) return _v == x end; local function endswitch() _v = nil end
--end switch

return function(self)
    local op = self.opcode
    
    -----------
    --OPCODES--
    -----------
    switch(op)

        ------
        --LD--
        ------
        if case(0x06) then
            --LD B,n
            self.reg.b = math.fmod(self.reg.pc, 0xFF)
            self:wait(8)

        elseif case(0x0E) then
            --LD C,n
            self.reg.c = math.fmod(self.reg.pc, 0xFF)
            self:wait(8)

        elseif case(0x16) then
            --LD D,n
            self.reg.d = math.fmod(self.reg.pc, 0xFF)
            self:wait(8)

        elseif case(0x1E) then
            --LD E,n
            self.reg.e = math.fmod(self.reg.pc, 0xFF)
            self:wait(8)

        elseif case(0x26) then
            --LD H,n
            self.reg.h = math.fmod(self.reg.pc, 0xFF)
            self:wait(8)

        elseif case(0x2E) then
            --LD L,n
            self.reg.l = math.fmod(self.reg.pc, 0xFF)
            self:wait(8)

        elseif case(0x7F) then
            --LD A,A
            self:wait(4)

        elseif case(0x78) then
            --LD A,B
            self.reg.a = self.reg.b
            self:wait(4)

        elseif case(0x79) then
            --LD A,C
            self.reg.a = self.reg.c
            self:wait(4)

        elseif case(0x7A) then
            --LD A,D
            self.reg.a = self.reg.d
            self:wait(4)

        elseif case(0x7B) then
            --LD A,E
            self.reg.a = self.reg.e
            self:wait(4)

        elseif case(0x7C) then
            --LD A,H
            self.reg.a = self.reg.h
            self:wait(4)

        elseif case(0x7D) then
            --LD A,L
            self.reg.a = self.reg.l
            self:wait(4)

        elseif case(0x7E) then
            --LD A,(HL)
            self.reg.a = mem[self.reg.hl]
            self:wait(8)

        elseif case(0x40) then
            --LD B,B
            self:wait(4)

        elseif case(0x41) then
            --LD B,C
            self.reg.b = self.reg.c
            self:wait(4)

        elseif case(0x42) then
            --LD B,D
            self.reg.b = self.reg.d
            self:wait(4)

        elseif case(0x43) then
            --LD B,E
            self.reg.b = self.reg.e
            self:wait(4)
        
        elseif case(0x44) then
            --LD B,H
            self.reg.b = self.reg.h
            self:wait(4)

        elseif case(0x45) then
            --LD B,L
            self.reg.b = self.reg.l
            self:wait(4)

        elseif case(0x46) then
            --LD B,(HL)
            self.reg.b = mem[self.reg.hl]
            self:wait(8)

        elseif case(0x48) then
            --LD C,B
            self.reg.c = self.reg.b
            self:wait(4)

        elseif case(0x49) then
            --LD C,C
            self:wait(4)

        elseif case(0x4A) then
            --LD C,D
            self.reg.c = self.reg.d
            self:wait(4)

        elseif case(0x4B) then
            --LD C,E
            self.reg.c = self.reg.e
            self:wait(4)

        elseif case(0x4C) then
            --LD C,H
            self.reg.c = self.reg.h
            self:wait(4)

        elseif case(0x4D) then
            --LD C,L
            self.reg.c = self.reg.l
            self:wait(4)

        elseif case(0x4E) then
            --LD C,(HL)
            self.reg.c = mem[self.reg.hl]
            self:wait(8)

        elseif case(0x50) then
            --LD D,B
            self.reg.d = self.reg.b
            self:wait(4)
        
        elseif case(0x51) then
            --LD D,C
            self.reg.d = self.reg.c
            self:wait(4)

        elseif case(0x52) then
            --LD D,D
            self:wait(4)

        elseif case(0x53) then
            --LD D,E
            self.reg.d = self.reg.e
            self:wait(4)

        elseif case(0x54) then
            --LD D,H
            self.reg.d = self.reg.h
            self:wait(4)

        elseif case(0x55) then
            --LD D,L
            self.reg.d = self.reg.l
            self:wait(4)

        elseif case(0x56) then
            --LD D,(HL)
            self.reg.d = mem[self.reg.hl]
            self:wait(8)
        
        elseif case(0x58) then
            --LD E,B
            self.reg.e = self.reg.b
            self:wait(4)

        elseif case(0x59) then
            --LD E,C
            self.reg.e = self.reg.c
            self:wait(4)

        elseif case(0x5A) then
            --LD E,D
            self.reg.e = self.reg.d
            self:wait(4)

        elseif case(0x5B) then
            --LD E,E
            self:wait(4)

        elseif case(0x5C) then
            --LD E,H
            self.reg.e = self.reg.h
            self:wait(4)

        elseif case(0x5D) then
            --LD E,L
            self.reg.e = self.reg.l
            self:wait(4)

        elseif case(0x5E) then
            --LD E,(HL)
            self.reg.e = mem[self.reg.hl]
            self:wait(8)

        elseif case(0x60) then
            --LD H,B
            self.reg.h = self.reg.b
            self:wait(4)

        elseif case(0x61) then
            --LD H,C
            self.reg.h = self.reg.c
            self:wait(4)

        elseif case(0x62) then
            --LD H,D
            self.reg.h = self.reg.d
            self:wait(4)

        elseif case(0x63) then
            --LD H,E
            self.reg.h = self.reg.e
            self:wait(4)

        elseif case(0x64) then
            --LD H,H
            self:wait(4)

        elseif case(0x65) then
            --LD H,L
            self.reg.h = self.reg.l
            self:wait(4)

        elseif case(0x66) then
            --LD H,(HL)
            self.reg.h = mem[self.reg.hl]
            self:wait(8)

        elseif case(0x68) then
            --LD L,B
            self.reg.l = self.reg.b
            self:wait(4)

        elseif case(0x69) then
            --LD L,C
            self.reg.l = self.reg.c
            self:wait(4)

        elseif case(0x6A) then
            --LD L,D
            self.reg.l = self.reg.d
            self:wait(4)

        elseif case(0x6B) then
            --LD L,E
            self.reg.l = self.reg.e
            self:wait(4)

        elseif case(0x6C) then
            --LD L,H
            self.reg.l = self.reg.h
            self:wait(4)

        elseif case(0x6D) then
            --LD L,L
            self:wait(4)

        elseif case(0x6E) then
            --LD L,(HL)
            self.reg.c = mem[self.reg.hl]
            self:wait(4)

        else
            printf("Unrecognized opcode: %02X", op)
        end

    endswitch()

    return {
        pc = self.reg.pc +2
    }
end
