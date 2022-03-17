xKeymap = {}
xKeymap.__index = xKeymap

function xKeymap.New(command --[[ string ]], description --[[ string ]], mapper --[[ string ]], key --[[ string ]], pressedCallback --[[ function ]], releasedCallback --[[ function ]])
  local newKeymap = {}
  setmetatable(newKeymap, xKeymap)

  if not pressedCallback then
    pressedCallback = function() end
  end

  if not releasedCallback then
    releasedCallback = function() end
  end

  RegisterCommand("+" .. command, pressedCallback, false)
  RegisterCommand("-" .. command, releasedCallback, false)
  RegisterKeyMapping("+" .. command, description, mapper, key)

  return newKeymap
end