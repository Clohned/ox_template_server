Config = {}
Config.ReceiveInCash = true -- If its in true, you'll recieve it on cash (wallet), false it will become on bank.
Config.UseEsExtendedType = true -- IF true, enable the trigger so you can place it in your es_extended, false it will disable it
Config.WithdrawQuantity = true
Config.Timeout = 5000 -- Timeout for the citizen, briefly, 5 secs.
Config.Target = 'qtarget' -- Config your exports target (bt-target or qtarget)
Config.NPCS =  {
    {
        model = "cs_bankman",
        coords = vector3(240.59313720703,224.91667541504,105.299646453857),
        heading = 196.4,
        animDict = "amb@world_human_cop_idles@male@idle_b",
        animName = "idle_e"
    },
    -- {
    --      model = "cs_bankman", -- https://wiki.rage.mp/index.php?title=Peds
    --      coords = vector3(0,0,0),  -- coords
    --      heading = 0.0 -- heading
    --      animDict = "", -- https://pastebin.com/6mrYTdQv
    --      animName = "" -- https://alexguirre.github.io/animations-list/
    -- }
}

Config.Blips = {
    --{title="Cityhall", colour=5, id=525, x = 230.24126708984, y = 214.71524902344, z = 105.559673156738},
}

--	Your Notification System
--RegisterNetEvent('dx-paycheck:notification')
--AddEventHandler('dx-paycheck:notification', function(msg,type)
--	Types used: (error | success)
	--exports['mythic_notify']:DoHudText(type,msg)
    --exports['notify1']:Alert("Bank Account<b style='font-size:12px; color: #a8a5a5; font-weight: 400;word-spacing: 5px;'> ▪ NOW</b>", msg, 5000, type)
    --ESX.ShowNotification = function(msg, type)
        --if type == nil then type = 'long' end
        --exports['notify1']:Alert("INFORMATION", msg, 5000, type)
    --end
    -- ESX.ShowNotification(msg)
   --[[ exports.brinnNotify:SendNotification({
        text = '<b><i class="fas fa-bell"></i> NOTIFICACIÓN</span></b></br><span style="color: #a9a29f;">'..msg..'',
        type = type,
        timeout = 3000,
        layout = "centerRight"
    }) ]]
--end)
