Tile = require 'tile'

local Map = class('Map')

function Map:initialize( rowCount, pattern, mapLayer )
	self.rowCount = rowCount
	self.pattern = pattern
	self.mapLayer = mapLayer

	self:draw()
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
	end
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
	local Tile1 = Tile:new(
			posx
			, posy
			, self.mapLayer
		)
	return Tile1.x, Tile1.y
end

--Draw a tile that starts a new row (so, south east) in the wedge
function Map:draw_new_row( posx, posy )
	local Tile1
	if self.pattern == 'wedge' then
		Tile1 = Tile:new(
				5 * cos30deg * 25 + posx
				,  -1.5 * 25 + posy
				, self.mapLayer
			)
	end
	return Tile1.x, Tile1.y
end

--Draw a tile that continues the current row (so, south west) in the wedge
function Map:draw_next_in_row( posx, posy )
	local Tile1
	if self.pattern == 'wedge' then
		Tile1 = Tile:new(
				-4 * cos30deg * 25 + posx -- X
				, -3 * 25 + posy       -- Y
				, self.mapLayer        -- Render Layer
			)
	end
	return Tile1.x, Tile1.y
end

--Note: This function will be useful for drawing the Column, but not the wedge
-- function Map:draw_next_in_row( posx, posy )
-- 	local Tile1
-- 	if self.pattern == 'wedge' then
-- 		Tile1 = Tile:new(
-- 				cos30deg * 25 + posx
-- 				, -4.5 * 25 + posy
-- 				, self.mapLayer
-- 			)
-- 	end
-- 	return Tile1.x, Tile1.y
-- end

return Map
