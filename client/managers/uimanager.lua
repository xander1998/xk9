xUIManager = {}
xUIManager.IsOpen = false
xUIManager.CurrentView = "kennel"

function xUIManager:OpenUI()
  self:SendMessage("show-view", { show = true })
end

function xUIManager:CloseUI()
  self:SendMessage("show-view", { show = false })
end

function xUIManager:ChangeView(view)
  self:SendMessage("change-view", { view = view })
  self.CurrentView = page
end

function xUIManager:IsOpened()
  return self.IsOpen
end

function xUIManager:GetCurrentView()
  return self.CurrentView
end

function xUIManager:SendMessage(type, data)
  SendNUIMessage(type, data)
end

function xUIManager:CreateCallback(type, callback)
  RegisterNUICallback(type, callback)
end