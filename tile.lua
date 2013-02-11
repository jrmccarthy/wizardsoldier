Hex = require 'hex'

local Tile = class('Tile')

function Tile:initialize( tileX, tileY, tileLayer )
	--Offset factor of each hex relative to its parent tile.
	local hexOffsets = {
		{ 0,0 }
		,{ cos30deg,0 }
		,{ cos30deg * 1.5, -0.75 }
		,{ cos30deg, -1.5 }
		,{ 0, -1.5}
		,{ -( cos30deg / 2 ), -0.75 }
		,{ cos30deg / 2, -0.75 }
	}

	for i=1,7 do
		hex = Hex:new(i)
		-- create a sprite and initialize it
		hexSprite = MOAIProp2D.new ()
		hexSprite:setDeck ( hex.hexQuad )
		hexSprite:setLoc(
			tileX + (hexOffsets[i][1] * (hex.quadHeight * 2) )
			, tileY + (hexOffsets[i][2]  * (hex.quadHeight * 2) )
		)

		tileLayer:insertProp(hexSprite)
	end
end

return Tile