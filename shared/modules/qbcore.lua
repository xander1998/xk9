local module = xK9Module.New("QBCore")

module:SetServerFrameworkObject(exports['qb-core']:GetCoreObject())

module:SetSearchPersonFunction(function(id, callback)
  local hasBadItem = false
  local player = module.FrameworkObject.Functions.GetPlayer(1)
  if player then
    local queryResult = MySQL.query.await("SELECT `inventory` FROM `players` WHERE `citizenid` = ?", { player.PlayerData.citizenid })
    local inventory = json.decode(queryResult[1].inventory)

    for cKey, cItem in pairs(xK9Config.BadItems) do
      for iKey, iItem in pairs(inventory) do
        if cItem.item == iItem.name then
          hasBadItem = true
          break
        end
      end
    end
  end
  callback(hasBadItem)
end)

module:SetSearchVehicleFunction(function(plate, callback)
  print("Vehicle Plate: " .. tostring(plate))
  
  local hasBadItem = false

  local player = module.FrameworkObject.Functions.GetPlayer(1)
  if player then
    local inventory = {}

    -- Trunk Items
    local trunkResult = MySQL.query.await("SELECT `items` FROM `trunkitems` WHERE `plate` = ?", { plate })
    inventory = json.decode(trunkResult[1].items)

    for cKey, cItem in pairs(xK9Config.BadItems) do
      for iKey, iItem in pairs(inventory) do
        if cItem.item == iItem.name then
          hasBadItem = true
          break
        end
      end
    end

    if not hasBadItem then
      local gloveboxResult = MySQL.query.await("SELECT `items` FROM `gloveboxitems` WHERE `plate` = ?", { plate })
      inventory = json.decode(gloveboxResult[1].items)

      for cKey, cItem in pairs(xK9Config.BadItems) do
        for iKey, iItem in pairs(inventory) do
          if cItem.item == iItem.name then
            hasBadItem = true
            break
          end
        end
      end
    end
  end

  callback(hasBadItem)
end)

xK9ModuleManager:LoadModule(module)