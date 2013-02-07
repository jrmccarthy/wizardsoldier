require 'lib/middleclass/middleclass'
require 'hex'

Tile = class('Tile')

function Tile:initialize( tileX, tileY, tileLayer )
	local hexLocs = {
		{0,0}
		,{48,0}
		,{72,-36}
		,{48,-72}
		,{0,-72}
		,{-24,-36}
		,{24,-36}
	}

	for i=1,7 do
		texture = string.format('assets/images/hex%s.png', i )
		hex = Hex:new(texture) -- load an image to use as the quad’s texture

		-- create a sprite and initialize it
		hexSprite = MOAIProp2D.new ()
		hexSprite:setDeck ( hex.hexQuad )
		hexSprite:setLoc( tileX + hexLocs[i][1], tileY + hexLocs[i][2] )

		tileLayer:insertProp(hexSprite)
	end
end