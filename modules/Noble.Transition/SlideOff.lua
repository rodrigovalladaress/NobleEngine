---
--- @submodule Noble.Transition

class("SlideOff", nil, Noble.Transition).extends(Noble.Transition)
local transition = Noble.Transition.SlideOff
transition.name = "Slide Off"

--- Type
transition._type = Noble.Transition.Type.MIX

--- The previous scene slides off the screen, revealing the next scene.
--- @table Noble.Transition.SlideOff.defaultProperties
---@param ease? Ease ' Default: Ease.outInQuad'
---@param x? number ' Default: 0'
---@param y? number ' Default: 0'
---@param rotation? number ' Default: 0'
transition.defaultProperties = {
	ease = Ease.inQuart,
	x = 0,
	y = 0,
	rotation = 0
}

function transition:setProperties(__arguments)
	self.x = __arguments.x or self.defaultProperties.x
	self.y = __arguments.y or self.defaultProperties.y
	self.rotation = __arguments.rotation or self.defaultProperties.rotation
end

function transition:draw()
	transition.super.draw(self)
	local progress = self.sequence:get()
	self.oldSceneScreenshot:drawRotated(
		self.x * progress + 200,
		self.y * progress + 120,
		self.rotation * progress
	)
end