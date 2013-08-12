require 'spec_helper'

module TheGambler

  describe Card do
    describe '#initialize' do
      
      it 'can take a String as its argument' do
        (->{ Card.new "AD" }).should_not raise_error
      end
      
      it 'can take an Array as its argument' do
        (->{ Card.new ['A', 'D'] }).should_not raise_error
      end
      
      it 'can take a Hash as its argument' do
        (->{ Card.new rank: 'A', suit: 'D' }).should_not raise_error
      end
      
      it 'can take a Card as its argument' do
        (->{ Card.new(Card.new rank: 'A', suit: 'D') }).should_not raise_error
      end

      it 'can take a Fixnum as its argument' do
        (->{ Card.new 39 }).should_not raise_error
      end
      
      describe 'with hash' do
        Card::RANKS.each do |rank|
          Card::SUIT_STRINGS.each_with_index do |suit, i|
            it "should correctly parse {rank: #{rank}, suit: #{suit}}" do
              card = Card.new rank: rank, suit: suit
              card.rank.should eq(rank)
              card.suit.should eq(Card::SUIT_SYMBOLS[i])
            end
          end
        end
      end
      
      describe 'with array' do
        Card::RANKS.each do |rank|
          Card::SUIT_STRINGS.each_with_index do |suit, i|
            it "should correctly parse [#{rank}, #{suit}]" do
              card = Card.new [rank, suit]
              card.rank.should eq(rank)
              card.suit.should eq(Card::SUIT_SYMBOLS[i])
            end
          end
        end
      end
      
      describe 'with string' do
        Card::RANKS.each do |rank|
          Card::SUIT_STRINGS.each_with_index do |suit, i|
            it "should correctly parse '#{rank}#{suit}'" do
              card = Card.new "#{rank}#{suit}"
              card.rank.should eq(rank)
              card.suit.should eq(Card::SUIT_SYMBOLS[i])
            end
          end
        end
      end

      describe 'with string' do
        (0..51).each do |i|
          it "should correctly parse #{i}" do
            card = Card.new i
            card.rank.should eq(Card::RANKS[i.zero? ? -1 : i % 13])
            card.suit.should eq(Card::SUIT_SYMBOLS[i / 13])
          end
        end
      end

    end
  
  end

end
