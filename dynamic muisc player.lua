-- Script to change the background music based on player actions
local music = Instance.new("Sound", game.Workspace)
music.Looped = true  -- option to loop music
game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        music.SoundId = "rbxassetid://1234567890" -- Replace with actual sound ID
        music:Play()
        wait(10) 
        music:Stop()
    end)
end)
