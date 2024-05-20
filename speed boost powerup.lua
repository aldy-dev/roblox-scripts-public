local powerUp = script.Parent

powerUp.Touched:Connect(function(hit)
    local character = hit.Parent
    if character:FindFirstChild("Humanoid") then
        local player = game.Players:GetPlayerFromCharacter(character)
        if player then
            character.Humanoid.WalkSpeed = 50
            wait(5)
            character.Humanoid.WalkSpeed = 16
        end
    end
end)
