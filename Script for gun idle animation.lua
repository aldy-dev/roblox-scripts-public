-- Local Script (StarterPlayerScripts or StarterCharacterScripts)

-- Define constants
local GUN_IDLE_ANIMATION_ID = "rbxassetid://YOUR_GUN_IDLE_ANIMATION_ID" -- Replace with the actual Animation ID
local ANIMATION_SPEED = 1 -- Adjust animation speed as needed

-- Get the gun object from the player's character
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local gun = character:WaitForChild("Gun") -- Replace "Gun" with the actual name of your gun model

-- Load the idle animation
local animation = Instance.new("Animation")
animation.AnimationId = GUN_IDLE_ANIMATION_ID
local animationTrack = game:GetService("AnimationTrack")
local idleAnimation = animationTrack:LoadAnimation(animation)

-- Play the idle animation loop
idleAnimation:Play()
idleAnimation.Looped = true
idleAnimation.Priority = Enum.AnimationPriority.Idle

-- Adjust animation speed
idleAnimation:AdjustSpeed(ANIMATION_SPEED)

-- Clean up animation when the gun is removed or the player leaves the game
gun.AncestryChanged:Connect(function()
    if not gun:IsDescendantOf(game) then
        idleAnimation:Stop()
        idleAnimation:Destroy()
    end
end)