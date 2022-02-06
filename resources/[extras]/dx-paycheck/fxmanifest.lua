fx_version 'adamant'
game 'common'

server_scripts {
    'config.lua',
    'server/main.lua',
    '@oxmysql/lib/MySQL.lua'
}

client_scripts {
    'config.lua',
    'client/main.lua'
}