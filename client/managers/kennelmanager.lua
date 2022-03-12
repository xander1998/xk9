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
  local ScaleformHandle = RequestScaleformMovie("hud_help_text") -- The scaleform you want to use
  while not HasScaleformMovieLoaded(ScaleformHandle) do -- Ensure the scaleform is actually loaded before using
    Citizen.Wait(0)
  end

  BeginScaleformMovieMethod(ScaleformHandle, "SET_HELP_TEXT") -- The function you want to call from the AS file

  EndScaleformMovieMethod() -- Finish off the scaleform, it returns no data, so doesnt need "EndScaleformMovieMethodReturn"

  CallScaleformMovieMethodWithString(ScaleformHandle, "SET_HELP_TEXT", "K9", "K9", "K9", "K9", "K9")

  while true do

    local pedPos = GetEntityCoords(PlayerPedId())

    for _, v in pairs(xK9KennelManager.Kennels) do
      local pos = GetEntityCoords(v)
      local distance = Vdist(pedPos.x, pedPos.y, pedPos.z, pos.x, pos.y, pos.z)

      if distance < 2.0 then
        if IsControlJustPressed(0, 38) then
          print("Access Kennel")
        end
      end
    end

    Citizen.Wait(0)
  end
end)