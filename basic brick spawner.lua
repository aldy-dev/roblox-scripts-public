-- Script that spawns a brick at a random position
local function spawnBrick()
    local brick = Instance.new("Part")
    brick.Size = Vector3.new(4, 1, 2)
    brick.Position = Vector3.new(math.random(-50, 50), 10, math.random(-50, 50))
    brick.Anchored = true
    brick.Parent = game.Workspace
end

spawnBrick()
