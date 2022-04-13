local module = xK9Module.New("QBCore")

local function SearchPersonFunction(id, callback)
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
end

local function SearchVehicleFunction(plate, callback)
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

    -- Glovebox Items
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
end

local function GetK9ListFunction(src, callback)
  local player = module.FrameworkObject.Functions.GetPlayer(src)
  if player then
    local newList = MySQL.query.await("SELECT * FROM `dogs` WHERE `player` = ?", { player.PlayerData.citizenid })
    callback(newList)
  end
end

-- local function SelectK9Function(id, src, callback)
--   local dog = MySQL.query.await("SELECT * FROM `dogs` WHERE `id` = ? AND `player` = ? LIMIT 1", { id, player })
-- end

local function CreateK9Function(src, data, callback)
  local player = module.FrameworkObject.Functions.GetPlayer(1)
  if player then
    local created = MySQL.query.await("INSERT INTO `dogs` (`player`, `name`, `color`, `vest`, `vestColor`) VALUES (?, ?, ?, ?, ?)", {
      player.PlayerData.citizenid,
      data.name,
      data.dogColor.index,
      data.dogVestType.index,
      data.dogVestColor.index
    })

    local newList = MySQL.query.await("SELECT * FROM `dogs` WHERE `player` = ?", { player.PlayerData.citizenid })
    callback(newList)
  end
end

-- local function DeleteK9Function(id, src, callback)
--   local dog = MySQL.query.await("DELETE FROM `dogs` WHERE `id` = ? AND `player` = ?", { id, player })
-- end

module:SetServerFrameworkObject(exports['qb-core']:GetCoreObject())
module:SetSearchPersonFunction(SearchPersonFunction)
module:SetSearchVehicleFunction(SearchVehicleFunction)
module:SetGetK9ListFunction(GetK9ListFunction)
module:SetSelectK9Function(SelectK9Function)
module:SetCreateK9Function(CreateK9Function)
module:SetDeleteK9Function(DeleteK9Function)

xK9ModuleManager:LoadModule(module)