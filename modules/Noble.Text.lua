--- Text and font handling.
--- @module Noble.Text
Noble.Text = {}

--- Fonts
--
--- You can use these fonts in your project, or override them with your own if you wish.
--- @section fonts
--- Usage:
---```
---	Noble.Text.FONT_SMALL = Graphics.font.new("assets/fonts/MySmallFont")
---	Noble.Text.setFont(Noble.Text.FONT_SMALL)
---```

--- The Playdate system font.
Noble.Text.FONT_SYSTEM = Graphics.getSystemFont()
--- <strong>Noble Sans</strong>: A sans-serif 8×9 font, with English and Japanese-Kana character sets.
Noble.Text.FONT_SMALL = Graphics.font.new("libraries/noble/assets/fonts/NobleSans")
--- <strong>Noble Slab</strong>: (This font is not ready yet!)
Noble.Text.FONT_MEDIUM = Graphics.font.new("libraries/noble/assets/fonts/NobleSlab")
--- <strong>Satchel Roughed</strong>: A sans-serif 17×14 rounded font, with an English character set.
Noble.Text.FONT_LARGE = Graphics.font.new("libraries/noble/assets/fonts/SatchelRoughed")

--- Constants
---@section constants

--- An alternate way to call Playdate SDK's `kTextAlignment.left`
Noble.Text.ALIGN_LEFT = kTextAlignment.left
--- An alternate way to call Playdate SDK's `kTextAlignment.right`
Noble.Text.ALIGN_RIGHT = kTextAlignment.right
--- An alternate way to call Playdate SDK's `kTextAlignment.center`
Noble.Text.ALIGN_CENTER = kTextAlignment.center

local currentFont = Noble.Text.FONT_SYSTEM


--- Functions
---@section functions

---
---@return any 'The currently set font.'
function Noble.Text.getCurrentFont()
	return currentFont
end

--- Set the current font
---@param __font any 'any'
---@param __variant any 'any'
function Noble.Text.setFont(__font, __variant)
	currentFont = __font
	local variant = __variant or Graphics.font.kVariantNormal
	Graphics.setFont(__font, variant)
end

--- Abstracts multiple `playdate.text` drawing functions into one.
---@param __string string 'Display text or localization key.'
---@param __x number
---@param __y number
---@param __alignment? any 'Left, right, or center! Default: Noble.Text.ALIGN_LEFT'
---@param __localized? boolean 'If true, `__string` is a localization key rather than display text. Default: false'
---@param __font? any 'A font to use. If not set, the `currentFont` is used. If set, the `currentFont` is not updated. Default: Noble.Text.getCurrentFont()'
function Noble.Text.draw(__string, __x, __y, __alignment, __localized, __font)
	local alignment = __alignment or Noble.Text.ALIGN_LEFT
	local localized = Utilities.handleOptionalBoolean(__localized, false)
	local string = __string or ""

	if (__font ~= nil) then Graphics.setFont(__font) end --- Temporary font

	if (localized) then
		Graphics.drawLocalizedTextAligned(string, __x, __y, alignment)
	else
		Graphics.drawTextAligned(string, __x, __y, alignment)
	end

	if (__font ~= nil) then Graphics.setFont(currentFont) end --- Reset
end
