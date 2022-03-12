xK9Config = {}

xK9Config.Framework = nil -- [[ ESX / QBCore ]]

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