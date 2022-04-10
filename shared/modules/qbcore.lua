local module = xK9Module.New("QBCore")

module:SetServerFrameworkObject(exports['qb-core']:GetCoreObject())

module:SetSearchPersonFunction(function(id, callback)
  local hasBadItem = false
  local player = module.FrameworkObject.Functions.GetPlayer(id)
  local queryResult = MySQL.query.await("SELECT `inventory` FROM `players` WHERE `citizenid` = ?", { player.PlayerData.citizenid })
  local inventory = json.decode(queryResult[1].inventory)

  for cKey, cItem in pairs(xK9Config.BadItems) do
    for iKey, iItem in pairs(inventory) do

      print(cItem.item .. " | " .. iItem.name)

      if cItem.item == iItem.name then
        hasBadItem = true
        break
      end
    end
  end

  print("Has Bad Item: " .. tostring(hasBadItem))
  callback(hasBadItem)
end)

module:SetSearchVehicleFunction(function(plate, callback)
  callback(false)
end)

xK9ModuleManager:LoadModule(module)