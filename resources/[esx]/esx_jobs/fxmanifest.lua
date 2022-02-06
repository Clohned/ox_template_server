fx_version 'adamant'

game 'gta5'

description 'ESX Jobs'

version 'legacy'

shared_script '@es_extended/imports.lua'

server_scripts {
	'@es_extended/locale.lua',
	'locales/br.lua',
	'locales/en.lua',
	'locales/es.lua',
	'locales/fi.lua',
	'locales/fr.lua',
	'locales/sv.lua',
	'locales/cs.lua',
	'locales/de.lua',
	'config.lua',

	'server/main.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/br.lua',
	'locales/fi.lua',
	'locales/en.lua',
	'locales/es.lua',
	'locales/fr.lua',
	'locales/sv.lua',
	'locales/cs.lua',
	'config.lua',

	'client/main.lua'
}

dependencies {
	'es_extended',
	'esx_addonaccount'
}
