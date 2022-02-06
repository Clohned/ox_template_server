Citizen.CreateThread(function()
    while true do
		Citizen.Wait(1)
		if IsPedOnFoot(PlayerPedId()) then 
			SetRadarZoom(1100)
		elseif IsPedInAnyVehicle(PlayerPedId(), true) then
			SetRadarZoom(1100)
		end
    end
end)