--[[ FX Information ]]--
fx_version   'adamant'
game         'gta5'

--[[ Resource Information ]]--
name         'NORP QOL'
author       'Judd#7644'
version      '1.0.0'
description  'Various Quality of Life Stuff'

--[[ Manifest ]]--
dependencies {
	'es_extended',
}

shared_scripts {
	'shared/*.lua',
}

client_scripts {
	'client/*.lua'
}

server_scripts {
	'server/*.lua'
}

--[[ Weapon Metas ]]--

files {
	'data/weapons/*.meta'
}

data_file 'WEAPONINFO_FILE' 'weapons_custom.meta'
data_file 'WEAPONINFO_FILE_PATCH' 'weapons_custom.meta'
data_file 'WEAPONINFO_FILE' 'weapons_vanilla.meta'
data_file 'WEAPONINFO_FILE_PATCH' 'weapons_vanilla.meta'
data_file 'WEAPONINFO_FILE' 'weapons_pistol_mk2.meta'
data_file 'WEAPONINFO_FILE_PATCH' 'weapons_pistol_mk2.meta'
data_file 'WEAPONINFO_FILE' 'weaponheavypistol.meta'
data_file 'WEAPONINFO_FILE_PATCH' 'weaponheavypistol.meta'
data_file 'WEAPONINFO_FILE' 'weapons_snspistol_mk2.meta'
data_file 'WEAPONINFO_FILE_PATCH' 'weapons_snspistol_mk2.meta'
data_file 'WEAPONCOMPONENTSINFO_FILE' 'weaponcomponents.meta'
data_file 'WEAPONINFO_FILE' 'weapons_pumpshotgun_mk2.meta'
data_file 'WEAPONINFO_FILE_PATCH' 'weapons_pumpshotgun_mk2.meta'
data_file 'WEAPONINFO_FILE' 'weapondbshotgun.meta'
data_file 'WEAPONINFO_FILE_PATCH' 'weapondbshotgun.meta'