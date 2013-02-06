require('lib/middleclass/middleclass')

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
		-- create a textured quad and initialize it
		hexQuad = MOAIGfxQuad2D.new()
		hexQuad:setTexture ( string.format('assets/images/hex%s.png', i )) -- load an image to use as the quad’s texture
		hexQuad:setRect ( -27, -24, 24, 24 ) -- set the world space dimensions of the quad

		-- create a sprite and initialize it
		hexSprite = MOAIProp2D.new ()
		hexSprite:setDeck ( hexQuad )
		hexSprite:setLoc( tileX - hexLocs[i][1], tileY - hexLocs[i][2] )

		tileLayer:insertProp(hexSprite)
	end
end