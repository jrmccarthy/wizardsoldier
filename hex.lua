require('lib/middleclass/middleclass')

Hex = class('Hex')

function Hex:initialize( texture )
	-- create a textured quad and initialize it
	self.hexQuad = MOAIGfxQuad2D.new()
	self.hexQuad:setTexture ( texture ) -- load an image to use as the quad’s texture
	self.hexQuad:setRect ( -27, -24, 24, 24 ) -- set the world space dimensions of the quad
end

function Hex:setTerrainType( terrain )
	terrainTypes = {
		"grass"       --2
		, "hills"     --3
		, "swamp"     --3/5
		, "wasteland" --4
		, "desert"    --5/3
		, "water"     -- X
		, "mountains" -- X
	}
end

function Hex:setEnemyType( enemy )

end