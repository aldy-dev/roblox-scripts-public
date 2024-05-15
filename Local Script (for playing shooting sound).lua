-- Local Script (StarterPlayerScripts or StarterCharacterScripts)

-- Define RemoteEvent for shooting
local ShootEvent = game.ReplicatedStorage:WaitForChild("ShootEvent")

-- Function to play shooting sound
local function playShootSound()
    -- Load and play shooting sound
    local shootingSound = Instance.new("Sound")
    shootingSound.SoundId = "rbxassetid://YOUR_SHOOTING_SOUND_ID"
    shootingSound.Parent = game.Workspace  -- You can parent it to a different object if needed
    shootingSound:Play()
    
    -- Clean up sound after playing (optional)
    shootingSound.Ended:Connect(function()
        shootingSound:Destroy()
    end)
end

-- Listen for shooting event from the server
ShootEvent.OnClientEvent:Connect(function()
    playShootSound()
end)