require('lib/middleclass/middleclass')
local Map = require "map"

--Globals
cos30deg = (math.cos(30 * (math.pi/180)))

local font = MOAIFont.new()
font:loadFromTTF('assets/arialbd.ttf',"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789",120,72)

local screen_width = MOAIEnvironment.horizontalResolution
local screen_height = MOAIEnvironment.verticalResolution

if screen_width == nil then screen_width = 960 end
if screen_height == nil then screen_height = 640 end

MOAISim.openWindow("Wizard Soldier v0.01",screen_width,screen_height)

local map_viewport = MOAIViewport.new()
map_viewport:setSize(screen_width,screen_height)
map_viewport:setScale(screen_width,screen_height)

local tableau_viewport = MOAIViewport.new()
tableau_viewport:setSize(screen_width,screen_height)
tableau_viewport:setScale(screen_width,screen_height)

local map_layer = MOAILayer2D.new()
map_layer:setViewport(map_viewport)

local tableauLayer = MOAILayer2D.new()
tableauLayer:setViewport(tableau_viewport)

local layers = {}
table.insert(layers, map_layer)
table.insert(layers, tableauLayer)

MOAIRenderMgr.setRenderTable(layers)

GameMap = Map:new(5,"wedge",map_layer)

local tableQuad = MOAIGfxQuad2D.new()
tableQuad:setTexture ( 'assets/images/wood.png' ) -- load an image to use as the quad’s texture
tableQuad:setRect ( 0, 0, 960, 200 ) -- set the world space dimensions of the quad
tableSprite = MOAIProp2D.new ()
tableSprite:setDeck ( tableQuad )
tableSprite:setLoc( (screen_width /2 ) * -1, -320)
tableauLayer:insertProp(tableSprite)

map_viewport.offsetX = 0
map_viewport.offsetY = 0
map_viewport.scaleFactor = 1

MOAIInputMgr.device.keyboard:setCallback(
    function(key,down)
        if down==true then
        	if string.char(tostring(key)) == 'w' then
        		map_viewport.offsetY = map_viewport.offsetY + 0.2
        		map_viewport:setOffset(map_viewport.offsetX,map_viewport.offsetY)
        	elseif string.char(tostring(key)) == 'a' then
        		map_viewport.offsetX = map_viewport.offsetX - 0.2
        		map_viewport:setOffset(map_viewport.offsetX,map_viewport.offsetY)
        	elseif string.char(tostring(key)) == 's' then
        		map_viewport.offsetY = map_viewport.offsetY - 0.2
        		map_viewport:setOffset(map_viewport.offsetX,map_viewport.offsetY)
        	elseif string.char(tostring(key)) == 'd' then
        		map_viewport.offsetX = map_viewport.offsetX + 0.2
        		map_viewport:setOffset(map_viewport.offsetX,map_viewport.offsetY)
	        elseif key == 61 then -- 'plus' key
                map_viewport.scaleFactor = map_viewport.scaleFactor - 0.1
	        	map_viewport:setScale(screen_width * map_viewport.scaleFactor,screen_height * map_viewport.scaleFactor)
            elseif key == 45 then -- 'minus' key
                map_viewport.scaleFactor = map_viewport.scaleFactor + 0.1
                map_viewport:setScale(screen_width * map_viewport.scaleFactor,screen_height * map_viewport.scaleFactor)
	        elseif key == 27 then -- 'escape' key
                os.exit()
            end
        end
    end
)
