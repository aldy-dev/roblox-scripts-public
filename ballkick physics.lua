-- Script to handle kicking a ball with variable power based on duration of mouse clicked and held

-- Ensure this script is a localscript placed in starterPlayerScripts

local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local ball = game.Workspace:WaitForChild("Ball")  -- Ensure the ball is named "Ball" in the Workspace

local holdStart = 0
local maxPower = 1000  -- Maximum force applied to the ball
local chargeRate = 500  -- Rate at which power increases per second

-- Function to kick the ball
local function kickBall(power)
    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.Velocity = (mouse.Hit.p - ball.Position).unit * power
    bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    bodyVelocity.Parent = ball

    -- Smooth midair motion
    game.Debris:AddItem(bodyVelocity, 0.5)  -- Remove BodyVelocity after 0.5 seconds to allow gravity to take over
end

-- Mouse button down event
mouse.Button1Down:Connect(function()
    holdStart = tick()  -- Record the time when the button is pressed
end)

-- Mouse button up event
mouse.Button1Up:Connect(function()
    if holdStart > 0 then
        local holdDuration = tick() - holdStart  -- Calculate hold duration
        local power = math.min(holdDuration * chargeRate, maxPower)  -- Calculate power, ensuring it doesn't exceed maxPower
        kickBall(power)  -- Kick the ball with the calculated power
        holdStart = 0  -- Reset holdStart for the next kick
    end
end)
