xK9ModuleManager = {}
xK9ModuleManager.Modules = {}

function xK9ModuleManager:LoadModule(module)
  print("Loading Module: " .. module.Framework)
  self.Modules[module.Framework] = module

  if xK9Config.Framework == module.Framework then
    print("Initializing Selected Module: " .. module.Framework)
  end
end

function xK9ModuleManager:GetActiveModule()
  return self.Modules[xK9Config.Framework]
end

RegisterCommand("test", function(source, args, raw)
  local module = xK9ModuleManager:GetActiveModule()
  module:SearchPerson(source, function(result)
    print("HAS BAD ITEM: " .. result)
  end)
end, false)