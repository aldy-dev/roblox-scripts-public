game.Players.PlayerAdded:Connect(function(player)
    player:LoadCharacter()
    local welcomeMessage = Instance.new("Message")
    welcomeMessage.Text = "Welcome to the game, " .. player.Name .. "!"
    welcomeMessage.Parent = player.Character
    wait(5)
    welcomeMessage:Destroy()
end)
