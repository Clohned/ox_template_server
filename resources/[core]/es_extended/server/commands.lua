ExecuteCommand('add_principal group.admin group.user')
ExecuteCommand('add_principal group.superadmin group.admin')

ESX.RegisterCommand('setcoords', 'admin', function(xPlayer, args, showError)
	xPlayer.setCoords({x = args.x, y = args.y, z = args.z})
end, false, {help = _U('command_setcoords'), validate = true, arguments = {
	{name = 'x', help = _U('command_setcoords_x'), type = 'number'},
	{name = 'y', help = _U('command_setcoords_y'), type = 'number'},
	{name = 'z', help = _U('command_setcoords_z'), type = 'number'}
}})

ESX.RegisterCommand('setjob', 'admin', function(xPlayer, args, showError)
	if ESX.DoesJobExist(args.job, args.grade) then
		args.playerId.setJob(args.job, args.grade)
	else
		showError(_U('command_setjob_invalid'))
	end
end, true, {help = _U('command_setjob'), validate = true, arguments = {
	{name = 'playerId', help = _U('commandgeneric_playerid'), type = 'player'},
	{name = 'job', help = _U('command_setjob_job'), type = 'string'},
	{name = 'grade', help = _U('command_setjob_grade'), type = 'number'}
}})

ESX.RegisterCommand('car', 'admin', function(xPlayer, args, showError)
	local playerPed = GetPlayerPed(xPlayer.source)
	local vehicle = GetVehiclePedIsIn(playerPed)
	if vehicle then DeleteEntity(vehicle) end

	ESX.OneSync.SpawnVehicle(args.car or `baller2`, GetEntityCoords(playerPed), GetEntityHeading(playerPed), function(car)
		local timeout = 50
		repeat
			Wait(0)
			timeout -= 1
			SetPedIntoVehicle(playerPed, car, -1)
		until GetVehiclePedIsIn(playerPed, false) ~= 0 or timeout < 1
	end)

end, false, {help = _U('command_car'), validate = false, arguments = {
	{name = 'car', help = _U('command_car_car'), type = 'any'}
}})

ESX.RegisterCommand({'cardel', 'dv'}, 'admin', function(xPlayer, args, showError)
	local playerPed = GetPlayerPed(xPlayer.source)
	local vehicle = GetVehiclePedIsIn(playerPed)

	if vehicle ~= 0 then
		DeleteEntity(vehicle)
	else
		vehicle = ESX.OneSync.GetVehiclesInArea(GetEntityCoords(playerPed), tonumber(args.radius) or 3)
		for i = 1, #vehicle do
			DeleteEntity(vehicle[i].entity)
		end
	end
end, false, {help = _U('command_cardel'), validate = false, arguments = {
	{name = 'radius', help = _U('command_cardel_radius'), type = 'any'}
}})

ESX.RegisterCommand({'giveaccountmoney', 'givemoney'}, 'admin', function(xPlayer, args, showError)
	local getAccount = args.playerId.getAccount(args.account)
	if getAccount then
		args.playerId.addAccountMoney(args.account, args.amount)
	else
		showError('invalid account name')
	end
end, true, {help = 'give account money', validate = true, arguments = {
	{name = 'playerId', help = 'player id', type = 'player'},
	{name = 'account', help = 'valid account name', type = 'string'},
	{name = 'amount', help = 'amount to add', type = 'number'}
}})

ESX.RegisterCommand({'removeaccountmoney', 'removemoney'}, 'admin', function(xPlayer, args, showError)
	local getAccount = args.playerId.getAccount(args.account)
	if getAccount.money - args.amount < 0 then args.amount = getAccount.money end
	if getAccount then
		args.playerId.removeAccountMoney(args.account, args.amount)
	else
		showError('invalid account name')
	end
end, true, {help = 'remove account money', validate = true, arguments = {
	{name = 'playerId', help = 'player id', type = 'player'},
	{name = 'account', help = 'valid account name', type = 'string'},
	{name = 'amount', help = 'amount to remove', type = 'number'}
}})

ESX.RegisterCommand({'setaccountmoney', 'setmoney'}, 'admin', function(xPlayer, args, showError)
	local getAccount = args.playerId.getAccount(args.account)
	if getAccount then
		args.playerId.setAccountMoney(args.account, args.amount)
	else
		showError('invalid account name')
	end
end, true, {help = 'set account money', validate = true, arguments = {
	{name = 'playerId', help = 'player id', type = 'player'},
	{name = 'account', help = 'valid account name', type = 'string'},
	{name = 'amount', help = 'amount to set', type = 'number'}
}})

ESX.RegisterCommand({'clearall', 'clsall'}, 'admin', function(xPlayer, args, showError)
	TriggerClientEvent('chat:clear', -1)
end, false, {help = _U('command_clearall')})

ESX.RegisterCommand('setgroup', 'admin', function(xPlayer, args, showError)
	if not args.playerId then args.playerId = xPlayer.source end
	args.playerId.setGroup(args.group)
end, true, {help = _U('command_setgroup'), validate = true, arguments = {
	{name = 'playerId', help = _U('commandgeneric_playerid'), type = 'player'},
	{name = 'group', help = _U('command_setgroup_group'), type = 'string'},
}})

ESX.RegisterCommand('save', 'admin', function(xPlayer, args, showError)
	Core.SavePlayer(args.playerId)
end, true, {help = _U('command_save'), validate = true, arguments = {
	{name = 'playerId', help = _U('commandgeneric_playerid'), type = 'player'}
}})

ESX.RegisterCommand('saveall', 'admin', function(xPlayer, args, showError)
	Core.SavePlayers()
end, true, {help = _U('command_saveall')})

ESX.RegisterCommand('group', {'user', 'admin'}, function(xPlayer, args, showError)
	print(xPlayer.getName()..', You are currently: ^5'.. xPlayer.getGroup())
end, false)

ESX.RegisterCommand('job', {'user', 'admin'}, function(xPlayer, args, showError)
print(xPlayer.getName()..', You are currently: ^5'.. xPlayer.getJob().name.. '^0 - ^5'.. xPlayer.getJob().grade_label)
end, false)

ESX.RegisterCommand('info', {'user', 'admin'}, function(xPlayer, args, showError)
	local job = xPlayer.getJob().name
	local jobgrade = xPlayer.getJob().grade_name
	print('^2ID : ^5'..xPlayer.source..' ^0| ^2Name:^5'..xPlayer.getName()..' ^0 | ^2Group:^5'..xPlayer.getGroup()..'^0 | ^2Job:^5'.. job..'')
end, false)

ESX.RegisterCommand('coords', 'admin', function(xPlayer, args, showError)
	print(''.. xPlayer.getName().. ': ^5'.. xPlayer.getCoords(true))
end, false)

ESX.RegisterCommand('tpm', 'admin', function(xPlayer, args, showError)
	xPlayer.triggerEvent('esx:tpm')
end, false)

ESX.RegisterCommand('noclip', 'admin', function(xPlayer, args, showError)
	xPlayer.triggerEvent('esx:noclip')
end, false)

ESX.RegisterCommand('goto', 'admin', function(xPlayer, args, showError)
		local targetCoords = args.playerId.getCoords()
		xPlayer.setCoords(targetCoords)
end, false, {help = _U('goto'), validate = true, arguments = {
	{name = 'playerId', help = _U('commandgeneric_playerid'), type = 'player'}
}})

ESX.RegisterCommand('bring', 'admin', function(xPlayer, args, showError)
		local playerCoords = xPlayer.getCoords()
		args.playerId.setCoords(playerCoords)
end, false, {help = _U('bring'), validate = true, arguments = {
	{name = 'playerId', help = _U('commandgeneric_playerid'), type = 'player'}
}})

ESX.RegisterCommand('reviveall', 'admin', function(xPlayer, args, showError)
	for _, playerId in ipairs(ESX.GetPlayers()) do
		TriggerClientEvent('esx_ambulancejob:revive', playerId)
	end
end, true)

ESX.RegisterCommand('players', 'admin', function(xPlayer, args, showError)
	local xAll = ESX.GetPlayers()
	print('^5'..#xAll..' ^2online player(s)^0')
	for i=1, #xAll, 1 do
		local xPlayer = ESX.GetPlayerFromId(xAll[i])
		print('^1[ ^2ID : ^5'..xPlayer.source..' ^0| ^2Name : ^5'..xPlayer.getName()..' ^0 | ^2Group : ^5'..xPlayer.getGroup()..' ^0 | ^2Identifier : ^5'.. xPlayer.identifier ..'^1]^0\n')
	end
end, true)

ESX.RegisterCommand('loadjobs', 'admin', function()
	Core.LoadJobs()
end, true)

ESX.RegisterCommand('skin', 'admin', function(xPlayer, args, showError)
	local _source = xPlayer.source
	local target = tonumber(args[1])

	if target and xPlayer ~= nil then
		TriggerClientEvent('fivem-appearance:openSaveableMenu', target)
	else
		TriggerClientEvent('chatMessage', _source, "SYSTEM:", {255, 0, 0}, "Invalid arguments.")
		return
	end
end)

ESX.RegisterCommand('kick', 'admin', function(xPlayer, args, showError)
    if args.userId then
        if(tonumber(args.userId) and GetPlayerName(tonumber(args.userId)))then
            -- User permission check
            local reason = args.reason
            --table.remove(reason, 1)
            if(#reason == 0)then
                reason = "Kicked: You have been kicked from the server"
            else
                reason = "Kicked: " .. args.reason
            end


            TriggerClientEvent('chat:addMessage', -1, {
                template = '<div class="chat-message-server"><b>AdmCmd:</b> {0} was kicked by {1}, Reason: {2}</div>',
                args = { GetPlayerName(args.userId), GetPlayerName(xPlayer.source), reason }
            })
            DropPlayer(args.userId, reason)
        else
            TriggerClientEvent('chat:addMessage', xPlayer.source, { args = {"^1SYSTEM", "Incorrect player ID"}})
        end
    else
        TriggerClientEvent('chat:addMessage', xPlayer.source, { args = {"^1SYSTEM", "Incorrect player ID"}})
    end
end, false, {help = 'Kick player, reason must be in " "', validate = true, arguments = {
    {name = 'userId', help = 'The ID of the player', type = 'number'},
    {name = 'reason', help = 'The reason as to why you kick this player', type = 'string'}
}})

ESX.RegisterCommand('announce', "admin", function(xPlayer, args, showError)
    TriggerClientEvent('chat:addMessage', -1, {
    template = '<div class="chat-message-server"><b>Government Announcement:</b> {0}</div>',
    args = { table.concat(args, " ") }
    })
end)


ESX.RegisterServerCallback('esx:admincommand', function(source, cb)
	if Core.IsPlayerAdmin(source) then
		return cb(true)
	end

	cb(false)
end)
