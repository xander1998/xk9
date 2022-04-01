xK9KennelManager = {}
xK9KennelManager.Kennels = {}

function xK9KennelManager:CreateAllKennels()
  for _, v in pairs(xK9Config.Kennels) do
    table.insert(xK9KennelManager.Kennels, xK9Kennel.New(v))
  end
end

function xK9KennelManager:DeleteAllKennels()
  for _, v in pairs(xK9KennelManager.Kennels) do
    v:Delete()
  end
end

function xK9KennelManager:GetKennels()
  return xK9KennelManager.Kennels
end

Citizen.CreateThread(function()
  while true do

    local pedPos = GetEntityCoords(PlayerPedId())

    for _, v in pairs(xK9KennelManager.Kennels) do
      local pos = GetEntityCoords(v.Handle)
      local distance = Vdist(pedPos.x, pedPos.y, pedPos.z, pos.x, pos.y, pos.z)

      if distance < 2.0 then
        if IsControlJustPressed(0, 38) then
          xUIManager:ChangeView("kennel")
          xUIManager:OpenUI()
        end
      end
    end

    Citizen.Wait(0)
  end
end)