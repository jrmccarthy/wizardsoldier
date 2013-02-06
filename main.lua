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

-- create a textured quad and initialize it
hex1Quad = MOAIGfxQuad2D.new ()
hex1Quad:setTexture ( 'assets/images/hex1.png' ) -- load an image to use as the quad’s texture
hex1Quad:setRect ( -27, -24, 24, 24 ) -- set the world space dimensions of the quad

-- create a sprite and initialize it
hex1Sprite = MOAIProp2D.new ()
hex1Sprite:setDeck ( hex1Quad )
hex1Sprite:setLoc(0,0)

-- create a textured quad and initialize it
hex2Quad = MOAIGfxQuad2D.new ()
hex2Quad:setTexture ( 'assets/images/hex2.png' ) -- load an image to use as the quad’s texture
hex2Quad:setRect ( -27, -24, 24, 24 ) -- set the world space dimensions of the quad

-- create a sprite and initialize it
hex2Sprite = MOAIProp2D.new ()
hex2Sprite:setDeck ( hex2Quad )
hex2Sprite:setLoc(48,0)

-- create a textured quad and initialize it
hex3Quad = MOAIGfxQuad2D.new ()
hex3Quad:setTexture ( 'assets/images/hex3.png' ) -- load an image to use as the quad’s texture
hex3Quad:setRect ( -27, -24, 24, 24 ) -- set the world space dimensions of the quad

-- create a sprite and initialize it
hex3Sprite = MOAIProp2D.new ()
hex3Sprite:setDeck ( hex3Quad )
hex3Sprite:setLoc(72,-36)

-- create a textured quad and initialize it
hex4Quad = MOAIGfxQuad2D.new ()
hex4Quad:setTexture ( 'assets/images/hex4.png' ) -- load an image to use as the quad’s texture
hex4Quad:setRect ( -27, -24, 24, 24 ) -- set the world space dimensions of the quad

-- create a sprite and initialize it
hex4Sprite = MOAIProp2D.new ()
hex4Sprite:setDeck ( hex4Quad )
hex4Sprite:setLoc(48,-72)

-- create a textured quad and initialize it
hex5Quad = MOAIGfxQuad2D.new ()
hex5Quad:setTexture ( 'assets/images/hex5.png' ) -- load an image to use as the quad’s texture
hex5Quad:setRect ( -27, -24, 24, 24 ) -- set the world space dimensions of the quad

-- create a sprite and initialize it
hex5Sprite = MOAIProp2D.new ()
hex5Sprite:setDeck ( hex5Quad )
hex5Sprite:setLoc(0,-72)

-- create a textured quad and initialize it
hex6Quad = MOAIGfxQuad2D.new ()
hex6Quad:setTexture ( 'assets/images/hex6.png' ) -- load an image to use as the quad’s texture
hex6Quad:setRect ( -27, -24, 24, 24 ) -- set the world space dimensions of the quad

-- create a sprite and initialize it
hex6Sprite = MOAIProp2D.new ()
hex6Sprite:setDeck ( hex6Quad )
hex6Sprite:setLoc(-24,-36)

-- create a textured quad and initialize it
hex7Quad = MOAIGfxQuad2D.new ()
hex7Quad:setTexture ( 'assets/images/hex7.png' ) -- load an image to use as the quad’s texture
hex7Quad:setRect ( -27, -24, 24, 24 ) -- set the world space dimensions of the quad

-- create a sprite and initialize it
hex7Sprite = MOAIProp2D.new ()
hex7Sprite:setDeck ( hex7Quad )
hex7Sprite:setLoc(24,-36)

mapText = MOAITextBox.new()
mapText:setString('Map Layer')
mapText:setFont(font)
mapText:setTextSize(120,72)
mapText:setYFlip(true)
mapText:setRect(-400,-300,400,300)
mapText:setAlignment(MOAITextBox.CENTER_JUSTIFY,100)
mapText:spool()

mapLayer:insertProp(mapText)
mapLayer:insertProp(hex1Sprite)
mapLayer:insertProp(hex2Sprite)
mapLayer:insertProp(hex3Sprite)
mapLayer:insertProp(hex4Sprite)
mapLayer:insertProp(hex5Sprite)
mapLayer:insertProp(hex6Sprite)
mapLayer:insertProp(hex7Sprite)

tableauText = MOAITextBox.new()
tableauText:setString('Tableau Layer')
tableauText:setFont(font)
tableauText:setTextSize(120,72)
tableauText:setYFlip(true)
tableauText:setRect(-490,-(screenHeight+120),400,300)
tableauText:setAlignment(MOAITextBox.CENTER_JUSTIFY,MOAITextBox.CENTER_JUSTIFY)
tableauText:spool()

mapLayer:insertProp(tableauText)