require 'spec_helper'

module TheGambler
  SUIT_STRINGS = %w{S C H D}
  SUIT_SYMBOLS = %w{spades clubs hearts diamonds}.map(&:to_sym)
  RANKS        = %w{A 2 3 4 5 6 7 8 9 10 J Q K}
  
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
      
      describe 'with hash' do
        RANKS.each do |rank|
          SUIT_STRINGS.each_with_index do |suit, i|
            it "should correctly parse {rank: #{rank}, suit: #{suit}}" do
              card = Card.new rank: rank, suit: suit
              card.rank.should eq(rank)
              card.suit.should eq(SUIT_SYMBOLS[i])
            end
          end
        end
      end
      
      describe 'with array' do
        RANKS.each do |rank|
          SUIT_STRINGS.each_with_index do |suit, i|
            it "should correctly parse [#{rank}, #{suit}]" do
              card = Card.new rank: rank, suit: suit
              card.rank.should eq(rank)
              card.suit.should eq(SUIT_SYMBOLS[i])
            end
          end
        end
      end
      
      describe 'with string' do
        RANKS.each do |rank|
          SUIT_STRINGS.each_with_index do |suit, i|
            it "should correctly parse '#{rank}#{suit}'" do
              card = Card.new "#{rank}#{suit}"
              card.rank.should eq(rank)
              card.suit.should eq(SUIT_SYMBOLS[i])
            end
          end
        end
      end

    end
  
  end

end
