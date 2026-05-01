--flappy bird 

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 512
VIRTUAL_HEIGHT = 288

push = require 'push'


function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')

    bg = love.graphics.newImage('Assets/background.png')
    gd = love.graphics.newImage('Assets/ground.png')

    love.window.setTitle('Flappy Bird - spicez21')
    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
        vsync = true,
        fullscreen = false,
        resizable = true
    })

    push.setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, { upscale = 'normal' })

end 

function love.resize(w, h)
    push.resize(w, h)
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end

function love.draw()
    push.start()

    love.graphics.draw(bg, 0, 0)
    love.graphics.draw(gd, 0, VIRTUAL_HEIGHT - 16)

    push.finish()
end
