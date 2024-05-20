-- This script make the npc follow the nearest player
local npc = script.Parent
local runService = game:GetService("RunService")

runService.Heartbeat:Connect(function()
    local closestPlayer = nil
    local shortestDistance = math.huge

    for _, player in pairs(game.Players:GetPlayers()) do
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local distance = (npc.Position - player.Character.HumanoidRootPart.Position).magnitude
            if distance < shortestDistance then
                closestPlayer = player
                shortestDistance = distance
            end
        end
    end

    if closestPlayer then
        local targetPosition = closestPlayer.Character.HumanoidRootPart.Position
        npc.CFrame = CFrame.new(npc.Position, targetPosition)
        npc.Position = npc.Position:Lerp(targetPosition, 0.05)
    end
end)
