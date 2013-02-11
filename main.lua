require('lib/middleclass/middleclass')
Map = require "map"

--Globals
cos30deg = (math.cos(30 * (math.pi/180)))

font = MOAIFont.new()
font:loadFromTTF('assets/arialbd.ttf',"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789",120,72)

screen_width = MOAIEnvironment.screen_width
screen_height = MOAIEnvironment.screen_height

if screen_width == nil then screen_width = 960 end
if screen_height == nil then screen_height = 640 end

MOAISim.openWindow("Wizard Soldier v0.01",screen_width,screen_height)

map_viewport = MOAIViewport.new()
map_viewport:setSize(screen_width,screen_height * 0.66)
map_viewport:setScale(screen_width,screen_height * 0.66)

tableau_viewport = MOAIViewport.new()
tableau_viewport:setSize(screen_width,screen_height*0.33)
tableau_viewport:setScale(screen_width,screen_height*0.33)

map_layer = MOAILayer2D.new()
map_layer:setViewport(map_viewport)

tableau_layer = MOAILayer2D.new()
tableau_layer:setViewport(tableau_viewport)

layers = {}
table.insert(layers, map_layer)
table.insert(layers, tableau_layer)

MOAIRenderMgr.setRenderTable(layers)

myMap = Map:new(5,"wedge",map_layer)

-- myQuad = MOAIGfxQuad2D.new()
-- myQuad:setTexture("assets/images/turtle.png")
-- myQuad:setRect(-25, -25, 25, 25)

-- myImage = MOAIProp2D.new()
-- myImage:setDeck(myQuad)
-- myImage:setLoc(0,0)

tableau_layer:insertProp(myImage)

tableau_text = MOAITextBox.new()
tableau_text:setString('Tableau')
tableau_text:setFont(font)
tableau_text:setYFlip(true)
tableau_text:setTextSize(120,72)
tableau_text:setRect(-400,-300,400,300)
tableau_text:setAlignment(MOAITextBox.CENTER_JUSTIFY,MOAITextBox.CENTER_JUSTIFY)
tableau_text:spool()

tableau_layer:insertProp(tableau_text)

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
	        elseif key == 61 then-- 'plus' sign
                map_viewport.scaleFactor = map_viewport.scaleFactor - 0.1
	        	map_viewport:setScale(screen_width * map_viewport.scaleFactor,screen_height * map_viewport.scaleFactor)
            elseif key == 45 then-- 'minus' sign
                map_viewport.scaleFactor = map_viewport.scaleFactor + 0.1
                map_viewport:setScale(screen_width * map_viewport.scaleFactor,screen_height * map_viewport.scaleFactor)
	        end
        end
    end
)