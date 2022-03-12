xK9Manager = {}
xK9Manager.K9 = nil

function xK9Manager:CreateK9(name, breed)
  if xK9Manager.K9 then return false end
  xK9Manager.K9 = xK9.New(name, breed)
  xK9Manager.K9:Spawn()
end

function xK9Manager:DeleteK9()
  if not xK9Manager.K9 then return false end
  xK9Manager.K9:Despawn()
  xK9Manager.K9 = nil
end

function xK9Manager:GetK9()
  return xK9Manager.K9
end

function xK9Manager:IsK9Handler()
  if not xK9Manager.K9 then return false end
  return true
end