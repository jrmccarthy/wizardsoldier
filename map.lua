Tile = require 'tile'

local Map = class('Map')

function Map:initialize( rowCount, pattern, mapLayer )
	self.rowCount = rowCount
	self.pattern = pattern
	self.mapLayer = mapLayer

	self:draw()
end

function Map:draw()
	if self.pattern == 'wedge' then

		Tile1 = Tile:new(0,0,self.mapLayer)

		for t=1, self.rowCount do
			--FIXME - replace '25' with hex.height
			-- Transform South-East from Tile1
			Tile2 = Tile:new(
				5 * cos30deg * 25 * t -- X
				, -1.5 * 25 * t      -- Y
				, self.mapLayer        -- Render Layer
			)

			-- Transform South-West
			-- Tile3 = Tile:new(
			-- 	cos30deg * 25 * t -- X
			-- 	, -4.5 * 25 * t      -- Y
			-- 	, self.mapLayer        -- Render Layer
			-- )
		end
	end

	if self.pattern == 'columns' then
		--FIXME - replace '25' with hex.height
		-- Transform South-East from Tile1
		Tile1 = Tile:new(
			5 * cos30deg * 25 -- X
			, -1.5 * 25       -- Y
			, self.mapLayer        -- Render Layer
		)
		Tile2 = Tile:new(
				-4 * cos30deg * 25 -- X
				, -3 * 25       -- Y
				, self.mapLayer        -- Render Layer
			)
	end
end

return Map