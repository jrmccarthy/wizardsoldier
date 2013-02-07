require('lib/middleclass/middleclass')
require('cardcontainer')

Player = class("Player")

knights = {
	'Lancelot', --Arythea
	'Percival', --Goldyx
	'Galahad',  --Norowas
	'Gareth',   --Tovak
}

function Player:initialize( knight, starting_fame, starting_level, starting_influence )
	--Initialize the player: Set their knight
	self.knight = knight

	--Build their starting deck
	--TODO: Write a function that takes in a knight and returns a CardContainer object full of that knight's deck
	self.cards = _build_deck( knight )

	--Set up their empty unit deck
	self.units = CardContainer:new()

	--Set up their Common Skills deck
	--TODO: Write a function that takes in a knight and returns a CardContainer object full of that knight's common skills
	self.common_skills = _build_common_skills( knight )

	--Set up their level / xp / fame
	self.fame = starting_fame or 0
	self.level = starting_level or 1

	--Set up their influence
	self.influence = starting_influence or 0

	--Set up their inventory (crystal energy)
	--TODO: Figure out if Inventory is just a deck, and if not, build an Inventory data structure and an init function
	self.inventory = {}

	--Set up their conquests list
	self.conquests = {}

	--Set up their tactic holder
	self.tactic_card = nil

function _build_deck( knight )
	--TODO: Get all the cards, stuff them in the deck, shuffle the deck
	local deck = CardContainer:new()

	return deck

function _build_common_skills( knight )
	--TODO: Get all the skills, stuff them in the deck, shuffle the deck
	local skills = CardContainer:new()

	return skills
