require('lib/middleclass/middleclass')
require('cardcontainer')
require('player')

GameState = class("GameState")

function GameState:initialize( new )
	if new then
		self:create_new()
	end


function GameState:create_new( player_list, scenario )
	--do stuff
	print("Create a new game state")
	self.players = {}
	for key, knight in ipairs(player_list) do
		self.players[key] = Player:new( knight )

	--Do any scenario specific magic?

	--Map
	self.map = nil

	--Day/ Night
	self.day = true

	--trash
	self.trash = CardContainer:new()

	--turn
	self.turn = 1

	--round
	self.round = 1

	--common_skills
	self.common_skills = CardContainer:new()

	--spells
	self.spells = self:_setup_spells()

	--advanced actions
	self.advanced_actions = self:_setup_advanced_actions()

	--relics
	self.relics = self:_setup_relics()

	--units
	self.units = self:_setup_units()

	--tactics
	self.tactics = self:_setup_tactics()

	--enemies
	self.enemies = self:_setup_enemies()

	--mana_source
	self.mana_source = self:_setup_mana_source()
end

function GameState:_setup_spells( )
	--TODO: Figure out how to create the spell deck
	return CardContainer:new()
end

function GameState:_setup_advanced_actions( )
	--TODO: Figure out how to create the advanced action deck
	return CardContainer:new()
end

function GameState:_setup_relics( )
	--TODO: Figure out how to create the relic deck
	return CardContainer:new()
end

function GameState:_setup_spells( )
	--TODO: Figure out how to create the spell deck
	return CardContainer:new()
end

function GameState:_setup_spells( )
	--TODO: Figure out how to create the spell deck
	return CardContainer:new()
end

function GameState:_setup_spells( )
	--TODO: Figure out how to create the spell deck
	return CardContainer:new()
end

function GameState:_setup_spells( )
	--TODO: Figure out how to create the spell deck
	return CardContainer:new()
end

function GameState:load( players, current_player, map, turn_order, day, trash, turn, round, common_skills, spells, advanced_actions, relics, units, tactics, enemies, mana_source )
	--Do other stuff
	print("Load a game state")
end

