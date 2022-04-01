xUIManager:CreateCallback("closeView", function(data, cb)
  xUIManager:CloseUI()

  cb("ok")
end)