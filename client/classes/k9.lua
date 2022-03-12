xK9 = {}
xK9.__index = xK9

local k9_states = {
  ["heeled"] = 0,
  ["attacking"] = 1,
  ["searching"] = 2,
  ["locating"] = 3
}

function xK9.New(name)
  local newK9 = {}
  setmetatable(newK9, xK9)

  -- K9 Info
  newK9.Name = name -- Load From Database
  newK9.Hash = `a_c_shepherd`
  newK9.Skills = {} -- data.Skills -- Load From Database
  newK9.Scenarios = {
    ["sitting"] = "WORLD_DOG_SITTING_SHEPHERD",
    ["barking"] = "WORLD_DOG_BARKING_SHEPHERD"
  }

  -- K9 Game Info
  newK9.Handle = nil
  newK9.NetHandle = nil
  newK9.Target = nil
  newK9.LeashHandle = nil

  -- K9 States
  newK9.State = k9_states["heeled"]

  return newK9
end

function xK9:Spawn()
  if self:IsSpawned() then return end

  local playerPed = PlayerPedId()
  local spawnPosition = GetOffsetFromEntityInWorldCoords(playerPed, 0.0, 1.5, 0.0)
  local spawnHeading = GetEntityHeading(playerPed)

  RequestModel(self.Hash)

  while not HasModelLoaded(self.Hash) do
    Citizen.Wait(0)
  end

  self.Handle = CreatePed(28, self.Hash, spawnPosition.x, spawnPosition.y, spawnPosition.z - 0.5, spawnHeading, true, true)
  self.NetHandle = NetworkGetNetworkIdFromEntity(self.Handle)

  Citizen.Wait(1000)

  self:Heel()
end

function xK9:Despawn()
  if not self:IsSpawned() then return end

  DeleteEntity(self.Handle)

  if self.LeashHandle then
    TriggerServerEvent("xK9::Server::SyncUnleash")
  end
end

function xK9:Leash()
  if not self:IsSpawned() then return end
  if self.LeashHandle then return end

  local ped = PlayerPedId()

  local pedHandPosition = GetWorldPositionOfEntityBone(ped, GetPedBoneIndex(ped, 57005)) -- SKEL_R_Hand
  local k9NeckPosition = GetWorldPositionOfEntityBone(self.Handle, GetPedBoneIndex(self.Handle, 39317)) -- SKEL_Neck_1

  local distBetweenPoints = #(pedHandPosition - k9NeckPosition)

  if distBetweenPoints >= 3.0 then return end

  RopeLoadTextures()

  self.LeashHandle = AddRope(pedHandPosition.x, pedHandPosition.y, pedHandPosition.z, 0.0, 0.0, 0.0, 4.0, 5, distBetweenPoints, 1.0, 0.1, true, true, false, 1.0, false, 0)
  -- AddRope(float* x, float* y, float* z, float* rotX, float* rotY, float* rotZ, float* maxLength, int* ropeType, float* initLength, float* minLength, float* lengthChangeRate, BOOL* onlyPPU, BOOL* collisionOn, BOOL* lockFromFront, float* timeMultiplier, BOOL* breakable, Any* unkPtr)

  LoadRopeData(self.LeashHandle, "ropeFamily3")

  AttachRopeToEntity(self.LeashHandle, ped, pedHandPosition.x, pedHandPosition.y, pedHandPosition.z, true)
  AttachEntitiesToRope(self.LeashHandle, ped, self.Handle, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, distBetweenPoints, true, true, "SKEL_R_Hand", "SKEL_Neck_1")

  StartRopeUnwindingFront(self.LeashHandle)

  if self.State == k9_states["attacking"] then
    self:Attack()
  end

  TriggerServerEvent("xK9::Server::SyncLeash", self.NetHandle)
end

function xK9:Unleash()
  if not self:IsSpawned() then return end

  -- Delete Rope
  DeleteRope(self.LeashHandle)
  self.LeashHandle = nil
  
  self:Heel()

  TriggerServerEvent("xK9::Server::SyncUnleash", self.NetHandle)
end

function xK9:Heel()
  if not self:IsSpawned() then return end

  -- Dog sits on the ground
  TaskStartScenarioInPlace(self.Handle, self.Scenarios["sitting"], 0, true)
end

function xK9:Attack()
  if not self:IsSpawned() then return end
  if self.LeashHandle then return end

  -- Dog starts to chase and bite at the target
end

function xK9:Intimidate()
  if not self:IsSpawned() then return end

  -- Dog will bark and animate at the target
end

function xK9:SmellSearchPersonPlayer(player)
  if not self:IsSpawned() then return end
  if not xK9Config.Framework then return end

  -- Dog will smell if a player has an illegal substance on them
end

function xK9:SmellSearchVehicle(vehicle)
  if not self:IsSpawned() then return end
  if not xK9Config.Framework then return end

  -- Dog will smell if a vehicle has an illegal substance on the person
end

function xK9:LocateSubject(ped)
  if not self:IsSpawned() then return end

  -- Dog will search for a missing person and locate them.
end

function xK9:HasSkill(skill)
  for _, v in pairs(self.Skills) do
    if v == skill then
      return true
    end
    return false
  end
end

function xK9:IsSpawned()
  if self.Handle then
    return true
  end
  return false
end

function xK9:GetState()
  return self.State
end