xVehicleManager = {}
xVehicleManager.Vehicle = nil

function xVehicleManager:SetCurrentVehicle(vehicle)
  self.Vehicle = vehicle
end

function xVehicleManager:GetCurrentVehicle()
  return self.Vehicle
end

function xVehicleManager:GetVehicleConfig(hash)
  for k, v in pairs(xK9Config.AllowedVehicles) do
    print(v.hash .. " == " .. hash)
    if v.hash == hash then
      return v
    end
  end
  return nil
end