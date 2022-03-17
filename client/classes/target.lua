xK9Target = {}
xK9Target.__index = xK9Target

function xK9Target.New(ped)
  local newTarget = {}
  setmetatable(newTarget, xK9Target)

  newTarget.Handle = ped

  return newTarget
end

function xK9Target:Init()
  SetPedRelationshipGroupHash(self.Handle, GetHashKey("K9_TARGET"))
end

function xK9Target:IsDead()
  return IsEntityDead(self.Handle)
end

function xK9Target:GetPosition()
  return GetEntityCoords(self.Handle)
end

function xK9Target:DeInit()
  SetPedRelationshipGroupHash(self.Handle, 26)
end