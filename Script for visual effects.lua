-- Local Script (StarterPlayerScripts or StarterCharacterScripts)

-- Define constants
local SMOKE_EFFECT_ID = "rbxassetid://YOUR_SMOKE_EFFECT_ID" -- Replace with the actual ParticleEmitter ID for smoke effect
local BULLET_TRAIL_COLOR = Color3.new(1, 1, 1) -- Adjust bullet trail color as needed
local BULLET_IMPACT_DECAL_ID = "rbxassetid://YOUR_BULLET_IMPACT_DECAL_ID" -- Replace with the actual Decal ID for bullet impact

-- Get the gun object from the player's character
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local gun = character:WaitForChild("Gun") -- Replace "Gun" with the actual name of your gun model

-- Function to create smoke effect when shooting
local function createSmokeEffect()
    local smoke = Instance.new("ParticleEmitter")
    smoke.Parent = gun
    smoke.Enabled = true
    smoke.Texture = SMOKE_EFFECT_ID
    smoke.Size = NumberSequence.new(2) -- Adjust smoke size
    smoke.Color = ColorSequence.new(Color3.new(0.5, 0.5, 0.5)) -- Adjust smoke color
    smoke.Lifetime = NumberRange.new(1, 2) -- Adjust smoke lifetime
    smoke.Rate = 50 -- Adjust smoke emission rate
    smoke.Speed = NumberRange.new(5, 10) -- Adjust smoke speed
    smoke.Acceleration = Vector3.new(0, -10, 0) -- Adjust smoke acceleration
end

-- Function to create bullet impact effect
local function createBulletImpact(position, normal)
    local bulletImpactDecal = Instance.new("Decal")
    bulletImpactDecal.Texture = BULLET_IMPACT_DECAL_ID
    bulletImpactDecal.Face = normal
    bulletImpactDecal.Parent = workspace
    bulletImpactDecal.Position = position
    bulletImpactDecal.Size = Vector3.new(2, 2, 2) -- Adjust impact decal size
    bulletImpactDecal.Transparency = 0.5 -- Adjust impact decal transparency
    bulletImpactDecal.Visible = true
end

-- Function to handle shooting event
local function onShoot()
    -- Add shooting logic here (e.g., spawn projectile)
    
    -- Create smoke effect when shooting
    createSmokeEffect()
end

-- Connect shooting function to an event (e.g., player input)
-- Example: gun.MouseButton1Down:Connect(onShoot)

-- Connect bullet impact function to bullet collision event
-- Example: bullet.Touched:Connect(function(hit)
--              createBulletImpact(hit.Position, hit.Normal)
--          end)