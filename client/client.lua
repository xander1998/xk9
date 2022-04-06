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

-- xKeymap.New("heel", "Make the dog standby and sit", "keyboard", "H", function()
--   local k9 = xK9Manager:GetK9()
--   if k9 then
--     k9:Heel()
--   end
-- end)
RegisterCommand("heel", function(source, args, raw)
    local k9 = xK9Manager:GetK9()
    if k9 then
      k9:Heel()
    end
end, false)

-- RegisterKeyMapping(char* commandString, char* description, char* defaultMapper, char* defaultParameter)
-- xKeymap.New("attack", "Attack selected target", "keyboard", "E", function()
--   local k9 = xK9Manager:GetK9()
--   if k9 then
--     -- Attack Function Here
--   end
-- end)
RegisterCommand("attack", function(source, args, raw)
    local k9 = xK9Manager:GetK9()
    if k9 then
      -- Attack Function Here
    end
end, false)

RegisterCommand("intimidate", function(source, args, raw)
  local k9 = xK9Manager:GetK9()
  if k9 then

  end
end, false)

-- KEYBIND HANDLER
Citizen.CreateThread(function()
  local player = PlayerId()

  while true do

    if xK9Manager:IsK9Handler() then
      if IsDisabledControlPressed(0, 19) --[[ LEFT ALT ]] then
        DisableControlAction(0, 73, true)
        DisableControlAction(0, 26, true)

        if IsPlayerFreeAiming(player) then
          if IsDisabledControlJustPressed(0, 73) --[[ X ]] then
            local k9 = xK9Manager:GetK9()
            local found, target = GetEntityPlayerIsFreeAimingAt(player)

            if found then
              if IsEntityAPed(target) then
                k9:SetTarget(target)
              end
            else
              k9:UnsetTarget()
            end
          end
        end

        if IsDisabledControlJustPressed(0, 26) --[[ C ]] then
          local k9 = xK9Manager:GetK9()
          k9:Heel()
        end

      else
        if IsControlJustPressed(0, 73) --[[ X ]] then
          local k9 = xK9Manager:GetK9()
          print("Attack Key Pressed!")
          k9:Attack()
        end
      end
    end

    Citizen.Wait(0)
  end
end)

-- TARGET HANDLER
Citizen.CreateThread(function()
  while true do

    if xK9Manager:IsK9Handler() then
      local k9 = xK9Manager:GetK9()
      if k9.Target then
        if k9.Target:IsDead() then
          k9:UnsetTarget()
          k9:Heel()
        end
      end
    end

    Citizen.Wait(0)
  end
end)

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