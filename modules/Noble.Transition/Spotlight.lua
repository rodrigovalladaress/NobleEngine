class("Spotlight", nil, Noble.Transition).extends(Noble.Transition)
local transition = Noble.Transition.Spotlight

transition.name = "Spotlight"
transition.type = Noble.Transition.Type.IN_OUT

local panel

function transition:init(__duration,  __holdTime, __fromX, __fromY, __toX, __toY, __easeInFunction, __easeOutFunction, __dither)
	transition.super.init(self, __duration, __holdTime, (__easeInFunction or Ease.outQuad), (__easeOutFunction or Ease.inQuad))
	if (panel == nil) then panel = Graphics.image.new(400,240, Graphics.kColorBlack) end
	self.dither = __dither or Graphics.image.kDitherTypeBayer4x4
	self.fromX = __fromX or 200
	self.fromY = __fromY or 120
	self.toX = __toX or self.fromX
	self.toY = __toY or self.fromY
end

function transition:draw()
	local progress = self.animator:currentValue()
	panel:drawFaded(0, 0, progress, self.dither)
	Graphics.setColor(Graphics.kColorClear)
	if not self.out then
		Graphics.fillCircleAtPoint(self.fromX, self.fromY, (1 - progress) * 400)
	else
		Graphics.fillCircleAtPoint(self.toX, self.toY, (1 - progress) * 400)
	end
	Graphics.setColor(Graphics.kColorBlack)
end