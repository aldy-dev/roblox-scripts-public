local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

local basketball = script.Parent
local hoop = game.Workspace.Hoop
local backboard = game.Workspace.Backboard
local bouncyPad = game.Workspace.BouncyPad
local fan = game.Workspace.Fan

local shootForce = 5000
local bounceForce = 10000
local fanForce = 500

local isShooting = false
local shootDirection = Vector3.new()

-- Function to shoot the basketball
local function ShootBall()
    local ballVelocity = basketball.Velocity
    basketball.Velocity = ballVelocity + (shootDirection * shootForce)
    isShooting = false
end

-- Function to handle dragging to shoot
local function OnInputBegan(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        isShooting = true
        shootDirection = (basketball.Position - mouse.Hit.p).unit
    end
end

local function OnInputChanged(input)
    if isShooting then
        shootDirection = (basketball.Position - mouse.Hit.p).unit
    end
end

local function OnInputEnded(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        ShootBall()
    end
end

-- Function to handle collisions with hoop and backboard
local function OnHit(part)
    if part == hoop then
        -- Move to next stage
        print("Basketball made it into the net! Moving to next stage...")
    elseif part == backboard then
        -- Force ball into net
        ShootBall()
    end
end

-- Function to handle collisions with bouncy pad
local function OnBounce(hit)
    if hit == bouncyPad then
        basketball.Velocity = basketball.Velocity + Vector3.new(0, bounceForce, 0)
    end
end

-- Function to handle collisions with fan
local function OnFan(hit)
    if hit == fan then
        basketball.Velocity = basketball.Velocity + (basketball.Position - fan.Position).unit * fanForce
    end
end

-- Connect input events
mouse.Button1Down:Connect(OnInputBegan)
mouse.Button1Up:Connect(OnInputEnded)
mouse.Move:Connect(OnInputChanged)

-- Connect collision events
basketball.Touched:Connect(OnHit)
basketball.Touched:Connect(OnBounce)
basketball.Touched:Connect(OnFan)