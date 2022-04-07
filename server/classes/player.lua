xPlayer = {}
xPlayer.__index = xPlayer

function xPlayer.New(handle)
  local newPlayer = {}
  setmetatable(newPlayer, xPlayer)

  newPlayer.Handle = handle
  newPlayer.Name = GetPlayerName(handle)

  return newPlayer
end

function xPlayer:GetDogs()
  local results = exports.ExternalSQL:AsyncQuery({
    query = [[]],
    data = {}
  })
end

function xPlayer:CreateDog()

end

function xPlayer:DeleteDog()

end

function xPlayer:FireEvent(event, ...)
  TriggerClientEvent(event, self.Handle, ...)
end