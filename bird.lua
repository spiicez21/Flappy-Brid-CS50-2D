Bird = Class{}


local GRAVITY = 980

function Bird:init()
    self.img = love.graphics.newImage('Assets/bird.png')
    self.width = self.img:getWidth()
    self.height = self.img:getHeight()

    self.x = VIRTUAL_WIDTH / 2 - (self.width / 2)
    self.y = VIRTUAL_HEIGHT / 2 - (self.height / 2)

    self.dy = 0
end

function Bird:update(dt)

    self.dy = self.dy + GRAVITY * dt

    if love.keyboard.wasPressed('space') then
        self.dy = -300
    end

    self.y = self.y + self.dy * dt
end

function Bird:render()
    love.graphics.draw(self.img, self.x, self.y)
end