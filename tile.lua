Hex = require 'hex'

local Tile = class('Tile')

function Tile:initialize( x, y, tileLayer )
	--Offset factor of each hex relative to its parent tile.
	self.hexOffsets = {
		{ 0,0 }
		,{ cos30deg,0 }
		,{ cos30deg * 1.5, -0.75 }
		,{ cos30deg, -1.5 }
		,{ 0, -1.5}
		,{ -( cos30deg / 2 ), -0.75 }
		,{ cos30deg / 2, -0.75 }
	}

	self.hexes = {}
	self.x = x
	self.y = y
	self.layer = tileLayer

	self:generateHexes()
end

function Tile:flip()
	 for hex,v in ipairs(self.hexes) do
	 	hex:flip()
	 end
end

function Tile:generateHexes()
	for i=1,7 do
		hex = Hex:new(i)
		-- create a sprite and initialize it
		hexSprite = MOAIProp2D.new ()
		hexSprite:setDeck ( hex.hexQuad )
		hexSprite:setLoc(
			self.x + (self.hexOffsets[i][1] * (hex.quadHeight * 2) )
			, self.y + (self.hexOffsets[i][2]  * (hex.quadHeight * 2) )
		)

		hex.tilePosition = i

		table.insert(hex, hexes)

		self.layer:insertProp(hexSprite)
	end
end

return Tile