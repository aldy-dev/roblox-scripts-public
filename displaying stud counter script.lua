local playerKilledEvent = game.ReplicatedStorage:WaitForChild("PlayerKilled")

playerKilledEvent.OnClientEvent:Connect(function(killer, victim, distance)
    local player = game.Players.LocalPlayer
    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = player.PlayerGui

    local frame = Instance.new("Frame")
    frame.Position = UDim2.new(0, 10, 1, -60) -- Bottom left corner
    frame.Size = UDim2.new(0, 200, 0, 50)
    frame.BackgroundColor3 = Color3.new(0, 0, 0)
    frame.BackgroundTransparency = 0.5
    frame.BorderSizePixel = 0
    frame.Parent = screenGui

    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.Position = UDim2.new(0, 0, 0, 0)
    textLabel.TextColor3 = Color3.new(1, 1, 1)
    textLabel.TextStrokeTransparency = 0
    textLabel.TextScaled = true
    textLabel.Font = Enum.Font.SourceSansBold
    textLabel.Text = killer.Name.." killed "..victim.Name.." from "..distance.." studs away."
    textLabel.Parent = frame

    wait(5) -- Display for 5 seconds
    screenGui:Destroy()
end)