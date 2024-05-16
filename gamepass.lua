--[[
step 1: create a gamepass
go to the roblox website.
navigate to the "create" tab.
Select the game you want to create a gamepass for.
click on the "create game pass" button.
upload an image, name your gamepass, and give it a description.
set a price for the gamepass.
step 2: get the gamePass ID
After creating the gamepass, you'll get a gamepass ID. you need this ID for your script.

step 3: set up the gamepass script
You need to create a script that checks if a player owns the gamepass. heres how you can do it:

server-side script:
This script will be placed in ServerScriptService.

create a new script in ServerScriptService.
Add the following code:
]]

-- services
local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")

-- your gamepass ID
local gamePassID = 12345678 -- replace with your actual gamepass ID

-- function to check if a player owns the gamePass
local function hasGamePass(player)
    local success, result = pcall(function()
        return MarketplaceService:UserOwnsGamePassAsync(player.UserId, gamePassID)
    end)
    if success then
        return result
    else
        warn("Error checking GamePass ownership for player:", player.Name)
        return false
    end
end

-- handle player added
local function onPlayerAdded(player)
    if hasGamePass(player) then
        -- grant the player the gamepass benefits
        -- example: Give the player a special tool or access to an area
        local specialTool = game.ServerStorage:FindFirstChild("SpecialTool"):Clone()
        specialTool.Parent = player.Backpack
    end
end

-- connect the player added event
Players.PlayerAdded:Connect(onPlayerAdded)

-- check existing players in case the script is added while players are already in the game
for _, player in ipairs(Players:GetPlayers()) do
    onPlayerAdded(player)
end

--[[
step 4: adding benefits
in the script above, replace the example benefit (giving a special tool) with whatever benefit you want to provide
to the player who owns the gamepass. for example, you might want to give them access to a special area or a unique ability.
step 5: testing
test your game in roblox studio.
make sure the gamePass benefits are correctly applied to players who own the gamepass.
]]
