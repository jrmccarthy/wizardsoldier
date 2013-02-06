screenWidth = MOAIEnvironment.screenWidth
screenHeight = MOAIEnvironment.screenHeight

if screenWidth == nil then screenWidth = 960 end
if screenHeight == nil then screenHeight = 640 end

MOAISim.openWindow("Window",screenWidth,screenHeight)

viewport = MOAIViewport.new()
viewport:setSize(screenWidth,screenHeight)
viewport:setScale(screenWidth,screenHeight)
layer = MOAILayer2D.new()
layer:setViewport(viewport)

MOAISim.pushRenderPass(layer)

chars = 'HELOWRD'

font = MOAIFont.new()
font:loadFromTTF('arialbd.ttf',chars,120,72)


text = MOAITextBox.new()
text:setString('Hello world')
text:setFont(font)
text:setTextSize(120,72)
text:setYFlip(true)
text:setRect(-400,-300,400,300)
text:setAlignment(MOAITextBox.CENTER_JUSTIFY,MOAITextBox.CENTER_JUSTIFY)

layer:insertProp(text)