require('lib/middleclass/middleclass')

Hex = class('Hex')

function Hex:initialize( texture )
	-- create a textured quad and initialize it
	self.hexQuad = MOAIGfxQuad2D.new()
	self.hexQuad:setTexture ( texture ) -- load an image to use as the quad’s texture
	self.hexQuad:setRect ( -27, -24, 24, 24 ) -- set the world space dimensions of the quad
end

function Hex:setTerrainType( terrain )
	if terrain != nil then
		return terrain
	end

	terrainTypes = {
		"grass"       --2
		, "hills"     --3
		, "swamp"     --3/5
		, "wasteland" --4
		, "desert"    --5/3
		, "water"     -- X
		, "mountains" -- X
	}

	return terrainTypes[ math.random(7) ]
end

function Hex:setEnemyType( enemy )
	if enemy != nil then
		return enemy
	end

	enemyTypes = {
		"orc"
		, "keep"
		, "mage"
		, "dungeon"
		, "city"
		, "dragon"
		, "shrine"
	}
	return enemyTypes[ math.random(7) ]
end