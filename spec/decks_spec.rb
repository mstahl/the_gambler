module TheGambler
  describe Deck do

    let(:deck) { Deck.new }

    describe '#initialize' do
      it 'creates a shuffled array of cards at @contents' do
        expect(deck.contents).to be_a(Array)
      end

      it 'has 52 things in it' do
        expect(deck.contents.count).to eq(52)
      end

      it 'is filled with Cards' do
        deck.contents.each {|card| expect(card).to be_a(Card)}
      end
    end

    describe '#deal' do
      it 'returns a card' do
        card = deck.deal
        expect(card).to be_a(Card)
      end

      it 'removes the returned card from the deck' do
        card = deck.deal
        expect(deck.contents).not_to include(card)
      end

      context 'with an empty deck' do
        it 'raises an EmptyDeckException' do
          deck.contents.stub(:pop).and_return(nil)
          expect { deck.deal }.to raise_error
        end
      end
    end

  end
end
