local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local userInput = game:GetService("UserInput-- StarterPlayerScripts > FlyScript (LocalScript)
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local userInput = game:GetService("UserInputService")
local runService = game:GetService("RunService")

local isFlying = false
local flySpeed = 50

-- Function to start flying
local function startFlying()
    isFlying = true
    humanoid.PlatformStand = true

    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.Velocity = Vector3.new(0, 0, 0)
    bodyVelocity.MaxForce = Vector3.new(4000, 4000, 4000)
    bodyVelocity.Name = "FlyingVelocity"
    bodyVelocity.Parent = character.PrimaryPart

    local bodyGyro = Instance.new("BodyGyro")
    bodyGyro.MaxTorque = Vector3.new(4000, 4000, 4000)
    bodyGyro.P = 1000
    bodyGyro.CFrame = character.PrimaryPart.CFrame
    bodyGyro.Name = "FlyingGyro"
    bodyGyro.Parent = character.PrimaryPart
end

-- Function to stop flying
local function stopFlying()
    isFlying = false
    humanoid.PlatformStand = false

    if character.PrimaryPart:FindFirstChild("FlyingVelocity") then
        character.PrimaryPart.FlyingVelocity:Destroy()
    end
    if character.PrimaryPart:FindFirstChild("FlyingGyro") then
        character.PrimaryPart.FlyingGyro:Destroy()
    end
end

-- Function to handle flying controls
local function handleFlyingInput()
    if not isFlying then return end

    local direction = Vector3.new()
    if userInput:IsKeyDown(Enum.KeyCode.W) then
        direction = direction + workspace.CurrentCamera.CFrame.LookVector
    end
    if userInput:IsKeyDown(Enum.KeyCode.S) then
        direction = direction - workspace.CurrentCamera.CFrame.LookVector
    end
    if userInput:IsKeyDown(Enum.KeyCode.A) then
        direction = direction - workspace.CurrentCamera.CFrame.RightVector
    end
    if userInput:IsKeyDown(Enum.KeyCode.D) then
        direction = direction + workspace.CurrentCamera.CFrame.RightVector
    end
    if userInput:IsKeyDown(Enum.KeyCode.Space) then
        direction = direction + Vector3.new(0, 1, 0)
    end
    if userInput:IsKeyDown(Enum.KeyCode.LeftControl) then
        direction = direction - Vector3.new(0, 1, 0)
    end

    if character.PrimaryPart:FindFirstChild("FlyingVelocity") then
        character.PrimaryPart.FlyingVelocity.Velocity = direction.unit * flySpeed
    end

    if character.PrimaryPart:FindFirstChild("FlyingGyro") then
        character.PrimaryPart.FlyingGyro.CFrame = workspace.CurrentCamera.CFrame
    end
end

-- Toggle flying on double jump
local canDoubleJump = true
local function onJumpRequest()
    if not canDoubleJump then
        startFlying()
    end
    canDoubleJump = not canDoubleJump
end

-- Key binding for flying (double space to toggle)
userInput.InputBegan:Connect(function(input, processed)
    if processed then return end
    if input.KeyCode == Enum.KeyCode.Space then
        onJumpRequest()
    end
end)

humanoid.StateChanged:Connect(function(_, newState)
    if newState == Enum.HumanoidStateType.Freefall or newState == Enum.HumanoidStateType.Jumping then
    else
        stopFlying()
    end
end)

-- Update flying direction each frame
runService.RenderStepped:Connect(handleFlyingInput)Service")
local runService = game:GetService("RunService")

local isFlying = false
local flySpeed = 50

local function startFlying()
    isFlying = true
    humanoid.PlatformStand = true

    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.Velocity = Vector3.new(0, 0, 0)
    bodyVelocity.MaxForce = Vector3.new(4000, 4000, 4000)
    bodyVelocity.Name = "FlyingVelocity"
    bodyVelocity.Parent = character.PrimaryPart

    local bodyGyro = Instance.new("BodyGyro")
    bodyGyro.MaxTorque = Vector3.new(4000, 4000, 4000)
    bodyGyro.P = 1000
    bodyGyro.CFrame = character.PrimaryPart.CFrame
    bodyGyro.Name = "FlyingGyro"
    bodyGyro.Parent = character.PrimaryPart
end

local function stopFlying()
    isFlying = false
    humanoid.PlatformStand = false

    if character.PrimaryPart:FindFirstChild("FlyingVelocity") then
        character.PrimaryPart.FlyingVelocity:Destroy()
    end
    if character.PrimaryPart:FindFirstChild("FlyingGyro") then
        character.PrimaryPart.FlyingGyro:Destroy()
    end
end

local function handleFlyingInput()
    if not isFlying then return end

    local direction = Vector3.new()
    if userInput:IsKeyDown(Enum.KeyCode.W) then
        direction = direction + workspace.CurrentCamera.CFrame.LookVector
    end
    if userInput:IsKeyDown(Enum.KeyCode.S) then
        direction = direction - workspace.CurrentCamera.CFrame.LookVector
    end
    if userInput:IsKeyDown(Enum.KeyCode.A) then
        direction = direction - workspace.CurrentCamera.CFrame.RightVector
    end
    if userInput:IsKeyDown(Enum.KeyCode.D) then
        direction = direction + workspace.CurrentCamera.CFrame.RightVector
    end
    if userInput:IsKeyDown(Enum.KeyCode.Space) then
        direction = direction + Vector3.new(0, 1, 0)
    end
    if userInput:IsKeyDown(Enum.KeyCode.LeftControl) then
        direction = direction - Vector3.new(0, 1, 0)
    end

    if character.PrimaryPart:FindFirstChild("FlyingVelocity") then
        character.PrimaryPart.FlyingVelocity.Velocity = direction.unit * flySpeed
    end

    if character.PrimaryPart:FindFirstChild("FlyingGyro") then
        character.PrimaryPart.FlyingGyro.CFrame = workspace.CurrentCamera.CFrame
    end
end

local canDoubleJump = true
local function onJumpRequest()
    if not canDoubleJump then
        startFlying()
    end
    canDoubleJump = not canDoubleJump
end

userInput.InputBegan:Connect(function(input, processed)
    if processed then return end
    if input.KeyCode == Enum.KeyCode.Space then
        onJumpRequest()
    end
end)

humanoid.StateChanged:Connect(function(_, newState)
    if newState == Enum.HumanoidStateType.Freefall or newState == Enum.HumanoidStateType.Jumping then
      
    else
        stopFlying()
    end
end)

runService.RenderStepped:Connect(handleFlyingInput)
