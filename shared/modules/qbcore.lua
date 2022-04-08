local module = xK9Module.New("QBCore")

module:LoadFrameworkObject(exports['qb-core']:GetCoreObject())

module:SetSearchPersonFunction(function(id)
  return false
end)

module:SetSearchVehicleFunction(function(plate)
  return false
end)

xK9ModuleManager:LoadModule(module)