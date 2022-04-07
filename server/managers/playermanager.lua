xPlayerManager = {}
xPlayerManager.Players = {}

function xPlayerManager:AddPlayer(player)
  self.Players[player.Handle] = player
end

function xPlayerManager:RemovePlayer(player)
  self.Players[player.Handle] = nil
end

function xPlayerManager:GetPlayer(handle)
  if self.Players[handle] then return self.Players[handle] end
  return nil
end