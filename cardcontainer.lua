require('lib/middleclass/middleclass')

CardContainer = class("CardContainer")

function test( )
	l = CardContainer:new()
	l:gain('a')
	l:gain('b')
	l:gain('c')
	l:gain('d')
end

--Base CardContainer class, which goes in BaseDeck
function CardContainer:initialize( )
	self.cards = {}

end

function CardContainer:shuffle( )
	--Try out Fisher-Yates algorithm, from wikipedia
	for i = table.getn(self.cards), 1, -1 do
		local r = math.random(i)
		self.cards[i], self.cards[r] = self.cards[r], self.cards[i]
	end
end

function CardContainer:gain( card, position )
	position = position or "top"

	if position == "bottom" then
		table.insert(self.cards, card)
	elseif position == "top" then
		--Insert on top, ugh
		local tmp = {}
		for k, v in ipairs(self.cards) do
			tmp[k+1] = v
		end
		tmp[1] = card
		self.cards = tmp
	end
end


--Trash a card at the given index
function CardContainer:trash( index )
	assert(index <= table.getn(self.cards), 'Index out of range')

	--Remove the card from the card list and discard it altogether
	self:_pop(index)
end

function CardContainer:pop( index )
	return self:_pop(index)
end

function CardContainer:_pop( index )
	assert(index <= table.getn(self.cards), 'Index out of range')
	card = self.cards[index]

	for i = index, table.getn(self.cards), 1 do
		self.cards[i] = self.cards[i+1]
	end

	return card
end
