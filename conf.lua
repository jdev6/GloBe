function love.conf(t)
    t.window.width = 160*2
    t.window.height = 144*2
    t.window.title = "GlöBe window"
    t.window.resizable = false

    t.modules.joystick = false
    t.modules.physics = false
    t.modules.audio = false
end
