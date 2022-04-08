local module = xK9Module.New("QBCore")

module:LoadFrameworkObject(exports['qb-core']:GetCoreObject())

module:SetSearchPersonFunction(function(id)
  local hasBadItem = false
  for k, v in pairs(xK9Config.BadItems) do
    local hasItem = module.FrameworkObject.Functions.HasItem(v.item)
    hasBadItem = true
    break
  end
  return hasBadItem
end)

module:SetSearchVehicleFunction(function(plate)
  local hasBadItem = false
end)

xK9ModuleManager:LoadModule(module)