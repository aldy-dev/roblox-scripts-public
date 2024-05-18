local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")

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
