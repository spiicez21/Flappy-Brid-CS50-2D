--flappy bird 

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 512
VIRTUAL_HEIGHT = 288

push = require 'push'
Class = require 'class'

require 'Bird'

local bgscroll = 0
local groundscroll = 0

local BACKGROUND_SCROLL_SPEED = 30
local GROUND_SCROLL_SPEED = 60

local BACKGROUND_LOOPING_POINT = 413



function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')

    bg = love.graphics.newImage('Assets/background.png')
    gd = love.graphics.newImage('Assets/ground.png')

    bird = Bird()

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

function love.update(dt)
    bgscroll = (bgscroll + BACKGROUND_SCROLL_SPEED * dt) % BACKGROUND_LOOPING_POINT
    gdscroll = (groundscroll + GROUND_SCROLL_SPEED * dt) % VIRTUAL_WIDTH

    bird:update(dt)
end

function love.draw()
    push.start()

    love.graphics.draw(bg, -bgscroll, 0)
    love.graphics.draw(gd, -gdscroll, VIRTUAL_HEIGHT - 16)
    bird:render()
    push.finish()
end
