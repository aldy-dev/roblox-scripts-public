local function attackPlayer(player)
    if debounce then return end
    debounce = true

    local character = player.Character
    if character and character:FindFirstChild("Humanoid") then
        humanoid:MoveTo(character.HumanoidRootPart.Position)
        
        humanoid.MoveToFinished:Wait()

        if (character.HumanoidRootPart.Position - rootPart.Position).magnitude <= 5 then -- Adjust range for attack
            character.Humanoid:TakeDamage(10)
        end

    end

    wait(attackCooldown)
    debounce = false
end

local function onHeartbeat()
    local closestPlayer = getClosestPlayer()

    if closestPlayer then
        local playerCharacter = closestPlayer.Character
        local distance = (playerCharacter.HumanoidRootPart.Position - rootPart.Position).magnitude

        if distance <= attackRange then
            attackPlayer(closestPlayer)
        else
        end
    end
end
