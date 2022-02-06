
Citizen.CreateThread(function()
    while true do 
    	Citizen.Wait(1)
    	-- Hides dumb shit
        HideHudComponentThisFrame(6, true)
        HideHudComponentThisFrame(7, true)
        HideHudComponentThisFrame(8, true)
        HideHudComponentThisFrame(9, true)
    end
end)