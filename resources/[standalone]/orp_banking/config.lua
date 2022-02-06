Config = {}

Config.ATMProps = {
	`prop_atm_01`,
	`prop_atm_02`,
	`prop_atm_03`,
	`prop_fleeca_atm`,
	`v_5_b_atm1`,
	`v_5_b_atm2`
}

Config.BankZones = {
	{ vec3(149.24, -1040.58, 29.36), 160.0 },		-- Legion Square
	{ vec3(-1213.25, -331.12, 37.77), 207.0 },		-- Del Perro
	{ vec3(-351.6, -49.77, 49.03), 160.0 },			-- Burton
	{ vec3(313.58, -278.94, 54.17), 160.0 },		-- Hawick
	{ vec3(-2962.52, 482.24, 15.7), 268.0 },		-- Highway
	{ vec3(1175.71, 2706.87, 38.09), 0.0 },			-- Sandy Shores
	{ vec3(-112.02, 6469.17, 31.62), 315.0 },		-- Paleto Bay
}

SendNotify = function(msg, type)

	--TriggerEvent('mythic_notify:client:SendAlert', {					-- https://github.com/antond15/mythic_notify
	--	type = type,
	--	text = msg,
	--	length = 7500
	--})
	TriggerEvent('t-notify:client:Alert', { style = type, message = msg })                            
	-- TriggerEvent('esx:showNotification', msg)						-- Default GTA V notification.
	-- TriggerEvent('b1g_notify:client:Notify', { type = type, text = msg })		-- https://github.com/CarlosVergikosk/B1G_NOTIFY

end
