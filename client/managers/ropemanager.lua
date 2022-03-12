xK9RopeManager = {}
xK9RopeManager.Ropes = {}

function xK9RopeManager:SyncLeash(player, dog)
  if xK9RopeManager.Ropes[dog] then return end

  local ped = GetPlayerPed(GetPlayerFromServerId(player))
  local k9Ped = NetworkGetEntityFromNetworkId(dog)
  local pedHandPosition = GetWorldPositionOfEntityBone(ped, GetPedBoneIndex(ped, 57005)) -- SKEL_R_Hand
  local k9NeckPosition = GetWorldPositionOfEntityBone(k9Ped, GetPedBoneIndex(k9Ped, 39317)) -- SKEL_Neck_1
  local distBetweenPoints = #(pedHandPosition - k9NeckPosition)

  RopeLoadTextures()

  xK9RopeManager[dog] = AddRope(pedHandPosition.x, pedHandPosition.y, pedHandPosition.z, 0.0, 0.0, 0.0, 4.0, 5, distBetweenPoints, 1.0, 0.1, true, true, false, 1.0, false, 0)
  
  LoadRopeData(xK9RopeManager[dog], "ropeFamily3")

  AttachRopeToEntity(xK9RopeManager[dog], ped, pedHandPosition.x, pedHandPosition.y, pedHandPosition.z, true)
  AttachEntitiesToRope(xK9RopeManager[dog], ped, k9Ped, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, distBetweenPoints, true, true, "SKEL_R_Hand", "SKEL_Neck_1")

  StartRopeUnwindingFront(xK9RopeManager[dog])
end

function xK9RopeManager:SyncUnleash(dog)
  if not xK9RopeManager[dog] then return end

  DeleteRope(xK9RopeManager[dog])
  xK9RopeManager[dog] = nil
end

function xK9RopeManager:DeleteRopes()
  for _, v in pairs(xK9RopeManager.Ropes) do
    DeleteRope(v)
  end
end

RegisterNetEvent("xK9::Client::SyncLeash")
AddEventHandler("xK9::Client::SyncLeash", function(player, dog)
  xK9RopeManager:SyncLeash(player, dog)
end)

RegisterNetEvent("xK9::Client::SyncUnleash")
AddEventHandler("xK9::Client::SyncUnleash", function(dog)
  xK9RopeManager:SyncUnleash(dog)
end)