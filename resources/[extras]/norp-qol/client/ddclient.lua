Citizen.CreateThread(function()
	while true do
		Wait(0)
		for i = 1, 12 do
			EnableDispatchService(i, false)
		end
		SetPlayerWantedLevel(PlayerId(), 0, false)
		SetPlayerWantedLevelNow(PlayerId(), false)
		SetPlayerWantedLevelNoDrop(PlayerId(), 0, false)
	end
end)

Citizen.CreateThread(function()
        SetMaxWantedLevel(0) -- Never wanted
        SetCreateRandomCops(0) -- Don't create cops
        SetCreateRandomCopsNotOnScenarios(0) -- Don't create cops 2
        SetCreateRandomCopsOnScenarios(0) -- Don't create cops 3
	while true do
		Citizen.Wait(1000)
		local ped = PlayerPedId()
		local pos = GetEntityCoords(ped)
		ClearAreaOfCops(pos.x, pos.y, pos.z, 400.0) -- remove everting related to cops at 400 of the pos
	end
end)

function SetWeaponDrops()
	local handle, ped = FindFirstPed()
	local finished = false

	repeat
		if not IsEntityDead(ped) then
			SetPedDropsWeaponsWhenDead(ped, false)
		end
		finished, ped = FindNextPed(handle)
	until not finished

	EndFindPed(handle)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		SetWeaponDrops()
	end
end)