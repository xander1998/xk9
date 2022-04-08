xK9Module = {}
xK9Module.__index = xK9Module

function xK9Module.New(framework)
  local newModule = {}
  setmetatable(newModule, xK9Module)

  -- Data
  newModule.Framework = framework
  newModule.FrameworkObject = nil

  -- Functions
  newModule.SearchPersonFunction = nil
  newModule.SearchVehicleFunction = nil
  newModule.SearchResultFunction = nil

  -- EVENTS
  if IsDuplicityVersion() then
    RegisterNetEvent("xK9::Server::SearchPerson")
    AddEventHandler("xK9::Server::SearchPerson", function(player)
      if newModule.SearchPersonFunction then
        local src = source
        local results = newModule.SearchPersonFunction()
        TriggerClientEvent("xK9::Client::ReceiveSearchResults", src, results)
      end
    end)

    RegisterNetEvent("xK9::Server::SearchVehicle")
    AddEventHandler("xK9::Server::SearchVehicle", function(plate)
      if newModule.SearchVehicleFunction then
        local src = source
        local results = newModule.SearchVehicleFunction()
        TriggerClientEvent("xK9::Client::ReceiveSearchResults", src, results)
      end
    end)
  else
    RegisterNetEvent("xK9::Client::RecieveSearchResults")
    AddEventHandler("xK9::Client::RecieveSearchResults", function(results)
      newModule.SearchResultFunction(results)
    end)
  end

  return newModule
end

function xK9Module:LoadFrameworkObject(object)
  self.FrameworkObject = object
end

function xK9Module:SetSearchPersonFunction(func)
  self.SearchPersonFunction = func
end

function xK9Module:SetSearchVehicleFunction(func)
  self.SearchVehicleFunction = func
end

if not IsDuplicityVersion() then
  function xK9Module:SearchPerson(player, func)
    self.SearchResultFunction = func
    TriggerServerEvent("xK9::Server::SearchPerson", player)
  end

  function xK9Module:SearchVehicle(plate, func)
    self.SearchResultFunction = func
    TriggerServerEvent("xK9::Server::SearchVehicle", plate)
  end
end