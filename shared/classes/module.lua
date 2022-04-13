xK9Module = {}
xK9Module.__index = xK9Module

function xK9Module.New(framework)
  local newModule = {}
  setmetatable(newModule, xK9Module)

  -- Data
  newModule.Framework = framework
  newModule.FrameworkObject = nil

  -- Functions
  newModule.GetK9ListFunction = nil
  newModule.CreateK9Function = nil
  newModule.DeleteK9Function = nil
  newModule.SelectK9Function = nil
  newModule.SearchPersonFunction = nil
  newModule.SearchVehicleFunction = nil
  newModule.SearchResultFunction = nil
  newModule.CreateK9ResultFunction = nil
  newModule.DeleteK9ResultFunction = nil
  newModule.SelectedK9ResultFunction = nil
  newModule.GetK9ListResultFunction = nil

  -- EVENTS
  if IsDuplicityVersion() then
    RegisterNetEvent("xK9::Server::CreateK9")
    AddEventHandler("xK9::Server::CreateK9", function(data)
      if newModule.CreateK9Function then
        local src = source
        newModule.CreateK9Function(src, data, function(newList)
          TriggerClientEvent("xK9::Client::CreateK9Result", src, newList)
        end)
      end
    end)

    RegisterNetEvent("xK9::Server::DeleteK9")
    AddEventHandler("xK9::Server::DeleteK9", function()
      
    end)

    RegisterNetEvent("xK9::Server::SelectK9")
    AddEventHandler("xK9::Server::SelectK9", function()
      
    end)

    RegisterNetEvent("xK9::Server::GetK9List")
    AddEventHandler("xK9::Server::GetK9List", function()
      if newModule.GetK9ListFunction then
        local src = source
        newModule.GetK9ListFunction(src, function(results)
          TriggerClientEvent("xK9::Client::ReceiveK9List", src, results)
        end)
      end
    end)

    RegisterNetEvent("xK9::Server::SearchPerson")
    AddEventHandler("xK9::Server::SearchPerson", function(player)
      if newModule.SearchPersonFunction then
        local src = source
        newModule.SearchPersonFunction(player, function(results)
          TriggerClientEvent("xK9::Client::ReceiveSearchResults", src, results or false)
        end)
      end
    end)

    RegisterNetEvent("xK9::Server::SearchVehicle")
    AddEventHandler("xK9::Server::SearchVehicle", function(plate)
      if newModule.SearchVehicleFunction then
        local src = source
        local results = newModule.SearchVehicleFunction(plate, function(results)
          TriggerClientEvent("xK9::Client::ReceiveSearchResults", src, results or false)
        end)
      end
    end)
  else
    RegisterNetEvent("xK9::Client::CreateK9Result")
    AddEventHandler("xK9::Client::CreateK9Result", function()
      if newModule.CreateK9ResultFunction then
        newModule.CreateK9ResultFunction()
      else
        error("[xK9 Error]: No CreateK9ResultFunction defined in the module!")
      end
    end)

    RegisterNetEvent("xK9::Client::ReceiveSearchResults")
    AddEventHandler("xK9::Client::ReceiveSearchResults", function(results)
      if newModule.SearchResultFunction then
        newModule.SearchResultFunction(results)
      else
        error("[xK9 Error]: No SearchResultFunction defined in the module!")
      end
    end)

    RegisterNetEvent("xK9::Client::ReceiveK9List")
    AddEventHandler("xK9::Client::ReceiveK9List", function(dogs)
      if newModule.GetK9ListResultFunction then
        newModule.GetK9ListResultFunction(dogs)
      else
        error("[xK9 Error]: No GetK9ListResultFunction defined in the module!")
      end
    end)
  end

  return newModule
end

function xK9Module:SetClientFrameworkObject(object)
  if not IsDuplicityVersion() then
    self.FrameworkObject = object
  end
end

function xK9Module:SetServerFrameworkObject(object)
  if IsDuplicityVersion() then
    self.FrameworkObject = object
  end
end

function xK9Module:SetSearchPersonFunction(func)
  if IsDuplicityVersion() then
    self.SearchPersonFunction = func
  end
end

function xK9Module:SetSearchVehicleFunction(func)
  if IsDuplicityVersion() then
    self.SearchVehicleFunction = func
  end
end

function xK9Module:SetGetK9ListFunction(func)
  if IsDuplicityVersion() then
    self.GetK9ListFunction = func
  end
end

function xK9Module:SetSelectK9Function(func)
  if IsDuplicityVersion() then
    self.SelectK9Function = func
  end
end

function xK9Module:SetCreateK9Function(func)
  if IsDuplicityVersion() then
    self.CreateK9Function = func
  end
end

function xK9Module:SetDeleteK9Function(func)
  if IsDuplicityVersion() then
    self.DeleteK9Function = func
  end
end

function xK9Module:SetSelectK9Function(func)
  if IsDuplicityVersion() then
    self.SelectK9Function = func
  end
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

  function xK9Module:CreateK9(data, func)
    self.CreateK9ResultFunction = func
    TriggerServerEvent("xK9::Server::CreateK9", data)
  end

  function xK9Module:DeleteK9()
    TriggerServerEvent("xK9::Server::DeleteK9")
  end

  function xK9Module:SelectK9()
    TriggerServerEvent("xK9::Server::SelectK9")
  end

  function xK9Module:GetK9List(func)
    self.GetK9ListResultFunction = func
    TriggerServerEvent("xK9::Server::GetK9List")
  end
end