Tile = require 'tile'

local Map = class('Map')

local TILES_PER_ROW = 3

function Map:initialize( rowCount, pattern, mapLayer )
	self.rowCount = rowCount
	self.pattern = pattern
	self.mapLayer = mapLayer
	self.tiles = {}

	self:draw()
end

function Map:flipAllTiles()

	for k,tile in pairs(self.tiles) do
		tile:flip()
	end
end

function Map:draw()
	--Draw the origin tile first
	local drawstyle = "draw_origin"
	local posx, posy = 0,0
	local rposx, rposy = 0,0
	local per_row = 1
	if self.pattern == 'wedge' then
		for row=1, self.rowCount do
			--Do the first iteration of the Tile Drawing outside the for loop so we can store the
			--position of the first thing we draw for later, when we start the next row
			posx, posy = self:_draw_tile( drawstyle, rposx, rposy)
			--Store the position of the first item in the row so we can hop down on the next row
			rposx, rposy = posx, posy
			drawstyle = 'draw_next_in_row'
			--Draw the rest of the tiles in the row
			for tile=2, per_row do
				posx, posy = self:_draw_tile( drawstyle, posx, posy)
				drawstyle = 'draw_next_in_row'
			end
			--Get ready to draw the next row, and increase row size by one on each iteration
			drawstyle = 'draw_new_row'
			per_row = per_row + 1
		end
	elseif self.pattern == 'column' then
		--Basically the same above, except we always have 3 tiles per row and we start rows slightly differently
		per_row = TILES_PER_ROW
		for row=1, self.rowCount do
			posx, posy = self:_draw_tile( drawstyle, rposx, rposy )
			rposx, rposy = posx, posy
			drawstyle = 'draw_next_in_row'
			for tile=2, per_row do
				posx, posy = self:_draw_tile( drawstyle, posx, posy )
				drawstyle = 'draw_next_in_row'
			end
			drawstyle = 'draw_new_row'
		end
	end
	self:flipAllTiles()
end

--Annoying helper class because i cant abuse references like python
function Map:_draw_tile( style, posx, posy )
	if style == 'draw_origin' then
		return self:draw_origin( posx, posy )
	elseif style == 'draw_new_row' then
		return self:draw_new_row( posx, posy )
	elseif style == 'draw_next_in_row' then
		return self:draw_next_in_row( posx, posy )
	end
end


--Draw the first tile, and return the location you were given
function Map:draw_origin( posx, posy )
	local tile = Tile:new(
			posx
			, posy
			, self.mapLayer
		)
	table.insert(self.tiles, tile)
	return tile.x, tile.y
end

--Draw a tile that starts a new row (so, south east in the wedge or south maybe in the column)
function Map:draw_new_row( posx, posy )
	local tile
	if self.pattern == 'wedge' then
		tile = Tile:new(
				5 * cos30deg * 25 + posx -- X
				,  -1.5 * 25 + posy      -- Y
				, self.mapLayer          -- Render Layer
			)
	elseif self.pattern == 'column' then
		tile = Tile:new(
				cos30deg * 25 + posx   -- X
				, -4.5 * 25 + posy     -- Y
				, self.mapLayer        -- Render Layer
			)
	end
	table.insert(self.tiles, tile)
	return tile.x, tile.y
end

--Draw a tile that continues the current row (so, south west)
function Map:draw_next_in_row( posx, posy )
	local tile
	if self.pattern == 'wedge' then
		tile = Tile:new(
				-4 * cos30deg * 25 + posx -- X
				, -3 * 25 + posy       -- Y
				, self.mapLayer        -- Render Layer
			)
	elseif self.pattern == 'column' then
		tile = Tile:new(
				-4 * cos30deg * 25 + posx -- X
				, -3 * 25 + posy       -- Y
				, self.mapLayer        -- Render Layer
			)
	end
	table.insert(self.tiles, tile)
	return tile.x, tile.y
end

return Map
