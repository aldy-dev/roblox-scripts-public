local lighting = game:GetService("Lighting")

while true do
    for i = 0, 24, 1 do
        lighting:SetMinutesAfterMidnight(i * 60)
        wait(1)
    end
end
