require('lib/middleclass/middleclass')
require('cardcontainer')

BaseDeck = class("BaseDeck")

--Base class that other decks can inherit from
function BaseDeck:initialize()
	self.library = CardContainer:new()
	self.hand = CardContainer:new()
	self.graveyard = CardContainer:new()
end

function BaseDeck:gain( card, location, order )
	location = location or "library"
	order = order or "top"
	assert(card ~= nil, 'Must specify a card')

	--Add the card to the location, in the order specified
	self[location]:gain(card, order)
end

--Trash a card from a location
function BaseDeck:trash( index, location )
	assert(location ~= nil, "Must specify a location")
	assert(index ~= nil, "Must specify a card")

	--Remove the card from the location?
	self[location]:trash(index)
end

function BaseDeck:shuffle( location )
	location = location or "library"
	
	--Redo ordering of that location
	self[location]:shuffle()
end



