xK9Module = {}
xK9Module.__index = xK9Module

function xK9Module.New(framework)
  local newModule = {}

  -- Data
  newModule.Framework = framework
  newModule.FrameworkObject = nil
  newModule.Inventory = nil

  -- Functions
  newModule.SearchPersonFunction = nil
  newModule.SearchVehicleFunction = nil

  if not IsDuplicityVersion() then
    RegisterNetEvent("xK9::Client::ReceivePlayerInventory")
    AddEventHandler("xK9::Client::ReceivePlayerInventory", function(inventory)
      newModule.Inventory = inventory
    end)

    RegisterNetEvent("xK9::Client::ReceiveVehicleInventory")
    AddEventHandler("xK9::Client::ReceiveVehicleInventory", function(inventory)
      newModule.Inventory = inventory
    end)
  else
    RegisterNetEvent("xK9::Server::RequestPersonInventory")
    AddEventHandler("xK9::Server::RequestPersonInventory", function()
      local src = source
    end)

    RegisterNetEvent("xK9::Server::RequestVehicleInventory")
    AddEventHandler("xK9::Server::RequestVehicleInventory", function()
      local src = source
    end)
  end

  return newModule
end

function xK9Module:ClearInventory()
  self.Inventory = nil
end

function xK9Module:LoadFrameworkObject(object)
  self.FrameworkObject = object
end

function xK9Module:DefineSearchPersonFunction(func)
  self.SearchPersonFunction = func
end

function xK9Module:DefineSearchVehicleFunction(func)
  self.SearchVehicleFunction = func
end