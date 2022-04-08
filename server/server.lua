AddEventHandler("playerJoining", function(source, oldSource)
  xPlayerManager:AddPlayer(xPlayer.New(source))
end)

AddEventHandler("playerDropped", function(reason)
  xPlayerManager:RemovePlayer(source)
end)

RegisterNetEvent("xK9::Server::SyncLeash")
AddEventHandler("xK9::Server::SyncLeash", function(dog)
  local player = tonumber(source)
  for _, otherPlayer in ipairs(GetPlayers()) do
    otherPlayer = tonumber(otherPlayer)
    if otherPlayer ~= player then
      TriggerClientEvent("xK9::Client::SyncLeash", otherPlayer, player, dog)
    end
  end
end)

RegisterNetEvent("xK9::Server::SyncUnleash")
AddEventHandler("xK9::Server::SyncUnleash", function(dog)
  local player = tonumber(source)
  for _, otherPlayer in ipairs(GetPlayers()) do
    otherPlayer = tonumber(otherPlayer)
    if otherPlayer ~= player then
      TriggerClientEvent("xK9::Client::SyncUnleash", otherPlayer, dog)
    end
  end
end)