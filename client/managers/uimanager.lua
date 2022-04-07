xUIManager = {}
xUIManager.IsOpen = false
xUIManager.CurrentView = "kennel"

function xUIManager:OpenUI()
  self:SendMessage("showView", { show = true })
  self:SetFocus(true, true)
end

function xUIManager:CloseUI()
  self:SendMessage("showView", { show = false })
  self:SetFocus(false, false)
end

function xUIManager:ChangeView(view)
  self:SendMessage("changeView", { view = view })
  self.CurrentView = page
end

function xUIManager:IsOpened()
  return self.IsOpen
end

function xUIManager:GetCurrentView()
  return self.CurrentView
end

function xUIManager:SendMessage(type, data)
  SendNUIMessage({
    type = type,
    data = data
  })
end

function xUIManager:CreateCallback(type, callback)
  RegisterNUICallback(type, callback)
end

function xUIManager:SetFocus(hasFocus, hasCursor)
  SetNuiFocus(hasFocus, hasCursor)
end