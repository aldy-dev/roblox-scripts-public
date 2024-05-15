local function calculateDistance(part1, part2)
    return (part1.Position - part2.Position).Magnitude
end

local maxKillRange = 12 -- Maximum distance in studs

local function canPlayerKill(player1, player2)
    local character1 = player1.Character
    local character2 = player2.Character

    if character1 and character2 then
        local humanoid1 = character1:FindFirstChildOfClass("Humanoid")
        local humanoid2 = character2:FindFirstChildOfClass("Humanoid")

        if humanoid1 and humanoid2 then
            local distance = calculateDistance(character1.PrimaryPart, character2.PrimaryPart)
            if distance <= maxKillRange then
                return true
            end
        end
    end

    return false
end

-- Example usage:
local player1 = game.Players["Player1"]
local player2 = game.Players["Player2"]

if canPlayerKill(player1, player2) then
    -- Allow player1 to kill player2
    -- Add your kill logic here
else
    -- Don't allow the kill
end