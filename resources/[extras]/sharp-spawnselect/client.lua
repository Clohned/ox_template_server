local ESX, selectedspawnposition = nil
local spawn = nil
local LastLocation = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj)
			ESX = obj
        end)
        
		Citizen.Wait(0)
	end
end)

local camZPlus1 = 1500
local camZPlus2 = 50
local pointCamCoords = 75
local pointCamCoords2 = 0
local cam1Time = 500
local cam2Time = 1000


RegisterNUICallback("SpawnPlayer", function()
	if selectedspawnposition ~= nil then
		SpawnPlayer(selectedspawnposition)
	else
        TriggerEvent('spawnselector:setNui')
		print("You need to select a spawn point!")
	end
end)

RegisterNUICallback("LastLocation", function()
    selectedspawnposition = LastLocation
    local playerPed = PlayerPedId()
    local campos = selectedspawnposition

    cam2 = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", campos.x, campos.y, campos.z + camZPlus1, 300.00,0.00,0.00, 110.00, false, 0)
    PointCamAtCoord(cam2, campos.x, campos.y, campos.z + pointCamCoords)
    SetCamActiveWithInterp(cam2, cam, cam1Time, true, true)
    if DoesCamExist(cam) then
        DestroyCam(cam, true)
    end
    Citizen.Wait(cam1Time)

    cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", campos.x, campos.y, campos.z + camZPlus2, 300.00,0.00,0.00, 110.00, false, 0)
    PointCamAtCoord(cam, campos.x, campos.y, campos.z + pointCamCoords2)
    SetCamActiveWithInterp(cam, cam2, cam2Time, true, true)
    SetEntityCoords(GetPlayerPed(-1), campos.x, campos.y, campos.z)
end)

RegisterNUICallback("SpawnTorget", function()
    selectedspawnposition = {x = 216.32, y = -814.36, z = 30.64, h = 163.4 }
    local playerPed = PlayerPedId()
    local campos = selectedspawnposition

    cam2 = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", campos.x, campos.y, campos.z + camZPlus1, 300.00,0.00,0.00, 110.00, false, 0)
    PointCamAtCoord(cam2, campos.x, campos.y, campos.z + pointCamCoords)
    SetCamActiveWithInterp(cam2, cam, cam1Time, true, true)
    if DoesCamExist(cam) then
        DestroyCam(cam, true)
    end
    Citizen.Wait(cam1Time)

    cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", campos.x, campos.y, campos.z + camZPlus2, 300.00,0.00,0.00, 110.00, false, 0)
    PointCamAtCoord(cam, campos.x, campos.y, campos.z + pointCamCoords2)
    SetCamActiveWithInterp(cam, cam2, cam2Time, true, true)
    SetEntityCoords(GetPlayerPed(-1), campos.x, campos.y, campos.z)
end)

RegisterNUICallback("SpawnMRPD", function()
    selectedspawnposition = {x = 413.32, y = -965.08, z = 29.48, h = 227.87 }
    local playerPed = PlayerPedId()
    local campos = selectedspawnposition

    cam2 = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", campos.x, campos.y, campos.z + camZPlus1, 300.00,0.00,0.00, 110.00, false, 0)
    PointCamAtCoord(cam2, campos.x, campos.y, campos.z + pointCamCoords)
    SetCamActiveWithInterp(cam2, cam, cam1Time, true, true)
    if DoesCamExist(cam) then
        DestroyCam(cam, true)
    end
    Citizen.Wait(cam1Time)

    cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", campos.x, campos.y, campos.z + camZPlus2, 300.00,0.00,0.00, 110.00, false, 0)
    PointCamAtCoord(cam, campos.x, campos.y, campos.z + pointCamCoords2)
    SetCamActiveWithInterp(cam, cam2, cam2Time, true, true)
    SetEntityCoords(GetPlayerPed(-1), campos.x, campos.y, campos.z)
end)

RegisterNUICallback("SpawnPink", function()
    selectedspawnposition = {x = 329.76, y = -200.68, z = 54.24, h = 159.87 }
    local playerPed = PlayerPedId()
    local campos = selectedspawnposition

    cam2 = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", campos.x, campos.y, campos.z + camZPlus1, 300.00,0.00,0.00, 110.00, false, 0)
    PointCamAtCoord(cam2, campos.x, campos.y, campos.z + pointCamCoords)
    SetCamActiveWithInterp(cam2, cam, cam1Time, true, true)
    if DoesCamExist(cam) then
        DestroyCam(cam, true)
    end
    Citizen.Wait(cam1Time)

    cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", campos.x, campos.y, campos.z + camZPlus2, 300.00,0.00,0.00, 110.00, false, 0)
    PointCamAtCoord(cam, campos.x, campos.y, campos.z + pointCamCoords2)
    SetCamActiveWithInterp(cam, cam2, cam2Time, true, true)
    SetEntityCoords(GetPlayerPed(-1), campos.x, campos.y, campos.z)
end)

RegisterNUICallback("SpawnTrondheim", function()
    selectedspawnposition = {x = 1906.84, y = 3742.2, z = 32.64, h = 26.87 }
    local playerPed = PlayerPedId()
    local campos = selectedspawnposition

    cam2 = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", campos.x, campos.y, campos.z + camZPlus1, 300.00,0.00,0.00, 110.00, false, 0)
    PointCamAtCoord(cam2, campos.x, campos.y, campos.z + pointCamCoords)
    SetCamActiveWithInterp(cam2, cam, cam1Time, true, true)
    if DoesCamExist(cam) then
        DestroyCam(cam, true)
    end
    Citizen.Wait(cam1Time)

    cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", campos.x, campos.y, campos.z + camZPlus2, 300.00,0.00,0.00, 110.00, false, 0)
    PointCamAtCoord(cam, campos.x, campos.y, campos.z + pointCamCoords2)
    SetCamActiveWithInterp(cam, cam2, cam2Time, true, true)
    SetEntityCoords(GetPlayerPed(-1), campos.x, campos.y, campos.z)
end)

RegisterNUICallback("SpawnTromso", function()
    selectedspawnposition = {x = 134.48, y = 6640.44, z = 31.76, h = 227.36 }
    local playerPed = PlayerPedId()
    local campos = selectedspawnposition

    cam2 = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", campos.x, campos.y, campos.z + camZPlus1, 300.00,0.00,0.00, 110.00, false, 0)
    PointCamAtCoord(cam2, campos.x, campos.y, campos.z + pointCamCoords)
    SetCamActiveWithInterp(cam2, cam, cam1Time, true, true)
    if DoesCamExist(cam) then
        DestroyCam(cam, true)
    end
    Citizen.Wait(cam1Time)

    cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", campos.x, campos.y, campos.z + camZPlus2, 300.00,0.00,0.00, 110.00, false, 0)
    PointCamAtCoord(cam, campos.x, campos.y, campos.z + pointCamCoords2)
    SetCamActiveWithInterp(cam, cam2, cam2Time, true, true)
    SetEntityCoords(GetPlayerPed(-1), campos.x, campos.y, campos.z)
end)

RegisterNUICallback("SpawnStrandmotel", function()
    selectedspawnposition = {x = -1477.68, y = -677.76, z = 29.04, h = 227.36 }
    local playerPed = PlayerPedId()
    local campos = selectedspawnposition

    cam2 = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", campos.x, campos.y, campos.z + camZPlus1, 300.00,0.00,0.00, 110.00, false, 0)
    PointCamAtCoord(cam2, campos.x, campos.y, campos.z + pointCamCoords)
    SetCamActiveWithInterp(cam2, cam, cam1Time, true, true)
    if DoesCamExist(cam) then
        DestroyCam(cam, true)
    end
    Citizen.Wait(cam1Time)

    cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", campos.x, campos.y, campos.z + camZPlus2, 300.00,0.00,0.00, 110.00, false, 0)
    PointCamAtCoord(cam, campos.x, campos.y, campos.z + pointCamCoords2)
    SetCamActiveWithInterp(cam, cam2, cam2Time, true, true)
    SetEntityCoords(GetPlayerPed(-1), campos.x, campos.y, campos.z)
end)

RegisterNUICallback("SpawnGardermoen", function()
    selectedspawnposition = {x = -1016.48, y = -2704.44, z = 13.76, h = 227.36 }
    local playerPed = PlayerPedId()
    local campos = selectedspawnposition

    cam2 = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", campos.x, campos.y, campos.z + camZPlus1, 300.00,0.00,0.00, 110.00, false, 0)
    PointCamAtCoord(cam2, campos.x, campos.y, campos.z + pointCamCoords)
    SetCamActiveWithInterp(cam2, cam, cam1Time, true, true)
    if DoesCamExist(cam) then
        DestroyCam(cam, true)
    end
    Citizen.Wait(cam1Time)

    cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", campos.x, campos.y, campos.z + camZPlus2, 300.00,0.00,0.00, 110.00, false, 0)
    PointCamAtCoord(cam, campos.x, campos.y, campos.z + pointCamCoords2)
    SetCamActiveWithInterp(cam, cam2, cam2Time, true, true)
    SetEntityCoords(GetPlayerPed(-1), campos.x, campos.y, campos.z)
end)

local cloudOpacity = 0.01
local muteSound = true

function ToggleSound(state)
    if state then
        StartAudioScene("MP_LEADERBOARD_SCENE");
    else
        StopAudioScene("MP_LEADERBOARD_SCENE");
    end
end

function ClearScreen()
    SetCloudHatOpacity(cloudOpacity)
    HideHudAndRadarThisFrame()
    SetDrawOrigin(0.0, 0.0, 0.0, 0)
end


function InitialSetup()
    ToggleSound(muteSound)
    SwitchOutPlayer(PlayerPedId(), 0, 1)
end

function SpawnPlayer(Location)
    local pos = Location
    local ped = PlayerPedId()
    
    SetNuiFocus(false, false)

    InitialSetup()
    Citizen.Wait(500)
    SetEntityCoords(ped, pos.x, pos.y, pos.z)
    Citizen.Wait(500)
    SetEntityCoords(ped, pos.x, pos.y, pos.z)
    SetEntityHeading(ped, pos.h)
    FreezeEntityPosition(ped, false)
    RenderScriptCams(false, true, 500, true, true)
    SetCamActive(cam, false)
    DestroyCam(cam, true)
    SetCamActive(cam2, false)
    DestroyCam(cam2, true)
    SetEntityVisible(GetPlayerPed(-1), true)
    Citizen.Wait(500)
    SetNuiFocus(false, false)

    ShutdownLoadingScreen()
    
    ClearScreen()
    Citizen.Wait(0)
    DoScreenFadeOut(0)

    ShutdownLoadingScreenNui()
    
    ClearScreen()
    Citizen.Wait(0)
    ClearScreen()
    DoScreenFadeIn(500)
    while not IsScreenFadedIn() do
        Citizen.Wait(0)
        ClearScreen()
    end
    
    local timer = GetGameTimer()

    while true do
        ClearScreen()
        Citizen.Wait(0)
        
        if GetGameTimer() - timer > 500 then
            
            ToggleSound(false)
            SwitchInPlayer(PlayerPedId())
            ClearScreen()
            while GetPlayerSwitchState() ~= 12 do
                Citizen.Wait(0)
                ClearScreen()
            end

            break
        end
    end
    
    ClearDrawOrigin()
end


RegisterNetEvent("spawnselector:setNui")
AddEventHandler("spawnselector:setNui", function(spawn)
    LastLocation = spawn or { x = 0, y = 0, z = 0 }
    SetNuiFocus(true, true)

    cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", spawn.x, spawn.y, spawn.z + camZPlus1, -85.00, 0.00, 0.00, 100.00, false, 0)
    SetCamActive(cam, true)
    RenderScriptCams(true, false, 1, true, true)

	SendNUIMessage({ Action = "OPEN_SPAWNMENU" })
end)

RegisterNetEvent("spawnselector:closeNui")
AddEventHandler("spawnselector:closeNui", function()
    SetNuiFocus(false, false)
    SendNUIMessage({ Action = "CLOSE_MENU" })
    
end)
