local paycheckdata
ESX = nil



Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
    ESXLoaded = true
end)

Citizen.CreateThread(function()
	local PedsTarget = {}
	for k,v in pairs (Config.NPCS) do
		PedsTarget = {v.model}
	end
	exports[Config.Target]:AddTargetModel(PedsTarget, {
		options = {
			{
				event = "dx-paycheck:Menu",
				icon = "fas fa-car",
				label = "Collect salary",
			},

		},
		job = {"all"},
		distance = 3.5
	})
end)




Citizen.CreateThread(function()
	Citizen.Wait(100)
	for k,v in pairs (Config.NPCS) do
		while not ESXLoaded do Wait(0) end
		if DoesEntityExist(ped) then
			DeletePed(ped)
		end
		Wait(250)
		ped = CreatingPed(v.model, v.coords, v.heading, v.animDict, v.animName)
	end
end)


function CreatingPed(hash, coords, heading, animDict, animName)
    RequestModel(GetHashKey(hash))
    while not HasModelLoaded(GetHashKey(hash)) do
        Wait(5)
    end

    local ped = CreatePed(5, hash, coords, false, false)
    SetEntityHeading(ped, heading)
    SetEntityAsMissionEntity(ped, true, true)
    SetPedHearingRange(ped, 0.0)
    SetPedSeeingRange(ped, 0.0)
    SetPedAlertness(ped, 0.0)
    SetPedFleeAttributes(ped, 0, 0)
	FreezeEntityPosition(ped, true)
	SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetPedCombatAttributes(ped, 46, true)
    SetPedFleeAttributes(ped, 0, 0)
	while not TaskPlayAnim(ped, animDict, animName, 8.0, 1.0, -1, 17, 0, 0, 0, 0) do
		Wait(1000)
	end
    return ped
end


RegisterNetEvent('dx-paycheck:Menu')
AddEventHandler('dx-paycheck:Menu',function()
	OpenPaycheckMenu()
end)


function OpenPaycheckMenu()
	local elements = {}
	ESX.TriggerServerCallback('dx-paycheck:server:GetDataMoney', function(count)
		paycheckdata = json.decode(count)
		table.insert(elements,{label = '&nbsp;&nbsp;<span style="color:#13ea13 ;"> You have ' ..paycheckdata..'$ to collect</span>'})
		table.insert(elements,{label = 'Withdraw All', value = 'withdraw_all'})
		if Config.WithdrawQuantity then
			table.insert(elements, {label = 'Withdraw an amount', value = 'withdraw_quantity'})
		end
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'paycheck_actions', {
					title    = 'City Hall',
					align    = 'center-right',
					elements = elements
				}, function(data, menu)
						if data.current.value == 'withdraw_all' then
							menu.close()
							exports.rprogress:Custom({
								Duration = 5000,
								Label = "Cashing out...",
								Animation = {
									scenario = "WORLD_HUMAN_CLIPBOARD",
									animationDictionary = "idle_a",
								},
								DisableControls = {
									Mouse = false,
									Player = true,
									Vehicle = true
								}
							})
							Citizen.Wait(5000)
							TriggerServerEvent('dx-paycheck:Payout')
						elseif data.current.value == 'withdraw_quantity'then
							ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'withdraw_quantity_count', {
								title = 'Quantity'
							}, function(data2, menu2)
								local count = tonumber(data2.value)

								if count == nil then
									ESX.ShowNotification('Invalid Quantity')
								else
									menu2.close()
									menu.close()
									exports.rprogress:Custom({
										Duration = 5000,
										Label = "Cashing out...",
										Animation = {
											scenario = "WORLD_HUMAN_CLIPBOARD",
											animationDictionary = "idle_a",
										},
										DisableControls = {
											Mouse = false,
											Player = true,
											Vehicle = true
										}
									})
									Citizen.Wait(5000)
									TriggerServerEvent('dx-paycheck:withdrawMoney', count)
								end
							end)
						elseif data.current.value == 'Salir' then
							menu.close()
						end
		end, function(data, menu)
			menu.close()
		end)
	end)
end
