local userInput = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local replicatedStorage = game:GetService("ReplicatedStorage")
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local abilities = {
    Dash = {
        key = Enum.KeyCode.Q,
        cooldown = 5,
        lastUsed = 0
    },
    Fireball = {
        key = Enum.KeyCode.E,
        cooldown = 10,
        lastUsed = 0
    }
}

local function isOnCooldown(ability)
    return tick() - ability.lastUsed < ability.cooldown
end

local function executeDash()
    if isOnCooldown(abilities.Dash) then return end
    abilities.Dash.lastUsed = tick()

    local dashDirection = humanoid.MoveDirection
    if dashDirection.Magnitude == 0 then
        dashDirection = character.PrimaryPart.CFrame.LookVector
    end

    local dashVelocity = 100
    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.Velocity = dashDirection * dashVelocity
    bodyVelocity.MaxForce = Vector3.new(4000, 4000, 4000)
    bodyVelocity.Parent = character.PrimaryPart

    game:GetService("Debris"):AddItem(bodyVelocity, 0.2)
end

local function executeFireball()
    if isOnCooldown(abilities.Fireball) then return end
    abilities.Fireball.lastUsed = tick()

    local fireball = Instance.new("Part")
    fireball.Size = Vector3.new(1, 1, 1)
    fireball.Shape = Enum.PartType.Ball
    fireball.BrickColor = BrickColor.new("Bright orange")
    fireball.Material = Enum.Material.Neon
    fireball.CFrame = character.PrimaryPart.CFrame + character.PrimaryPart.CFrame.LookVector * 2
    fireball.Velocity = character.PrimaryPart.CFrame.LookVector * 50
    fireball.CanCollide = false
    fireball.Parent = workspace

    game:GetService("Debris"):AddItem(fireball, 5)

    fireball.Touched:Connect(function(hit)
        if hit and hit.Parent and hit.Parent:FindFirstChild("Humanoid") then
            local hitHumanoid = hit.Parent.Humanoid
            hitHumanoid:TakeDamage(20)
            fireball:Destroy()
        end
    end)
end

local function onInputBegan(input, processed)
    if processed then return end

    if input.KeyCode == abilities.Dash.key then
        executeDash()
    elseif input.KeyCode == abilities.Fireball.key then
        executeFireball()
    end
end

userInput.InputBegan:Connect(onInputBegan)
