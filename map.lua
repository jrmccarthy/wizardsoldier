Tile = require 'tile'

local Map = class('Map')

function Map:initialize( tileCount, pattern, mapLayer )
	if pattern == 'wedge' then
		--for t=0,10 do
			Tile1 = Tile:new(0,0,mapLayer)

			--FIXME - replace '25' with hex.height
			-- Transform South-East from Tile1
			Tile2 = Tile:new(
				5 * cos30deg * 25 -- X
				, -1.5 * 25       -- Y
				, mapLayer        -- Render Layer
			)

			-- Transform South-West
			Tile3 = Tile:new(
				cos30deg * 25 -- X
				, -4.5 * 25       -- Y
				, mapLayer        -- Render Layer
			)
		--end
	end

	if pattern == 'columns' then
		--FIXME - replace '25' with hex.height
		-- Transform South-East from Tile1
		Tile1 = Tile:new(
			5 * cos30deg * 25 -- X
			, -1.5 * 25       -- Y
			, mapLayer        -- Render Layer
		)
		Tile2 = Tile:new(
				-4 * cos30deg * 25 -- X
				, -3 * 25       -- Y
				, mapLayer        -- Render Layer
			)
	end
end

return Map