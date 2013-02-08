require('lib/middleclass/middleclass')

Map = require "map"

screenWidth = MOAIEnvironment.screenWidth
screenHeight = MOAIEnvironment.screenHeight

if screenWidth == nil then screenWidth = 960 end
if screenHeight == nil then screenHeight = 640 end

MOAISim.openWindow("Window",screenWidth,screenHeight)

viewport = MOAIViewport.new()
viewport:setSize(screenWidth,screenHeight)
viewport:setScale(screenWidth,screenHeight)

mapLayer = MOAILayer2D.new()
mapLayer:setViewport(viewport)
MOAISim.pushRenderPass(mapLayer)

tableauLayer = MOAILayer2D.new()
tableauLayer:setViewport(viewport)
MOAISim.pushRenderPass(tableauLayer)

chars = 'MAPTBLUYER'

font = MOAIFont.new()
font:loadFromTTF('assets/arialbd.ttf',chars,120,72)

--Draw some tiles

myMap = Map:new(5,"wedge",mapLayer)

tableauText = MOAITextBox.new()
tableauText:setString('Tableau')
tableauText:setFont(font)
tableauText:setTextSize(120,72)
tableauText:setYFlip(true)
tableauText:setRect(-490,-(screenHeight+120),400,300)
tableauText:setAlignment(MOAITextBox.CENTER_JUSTIFY,MOAITextBox.CENTER_JUSTIFY)
tableauText:spool()

mapLayer:insertProp(tableauText)