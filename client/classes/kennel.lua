xK9Kennel = {}
xK9Kennel.__index = xK9Kennel

function xK9Kennel.New(data)
  local newKennel = {}
  setmetatable(newKennel, xK9Kennel)
  
  newKennel.Handle = CreateObject(GetHashKey(data.model), data.position.x, data.position.y, data.position.z, false, false, false)
  newKennel.Model = data.model
  newKennel.Position = data.position
  newKennel.Rotation = data.rotation

  SetEntityRotation(newKennel.Handle, data.rotation.x, data.rotation.y, data.rotation.z, 0, false)
  FreezeEntityPosition(newKennel.Handle, true)

  return newKennel
end

function xK9Kennel:Delete()
  DeleteEntity(self.Handle)
end