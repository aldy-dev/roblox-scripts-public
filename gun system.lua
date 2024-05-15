-- Configuration
local magazineSize = 30 -- Changeable magazine size
local fireMode = "automatic" -- Can be "single", "semi", or "automatic"
local bulletSpeed = 100 -- Speed of the bullet
local bulletLifetime = 5 -- Time before bullets disappear (in seconds)
local bulletDamage = 10 -- Base damage of the bullet
local headshotMultiplier = 2 -- Damage multiplier for headshots
local screenShakeIntensity = 0.1 -- Intensity of screen shake
local screenShakeDuration = 0.1 -- Duration of screen shake (in seconds)

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
    
    -- Screen shake
    local camera = game.Workspace.CurrentCamera
    local originalPosition = camera.CFrame.Position
    local shakeDirection = Vector3.new(math.random(), math.random(), math.random()).unit
    camera.CFrame = camera.CFrame * CFrame.new(shakeDirection * screenShakeIntensity)
    wait(screenShakeDuration)
    camera.CFrame = CFrame.new(originalPosition)
    
    -- Firing bullet
    local gunPosition = script.Parent.Handle.Position
    local gunDirection = script.Parent.Handle.CFrame.LookVector
    local bullet = Instance.new("Part")
    bullet.Parent = workspace
    bullet.Position = gunPosition
    bullet.Size = Vector3.new(0.2, 0.2, 1) -- Customize bullet size
    bullet.BrickColor = BrickColor.new("Bright red") -- Customize bullet color
    bullet.Velocity = gunDirection * bulletSpeed
    
    -- Decal creation for wall hit
    bullet.Touched:Connect(function(hit)
        if hit:IsA("BasePart") and hit.CanCollide then
            local decal = Instance.new("Decal")
            decal.Texture = "http://www.roblox.com/asset/?id=YOUR_DECAL_ID" -- Customize decal texture
            decal.Parent = hit
        end
        bullet:Destroy()
    end)
    
    -- Bullet lifetime
    game:GetService("Debris"):AddItem(bullet, bulletLifetime)
    
    lastFireTime = tick()
end

local function reload()
    -- Check if already reloading or full ammo
    if isReloading or fireMode == "infinite" then
        return
    end
    
    isReloading = true
    
    wait(2) -- Customize reload time
    
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

-- Headshot detection
workspace.Bullet.Hit:Connect(function(hit)
    if hit.Parent:FindFirstChild("Head") then
        local player = game.Players:GetPlayerFromCharacter(hit.Parent)
        if player then
            -- Apply headshot damage multiplier
            local damageMultiplier = headshotMultiplier
            -- Calculate total damage
            local totalDamage = bulletDamage * damageMultiplier
            -- Apply damage to the player
            player:TakeDamage(totalDamage)
        end
    end
end)