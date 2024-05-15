-- Configuration
local magazineSize = 30 -- Changeable magazine size
local fireMode = "automatic" -- Can be "single", "semi", or "automatic"

-- Variables
local isReloading = false
local ammoCount = magazineSize
local lastFireTime = 0

-- Functions
local function fireBullet()
    -- Check fire rate
    if tick() - lastFireTime < (fireMode == "automatic" and 0.1 or 0.3) then
        return
    end
    
    -- Check ammo
    if ammoCount <= 0 then
        return
    end
    
    -- Fire bullet
    local bullet = Instance.new("Part")
    -- Customize bullet properties
    bullet.Parent = workspace
    bullet.Position = -- Set bullet position based on gun position and direction
    bullet.Size = Vector3.new(0.2, 0.2, 1) -- Customize bullet size
    bullet.BrickColor = BrickColor.new("Bright red") -- Customize bullet color
    bullet.Velocity = -- Set bullet velocity based on gun direction and speed
    
    -- Decal creation for wall hit
    bullet.Touched:Connect(function(hit)
        if hit:IsA("BasePart") and hit.CanCollide then
            local decal = Instance.new("Decal")
            -- Customize decal properties
            decal.Texture = "http://www.roblox.com/asset/?id=YOUR_DECAL_ID" -- Customize decal texture
            decal.Parent = hit
        end
    end)
    
    -- Bullet lifetime
    wait(5) -- Customize bullet lifetime
    bullet:Destroy()
    
    -- Reduce ammo
    ammoCount = ammoCount - 1
    lastFireTime = tick()
end

local function reload()
    -- Check if already reloading or full ammo
    if isReloading or ammoCount == magazineSize then
        return
    end
    
    isReloading = true
    -- Play reload animation/sound
    
    -- Simulate reload time
    wait(2) -- Customize reload time
    
    -- Refill ammo
    ammoCount = magazineSize
    isReloading = false
end

-- Input handling
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.R then
        reload()
    elseif input.UserInputType == Enum.UserInputType.MouseButton1 then
        fireBullet()
    end
end)