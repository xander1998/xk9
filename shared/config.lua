xK9Config = {}

xK9Config.Framework = "QBCore" -- [[ ESX / QBCore ]]
xK9Config.DatabaseSystem = "oxmysql" --[[ ExternalSQL / oxmysql ]]


xK9Config.K9Colors = {
  ["lightbrown_black"] = { label = "Light Brown/Black", index = 0 },
  ["brown"] = { label = "Brown", index = 1 },
  ["darkbrown_black"] = { label = "Dark Brown/Black", index = 2 },
  ["black"] = { label = "Black", index = 3 }
}

xK9Config.K9VestColors = {
  ["black"] = { label = "Black Vest", index = 0 },
  ["green"] = { label = "Green Vest", index = 1 },
  ["red"] = { label = "Red Vest", index = 2 },
  ["blue"] = { label = "Blue Vest", index = 3 }
}

xK9Config.K9VestTypes = {
  ["police"] = { label = "Police Patches", index = 0 },
  ["sheriff"] = { label = "Sheriff Patches", index = 1 },
  ["rescue"] = { label = "Rescue Patches", index = 2 },
  ["security"] = { label = "Security Patches", index = 3 }
}

xK9Config.Kennels = {
  { model = "prop_dog_cage_01", position = vector3(460.71, -991.67, 23.91), rotation = vector3(0.0, 0.0, 110.91) },
  { model = "prop_dog_cage_01", position = vector3(1857.55, 3688.07, 33.26), rotation = vector3(0.0, 0.0, -65.19) },
  { model = "prop_dog_cage_01", position = vector3(-448.21, 6016.52, 30.71), rotation = vector3(6.73, -2.19, 42.91) }
}

xK9Config.Training = {
  {
    Terminal = vector3(0.0, 0.0, 0.0),
    Sessions = {
      ["cocaine"] = {
        type = "drugs",
        locations = {
          vector3(0.0, 0.0, 0.0)
        }
      },
      ["weed"] = {
        type = "drugs",
        locations = {
          vector3(0.0, 0.0, 0.0)
        }
      },
      ["opium"] = {
        type = "drugs",
        locations = {
          vector3(0.0, 0.0, 0.0)
        }
      },
      ["pills"] = {
        type = "drugs",
        locations = {
          vector3(0.0, 0.0, 0.0)
        }
      },
      ["meth"] = {
        type = "drugs",
        locations = {
          vector3(0.0, 0.0, 0.0)
        }
      },
      ["gunpowder"] = {
        type = "drugs",
        locations = {
          vector3(0.0, 0.0, 0.0)
        }
      },
      ["attack"] = {
        type = "combat",
        locations = {
          vector3(0.0, 0.0, 0.0)
        }
      },
      ["intimidation"] = {
        type = "combat",
        locations = {
          vector3(0.0, 0.0, 0.0)
        }
      }
    }
  }
}