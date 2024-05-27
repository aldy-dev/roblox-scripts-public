local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local userInput = game:GetService("UserInputService")

local combatEnabled = true
local attackCooldown = 0.5
local lastAttackTime = 0

local function performAttack()
    if not combatEnabled or tick() - lastAttackTime < attackCooldown then return end

    lastAttackTime = tick()

    local attackDirection = humanoid.MoveDirection
    if character:FindFirstChild("FlyingVelocity") then
        attackDirection = workspace.CurrentCamera.CFrame.LookVector
    end

    local hitbox = Instance.new("Part")
    hitbox.Size = Vector3.new(5, 5, 5)
    hitbox.CFrame = character.PrimaryPart.CFrame + attackDirection * 5
    hitbox.Anchored = true
    hitbox.CanCollide = false
    hitbox.Transparency = 1
    hitbox.Parent = workspace

    hitbox.Touched:Connect(function(hit)
        local hitHumanoid = hit.Parent:FindFirstChild("Humanoid")
        if hitHumanoid and hitHumanoid ~= humanoid then
            hitHumanoid:TakeDamage(10)
        end
    end)

    game:GetService("Debris"):AddItem(hitbox, 0.2)
end

userInput.InputBegan:Connect(function(input, processed)
    if processed then return end
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.KeyCode == Enum.KeyCode.E then
        performAttack()
    end
end)
