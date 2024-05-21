local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- Create an animation instance
local punchAnim = Instance.new("Animation")
punchAnim.AnimationId = "rbxassetid://YOUR_ANIMATION_ID"

local punchTrack = humanoid:LoadAnimation(punchAnim)

-- Function to perform the punch
local function performPunch()
    punchTrack:Play()
    -- Hit detection logic
    -- this is a simple code for hit detection, not very high quality
    local hitbox = Instance.new("Part")
    hitbox.Size = Vector3.new(2, 2, 2)
    hitbox.Transparency = 1
    hitbox.CanCollide = false
    hitbox.CFrame = character.PrimaryPart.CFrame * CFrame.new(0, 0, -2)
    hitbox.Parent = workspace
    game.Debris:AddItem(hitbox, 0.1)

    hitbox.Touched:Connect(function(hit)
        local targetHumanoid = hit.Parent:FindFirstChild("Humanoid")
        if targetHumanoid then
            targetHumanoid:TakeDamage(10)
        end
    end)
end
local userInput = game:GetService("UserInputService")
userInput.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.UserInputType == Enum.UserInputType.MouseButton1 then
        performPunch()
    end
end)
