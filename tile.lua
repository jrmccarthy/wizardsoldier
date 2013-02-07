require 'lib/middleclass/middleclass'
require 'hex'

Tile = class('Tile')

function Tile:initialize( tileX, tileY, tileLayer )
	local hexLocs = {
		{0,0}
		,{40,0}
		,{62,-37}
		,{40,-72}
		,{0,-72}
		,{-20,-37}
		,{20,-37}
	}

	for i=1,7 do
		hex = Hex:new(i)

		-- create a sprite and initialize it
		hexSprite = MOAIProp2D.new ()
		hexSprite:setDeck ( hex.hexQuad )
		hexSprite:setLoc( tileX + hexLocs[i][1], tileY + hexLocs[i][2] )

		tileLayer:insertProp(hexSprite)
	end
end