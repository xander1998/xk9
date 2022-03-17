xK9 = {}
xK9.__index = xK9

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
  newK9.BlipHandle = nil

  -- K9 States
  newK9.State = nil

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

  -- Behaviors
  SetBlockingOfNonTemporaryEvents(self.Handle, true)
  SetPedFleeAttributes(self.Handle, 0, 0)
  SetPedRelationshipGroupHash(self.Handle, GetHashKey("K9"))
  GiveWeaponToPed(self.Handle, GetHashKey("WEAPON_ANIMAL"), 200, true, true)

  Citizen.Wait(1000)

  self:CreateBlip()
  self:Heel()

  print("[K9]: Spawned")
end

function xK9:Despawn()
  if not self:IsSpawned() then return end

  DeleteEntity(self.Handle)
  self:DeleteBlip()

  if self:IsLeashed() then
    TriggerServerEvent("xK9::Server::SyncUnleash")
  end

  print("[K9]: Despawned.")
end

function xK9:CreateBlip()
  local blip = AddBlipForEntity(self.Handle)
  SetBlipAsFriendly(blip, true)
  SetBlipSprite(blip, 442)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString(tostring("K9: " .. self.Name))
  EndTextCommandSetBlipName(blip)
  self.BlipHandle = blip
  print("[K9]: Blip Created.")
end

function xK9:DeleteBlip()
  if not self.BlipHandle then return end
  RemoveBlip(self.BlipHandle)
  print("[K9]: Blip Deleted.")
end

function xK9:Leash()
  if not self:IsSpawned() then return end
  if self:IsLeashed() then return end

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

  self:Follow()

  TriggerServerEvent("xK9::Server::SyncLeash", self.NetHandle)

  print("[K9]: Leashed")
end

function xK9:Unleash()
  if not self:IsSpawned() then return end

  -- Delete Rope
  DeleteRope(self.LeashHandle)
  self.LeashHandle = nil

  if self.State == "attacking" then
    print("[K9]: Unleashed. Set into attack. Attacking!")
    self:Attack()
  end

  print("[K9]: Unleashed")

  TriggerServerEvent("xK9::Server::SyncUnleash", self.NetHandle)
end

function xK9:Heel()
  if not self:IsSpawned() then return end

  TaskStartScenarioInPlace(self.Handle, self.Scenarios["sitting"], 0, true)
  self.State = "heeled"

  print("[K9]: Heeled.")
end

function xK9:Follow()
  TaskFollowToOffsetOfEntity(self.Handle, PlayerPedId(), 0.0, 0.0, 5.0, 15.0, -1, 0.4, true)
  self.State = "following"

  print("[K9]: Following.")
end

function xK9:Attack()
  if not self.Target then return end
  if not self:IsSpawned() then return end

  if self:IsLeashed() then
    self.State = "attacking"
    return
  end

  SetCanAttackFriendly(self.Handle, true, true)
  TaskPutPedDirectlyIntoMelee(self.Handle, self.Target.Handle, 0.0, -1.0, 0.0, false)
  print("[K9]: Attacking.")
end

function xK9:SetTarget(ped)
  self.Target = xK9Target.New(ped)
  self.Target:Init()
  print("[K9]: Setting Target")
end

function xK9:UnsetTarget()
  if not self.Target then return end
  self.Target = nil
  print("[K9]: Unsetting Target")
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

function xK9:IsLeashed()
  if self.LeashHandle then
    return true
  end
  return false
end

function xK9:GetState()
  return self.State
end