xUIManager:CreateCallback("requestCreatorConfig", function(data, cb)
  cb({
    dogColors = xK9Config.K9Colors,
    vestColors = xK9Config.K9VestColors,
    vestTypes = xK9Config.K9VestTypes
  })
end)

xUIManager:CreateCallback("createK9", function(data, cb)
  TriggerServerEvent("")
  cb("ok")
end)