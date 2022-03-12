xKeymap = {}
xKeymap.__index = xKeymap

function xKeymap.New(command --[[ string ]], description --[[ string ]], mapper --[[ string ]], key --[[ string ]], pressedCallback --[[ function ]], releasedCallback --[[ function ]])
  local newKeymap = {}
  setmetatable(newKeymap, xKeymap)

  if pressedCallback then
    RegisterCommand("+" .. command, pressedCallback, false)
  end

  if releasedCallback then
    RegisterCommand("-" .. command, pressedCallback, false)
  end

  RegisterKeyMapping("+" .. command, description, mapper, key)

  return newKeymap
end