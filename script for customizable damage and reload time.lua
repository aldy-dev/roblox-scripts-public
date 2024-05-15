-- Local Script (StarterGui or ScreenGui)

-- Define constants
local MAX_DAMAGE = 100  -- Maximum allowed damage
local MAX_RELOAD_TIME = 5  -- Maximum allowed reload time (in seconds)

-- Get references to UI elements
local damageSlider = script.Parent:WaitForChild("DamageSlider")  -- Replace with the actual name of your damage slider UI element
local reloadTimeSlider = script.Parent:WaitForChild("ReloadTimeSlider")  -- Replace with the actual name of your reload time slider UI element
local applyButton = script.Parent:WaitForChild("ApplyButton")  -- Replace with the actual name of your apply button UI element

-- Function to apply changes to gun parameters
local function applyChanges()
    local newDamage = damageSlider.Value
    local newReloadTime = reloadTimeSlider.Value
    
    -- Validate input values
    newDamage = math.clamp(newDamage, 0, MAX_DAMAGE)
    newReloadTime = math.clamp(newReloadTime, 0, MAX_RELOAD_TIME)
    
    -- Update gun parameters (you would need to implement this part)
    -- Example: gun.Damage = newDamage
    -- Example: gun.ReloadTime = newReloadTime
end

-- Connect applyChanges function to apply button click event
applyButton.MouseButton1Click:Connect(applyChanges)