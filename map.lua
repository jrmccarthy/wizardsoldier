Tile = require 'tile'

local Map = class('Map')

function Map:initialize( tileCount, pattern, mapLayer )
	if pattern == 'wedge' then
		for t=0,5 do
			Tile1 = Tile:new(1 * t*10,1 * t*10,mapLayer)
		end
	end

	if pattern == 'columns' then

	end
end

return Map