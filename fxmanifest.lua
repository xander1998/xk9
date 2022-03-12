--[[ SCRIPTED BY Xander1998 ]]--

fx_version "cerulean"

game { "gta5" }

escrow_ignore {
  "./sql/*.sql"
}

shared_scripts {
  "shared/config.lua"
}

server_scripts {
  "server/classes/*.lua",
  "server/server.lua"
}

client_scripts {
  "client/managers/*.lua",
  "client/classes/*.lua",
  "client/client.lua"
}