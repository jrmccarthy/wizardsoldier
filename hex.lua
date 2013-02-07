require('lib/middleclass/middleclass')

Hex = class('Hex')

function Hex:initialize( locationIndex )
	texture = string.format('assets/images/hex%s.png', locationIndex )
	-- create a textured quad and initialize it
	self.hexQuad = MOAIGfxQuad2D.new()
	self.hexQuad:setTexture ( texture ) -- load an image to use as the quad’s texture
	self.hexQuad:setRect ( -25, -25, 25, 25 ) -- set the world space dimensions of the quad
end

--Apply a terrain type to this hex. If no site type is passed, generate one.
function Hex:setTerrainType( terrain )
	if terrain ~= nil then
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

--Apply a site type to this hex. If no site type is passed, generate one.
function Hex:setSiteType( site )
	if enemy ~= nil then
		return enemy
	end

	siteTypes = {
		"none"
		, "orc"
		, "keep"
		, "mage"
		, "dungeon"
		, "city"
		, "dragon"
		, "shrine"
		, "mine"
		, "fountain"
	}
	return enemyTypes[ math.random(7) ]
end