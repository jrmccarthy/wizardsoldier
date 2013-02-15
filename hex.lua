local Hex = class('Hex')

Hex.quadHeight = 25
Hex.quadWidth = 25
Hex.width = math.cos(30) * Hex.quadWidth

function Hex:initialize( locationIndex )
	self.texturePath = "assets/images/"
	self:setTerrainType()
	self:setSiteType()

	texture = string.format('%shex%s.png', self.texturePath, locationIndex )
	-- create a textured quad and initialize it
	self.hexQuad = MOAIGfxQuad2D.new()
	self.hexQuad:setTexture ( texture ) -- load an image to use as the quad’s texture
	self.hexQuad:setRect ( -25, -25, 25, 25 ) -- set the world space dimensions of the quad
end

--Apply a terrain type to this hex. If no site type is passed, generate one.
function Hex:setTerrainType( terrain )
	terrainTypes = {
		{"grass",string.format('%shex_%s.png', self.texturePath, "grass")}
		, {"hills",string.format('%shex_%s.png', self.texturePath, "hills")}
		, {"swamp",string.format('%shex_%s.png', self.texturePath, "swamp")}
		, {"wasteland",string.format('%shex_%s.png', self.texturePath, "wasteland")}
		, {"desert",string.format('%shex_%s.png', self.texturePath, "desert")}
		, {"water",string.format('%shex_%s.png', self.texturePath, "water")}
		, {"mountains",string.format('%shex_%s.png', self.texturePath, "mountains")}
	}

	if terrain ~= nil then
		return terrain[terrain]
	end

	self.terrainType = terrainTypes[ math.random(7) ]
end

--Apply a site type to this hex. If no site type is passed, generate one.
function Hex:setSiteType( site )
	if site ~= nil then
		return site
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
	self.siteType = siteTypes[ math.random(10) ]
end

return Hex
