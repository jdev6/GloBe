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

local show_debug = true

function love.load()
    local options = arg_parse(arg)
    if show_debug then
        options.rom = options.rom or "sml.gb"
    end
    print(options.rom)
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
    if suit.Button(string.format("Debug: %s", show_debug), 2,2,84,20).hit then
        show_debug = not show_debug
    end
end

function love.draw()
    suit.draw()

    if show_debug then
        local y = 30
        for r,v in pairs(cpu.reg) do
            if r ~= 'f' then
                lg.print(string.format('%s: %2X',r,v), 5,y)
            else
                lg.print(string.format('f: {z: %s, n: %s, h: %s, c: %s}',v.z,v.n,v.h,v.c), 5,y)
            end
            y=y+15
        end
    end
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

        if love.timer and not love.keyboard.isDown "tab" then love.timer.sleep(1/FPS) end
    end
end
