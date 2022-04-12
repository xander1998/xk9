xVehicle = {}
xVehicle.__index = xVehicle

function xVehicle.New(handle, k9)
  local newVehicle = {}
  setmetatable(newVehicle, xVehicle)

  local door_bones = {
    [0] = "door_dside_f",
    [1] = "door_dside_r",
    [2] = "door_pside_f",
    [3] = "door_pside_r"
  }

  newVehicle.Handle = handle
  newVehicle.Hash = GetEntityModel(handle)
  newVehicle.Config = xVehicleManager:GetVehicleConfig(newVehicle.Hash)
  newVehicle.K9Ref = k9
  newVehicle.DoorBones = {
    [0] = "door_dside_f",
    [1] = "door_dside_r",
    [2] = "door_pside_f",
    [3] = "door_pside_r"
  }
  newVehicle.SeatBones = {
    [0] = "seat_dside_f",
    [1] = "seat_pside_f",
    [2] = "seat_dside_r",
    [3] = "seat_pside_r"
  }

  -- newVehicle:AttachK9()

  return newVehicle
end

function xVehicle:IsUpsideDown()
  return IsEntityUpsidedown(self.Handle)
end

function xVehicle:OpenDoor()
  SetVehicleDoorOpen(self.Handle, self.Config.door_index, false, false)
end

function xVehicle:CloseDoor()
  SetVehicleDoorShut(self.Handle, self.Config.door_index, false)
end

function xVehicle:AttachK9()
  local dogBoneIndex = GetPedBoneIndex(self.K9Ref.Handle, 65245)
  local attachPos = GetWorldPositionOfEntityBone(self.Handle, GetEntityBoneIndexByName(self.Handle, self.SeatBones[self.Config.seat_index]))
  local attachRot = GetEntityRotation(self.Handle)
  AttachEntityToEntity(self.K9Ref.Handle, self.Handle, vehicleBoneIndex, attachPos.x, attachPos.y, attachPos.z, attachRot.x, attachRot.y, attachRot.z, false, false, false, true, 1, false)
end

function xVehicle:DetachK9()

end