---
--- @submodule Noble.Transition

class("SlideOn", nil, Noble.Transition).extends(Noble.Transition)
local transition = Noble.Transition.SlideOn
transition.name = "Slide On"

--- Type
transition._type = Noble.Transition.Type.MIX

--- Overrides
transition._sequenceStartValue = 1
transition._sequenceCompleteValue = 0
transition._captureScreenshotsDuringTransition = true

--- The next scene slides on the screen, covering up the previous scene.
--- @table Noble.Transition.SlideOn.defaultProperties
---@param ease? Ease ' Default: Ease.outInQuad'
---@param x? number ' Default: 0'
---@param y? number ' Default: 0'
---@param rotation? number ' Default: 0'
transition.defaultProperties = {
	ease = Ease.outQuart,
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
	self.oldSceneScreenshot:draw(0,0)
	self.newSceneScreenshot:drawRotated(
		self.x * progress + 200,
		self.y * progress + 120,
		self.rotation * progress
	)
end