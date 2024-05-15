--This script handles the logic for firing the weapon and communicates with the client to play the shooting sound.
-- Server Script (ServerScriptService)

-- Define RemoteEvent for shooting
local ShootEvent = game.ReplicatedStorage:WaitForChild("ShootEvent")

-- Function to handle shooting
local function onShoot(player)
    -- Add shooting logic here (e.g., check ammo, spawn projectile, etc.)
    
    -- Trigger the shooting sound on the client
    ShootEvent:FireClient(player)
end

-- Connect shooting function to an event (e.g., player input)
-- Example: player.CharacterAdded:Connect(function(character)
--             local humanoid = character:WaitForChild("Humanoid")
--             humanoid.Died:Connect(function()
--                 onShoot(player)  -- Call onShoot function when shooting
--             end)
--          end)