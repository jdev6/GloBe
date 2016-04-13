--begin constants
GLOBE_VERSION = "super alpha"
WIDTH, HEIGHT = love.graphics.getDimensions()
FPS = 60
lg = love.graphics
--end constants

       require("src.util")
cpu  = require("src.cpu").new()
mem  = require("src.mem")
suit = require("lib.suit")

local show_help = false
local help_message =
[[esc to quit xd]]

function love.load()
    local options = arg_parse(arg)
    if options.rom then

        printf("Rom: %s", options.rom)

        local rom_data = read_bin(options.rom)
        if rom_data then
            mem:init()
            mem:loadRom(rom_data)
        else
            printf("Unable to open file: %s", options.rom)
        end
    end
end

function love.update()
    cpu:cycle()
    if suit.Button("Help", 2,2,40,20).hit then
        show_help = not show_help
    end

    if show_help then
        suit.Label(help_message, 0,20, 100,80)
    end
end

function love.draw()
    suit.draw()

    lg.print(string.format(
[[a: %0X 
b: %0X
c: %0X
d: %0X
e: %0X
h: %0X
l: %0X
hl: %0X
pc: %i]],cpu.reg.a,cpu.reg.b,cpu.reg.c,cpu.reg.d,cpu.reg.e,cpu.reg.h,cpu.reg.l,cpu.reg.hl,cpu.reg.pc),0,0)
end

function love.keypressed(k)
    if k == "escape" then
        love.event.quit()
        print "Quitting..."
    end
end

function love.run()
    if love.load then love.load(arg) end
 
    -- Main loop time.
    while true do
        -- Process events.
        if love.event then
            love.event.pump()
            for name, a,b,c,d,e,f in love.event.poll() do
                if name == "quit" then
                    if not love.quit or not love.quit() then
                        return a
                    end
                end
                love.handlers[name](a,b,c,d,e,f)
            end
        end
 
        -- Update dt, as we'll be passing it to update
        if love.timer then
            love.timer.step()
        end
 
        -- Call update and draw
        love.update()
        if love.graphics.isActive() then
            love.graphics.clear(love.graphics.getBackgroundColor())
            love.graphics.origin()
            love.draw()
            love.graphics.present()
        end
 
        if love.timer then love.timer.sleep(1/FPS) end
    end
end
