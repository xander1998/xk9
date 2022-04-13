xUIManager:CreateCallback("requestCreatorConfig", function(data, cb)
  cb({
    dogColors = xK9Config.K9Colors,
    vestColors = xK9Config.K9VestColors,
    vestTypes = xK9Config.K9VestTypes
  })
end)

xUIManager:CreateCallback("createK9", function(data, cb)
  local module = xK9ModuleManager:GetActiveModule()
  if module then
    module:CreateK9(data, function()
      module:GetK9List(function(results)
        xUIManager:SendMessage("updateK9List", {
          dogs = results
        })
      end)
      cb()
    end)
  end
end)