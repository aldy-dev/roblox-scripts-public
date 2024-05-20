game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        while humanoid and humanoid.Health > 0 do
            if humanoid.Health < humanoid.MaxHealth then
                humanoid.Health = humanoid.Health + 1
            end
            wait(1)
        end
    end)
end)
