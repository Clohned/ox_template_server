CreateThread(function()
    while true do
        if ESX.PlayerLoaded then
            local ped = PlayerPedId()
            local playerId = PlayerId()

            local underwaterTime = GetPlayerUnderwaterTimeRemaining(playerId) * 10
            local voiceConnected = MumbleIsConnected()
            local voiceTalking = NetworkIsPlayerTalking(playerId)
            local isDriving = IsPedInAnyVehicle(ped, true)
            local speed, maxspeed, fuel = 0, 0, 0
            
            if isDriving then
                local veh = GetVehiclePedIsUsing(ped, false)
                local speedMultiplier = dx.metricSystem and 3.6 or 2.236936

                speed = math.floor(GetEntitySpeed(veh) * speedMultiplier)
                maxspeed = GetVehicleModelMaxSpeed(GetEntityModel(veh)) * speedMultiplier
                if dx.showFuel then fuel = GetVehicleFuelLevel(veh) end
            end

            SendNUIMessage({ 
                action = "general",
                hp = GetEntityHealth(ped) - 100,
                armour = GetPedArmour(ped),
                oxygen = IsPedSwimmingUnderWater(ped) and underwaterTime >= 0 and underwaterTime or 100,
                showSpeedo = isDriving,
                showFuel = dx.showFuel and isDriving,
                speed = speed,
                maxspeed = maxspeed,
                fuel = fuel,
                voiceConnected = voiceConnected,
                voiceTalking = voiceTalking,
            })

            DisplayRadar(dx.persistentRadar or isDriving)
            SetRadarZoom(1150)
            SendNUIMessage({showUi = not IsPauseMenuActive()})
        else
            SendNUIMessage({showUi = false})
        end

        Wait(dx.generalRefreshRate)
    end
end)

CreateThread(function()
    while true do
        if ESX.PlayerLoaded then
            local ped = PlayerPedId()
            local playerId = PlayerId()

            local hunger, thirst, stress
            TriggerEvent('esx_status:getStatus', 'hunger', function(status) hunger = status.val / 10000 end)
            TriggerEvent('esx_status:getStatus', 'thirst', function(status) thirst = status.val / 10000 end)
            if dx.showStress then
            TriggerEvent('esx_status:getStatus', 'stress', function(status) stress = status.val / 10000 end)
            end
            
            Wait(100)
            SendNUIMessage({
                action = "status",
                hunger = hunger,
                thirst = thirst,
                stress = dx.showStress and stress,
            })
        end

        Wait(dx.statusRefreshRate)
    end
end)

AddEventHandler('pma-voice:setTalkingMode', function(mode)
    SendNUIMessage({action = "voice_range", voiceRange = mode})
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
 	ESX.PlayerLoaded = true
end)

RegisterNetEvent('esx:onPlayerLogout')
AddEventHandler('esx:onPlayerLogout', function()
	ESX.PlayerLoaded = false
end)
