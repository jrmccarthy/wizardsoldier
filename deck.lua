require('lib/middleclass/middleclass')
require('library')

BaseDeck = class("BaseDeck")

--Base class that other decks can inherit from
function BaseDeck:initialize()
	self.library = Library:new()
	self.hand = {}
	self.graveyard = {}
end

function BaseDeck:gain( card, location, order )
	location = location or "library"
	order = order or "top"
	assert(card ~= nil, 'Must specify a card')

	--Add the card to the location, in the order specified
	self[location]:gain(card, order)
end

--Trash a card from a location
function BaseDeck:trash( card, location )
	assert(card ~= nil, "Must specify a card")
	assert(location ~= nil, "Must specify a location")

	--Remove the card from the location?
	-- TODO
end

function BaseDeck:shuffle( location )
	location = location or "library"
	--Redo ordering of that location
	self[location]:shuffle()
end



