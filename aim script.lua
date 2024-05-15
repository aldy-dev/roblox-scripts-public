-- Local Script (StarterPlayerScripts or StarterCharacterScripts)

-- Get references to necessary objects
local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local gun = character:WaitForChild("Gun") -- Replace "Gun" with the actual name of your gun model
local bulletPrefab = game.ReplicatedStorage:WaitForChild("BulletPrefab") -- Replace "BulletPrefab" with the actual name of your bullet prefab

-- Function to handle shooting event
local function onShoot()
    -- Calculate direction from gun to mouse cursor
    local direction = (mouse.Hit.p - gun.Position).unit
    
    -- Create bullet instance
    local bullet = bulletPrefab:Clone()
    bullet.Parent = workspace
    bullet.Position = gun.Position -- Set initial position of the bullet to the gun's position
    
    -- Set velocity of the bullet to shoot in the calculated direction
    bullet.Velocity = direction * BULLET_SPEED -- Replace BULLET_SPEED with the desired bullet speed
    
    -- Clean up bullet after a certain time or distance
    bullet.Touched:Connect(function(hit)
        bullet:Destroy()
    end)
end

-- Connect shooting function to an event (e.g., player input)
-- Example: gun.MouseButton1Down:Connect(onShoot)