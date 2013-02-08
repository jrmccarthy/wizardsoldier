Hex = require 'hex'

local Tile = class('Tile')

function Tile:initialize( tileX, tileY, tileLayer )
	local hexLocs = {
		{0,0}
		,{0.86,0}
		,{1.29,-0.75}
		,{0.86,-1.5}
		,{0,-1.5}
		,{-0.43,-0.75}
		,{0.43,-0.75}
	}

	for i=1,7 do
		hex = Hex:new(i)
		-- create a sprite and initialize it
		hexSprite = MOAIProp2D.new ()
		hexSprite:setDeck ( hex.hexQuad )
		hexSprite:setLoc(
			tileX + (hexLocs[i][1] * (hex.quadHeight * 2) )
			, tileY + (hexLocs[i][2]  * (hex.quadHeight * 2) )
		)

		tileLayer:insertProp(hexSprite)
	end
end

return Tile