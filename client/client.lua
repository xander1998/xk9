RegisterCommand("spawn", function(source, args, raw)
  xK9Manager:CreateK9(args[1])
end, false)

-- REMOVE THIS
RegisterCommand("pos", function(source, args, raw)
  local ped = GetPlayerPed(-1)
  print(GetEntityCoords(ped), GetEntityRotation(ped))
end, false)

-- RegisterKeyMapping(char* commandString, char* description, char* defaultMapper, char* defaultParameter)
RegisterCommand("leash", function(source, args, raw)
  local k9 = xK9Manager:GetK9()
  if k9 then
    k9:Leash()
  end
end, false)

-- RegisterKeyMapping(char* commandString, char* description, char* defaultMapper, char* defaultParameter)
RegisterCommand("unleash", function(source, args, raw)
  local k9 = xK9Manager:GetK9()
  if k9 then
    k9:Unleash()
  end
end, false)

-- RegisterKeyMapping(char* commandString, char* description, char* defaultMapper, char* defaultParameter)
RegisterCommand("heel", function(source, args, raw)
  local k9 = xK9Manager:GetK9()
  if k9 then
    k9:Heel()
  end
end, false)

-- RegisterKeyMapping(char* commandString, char* description, char* defaultMapper, char* defaultParameter)
xKeymap.New("attack", "Attack selected target", "keyboard", "IOM_WHEEL_DOWN", function()
  local k9 = xK9Manager:GetK9()
  if k9 then
    -- Attack Function Here
  end
end)

RegisterCommand("intimidate", function(source, args, raw)
  local k9 = xK9Manager:GetK9()
  if k9 then

  end
end, false)

-- SCRIPT SETUP
AddEventHandler("onClientResourceStart", function(resource)
  if resource ~= GetCurrentResourceName() then return end

  xK9KennelManager:CreateAllKennels()
end)

-- SCRIPT CLEANUP
AddEventHandler("onResourceStop", function(resource)
  if resource ~= GetCurrentResourceName() then return end

  xK9Manager.DeleteK9()
  xK9RopeManager:DeleteRopes()
  xK9KennelManager:DeleteAllKennels()
end)