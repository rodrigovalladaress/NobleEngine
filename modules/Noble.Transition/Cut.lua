---
--- @submodule Noble.Transition

class("Cut", nil, Noble.Transition).extends(Noble.Transition)
local transition = Noble.Transition.Cut
transition.name = "Cut"

--- Properties
transition._type = Noble.Transition.Type.CUT

--- An all-time classic.
--- This transition has no properties.
--- @table Noble.Transition.Cut.defaultProperties