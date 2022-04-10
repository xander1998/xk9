--[[ SCRIPTED BY Xander1998 ]]--

fx_version "cerulean"

game { "gta5" }

escrow_ignore {}

ui_page "ui/index.html"

files {
  "ui/index.html",

  -- Fonts
  "ui/fonts/*.ttf",

  -- Images
  "ui/images/dogs/*.png",
  "ui/images/icons/*.svg",

  -- Scripts
  "ui/scripts/components/kennel/*.js",
  "ui/scripts/components/kennel/form/*.js",
  "ui/scripts/views/*.js",
  "ui/scripts/*.js",

  -- Styles
  "ui/styles/components/kennel/*.css",
  "ui/styles/components/kennel/form/*.css",
  "ui/styles/views/*.css",
  "ui/styles/*.css"
}

shared_scripts {
  "shared/config.lua",
  "shared/managers/*.lua",
  "shared/classes/*.lua",
  "shared/modules/*.lua"
}

server_scripts {
  "@oxmysql/lib/MySQL.lua",
  "server/classes/*.lua",
  "server/managers/*.lua",
  "server/server.lua"
}

client_scripts {
  "client/managers/*.lua",
  "client/classes/*.lua",
  "client/ui/*.lua",
  "client/client.lua"
}