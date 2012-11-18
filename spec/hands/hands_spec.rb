require 'spec_helper'

module TheGambler
  
  describe Hand do
    
    include_examples "poker hands"
    
    describe '#blackjack?' do
      it 'should identify JH AC as a blackjack' do
        Hand.new(*%w{JH AC}).should be_blackjack
      end
      
      it 'should not identify AC 4D as a blackjack' do
        Hand.new(*%w{AC 4D}).should_not be_blackjack
      end
    end
    
    describe '#blackjack_value' do
      context 'without aces' do
        it 'should value basic two-card hands' do
          Hand.new(*%w{2D 9D}).blackjack_value.should eq(11)
        end
      
        it 'should value hands with face cards' do
          Hand.new(*%w{QD 8C}).blackjack_value.should eq(18)
        end
      end
      
      context 'with aces' do
        it 'should value a soft 19' do
          Hand.new(*%w{AD 8C}).blackjack_value.should eq(19)
        end
        
        it 'should value 21 with two face cards' do
          Hand.new(*%w{QD JC AH}).blackjack_value.should eq(21)
        end
        
        it 'should value 21 with 5 cards' do
          Hand.new(*%w{5D 2D 3C 10H AS}).blackjack_value.should eq(21)
        end
      end
      
    end
    
    describe '#poker_value' do
      it 'should value a royal_flush over a straight_flush' do
        royal_flush.poker_value.should > straight_flush.poker_value
      end
      
      it 'should value a straight_flush over a four_of_a_kind' do
        straight_flush.poker_value.should > four_of_a_kind.poker_value
      end
      
      it 'should value a four_of_a_kind over a full_house' do
        four_of_a_kind.poker_value.should > full_house.poker_value
      end
      
      it 'should value a full_house over a flush' do
        full_house.poker_value.should > flush.poker_value
      end
      
      it 'should value a flush over a straight' do
        flush.poker_value.should > straight.poker_value
      end
      
      it 'should value a straight over a three_of_a_kind', wip:true do
        straight.poker_value.should > three_of_a_kind.poker_value
      end
      
      it 'should value a three_of_a_kind over a two_pair' do
        three_of_a_kind.poker_value.should > two_pair.poker_value
      end
      
      it 'should value a two_pair over a one_pair' do
        two_pair.poker_value.should > one_pair.poker_value
      end
      
      it 'should value a one_pair over a high_card' do
        one_pair.poker_value.should > high_card.poker_value
      end
    end
    
    describe '#royal_flush?' do
      it 'should identify royal flushes' do
        royal_flush.royal_flush?.should be_true
      end
    end
    
    describe '#straight_flush' do
      it 'should identify straight flushes' do
        straight_flush.straight_flush?.should be_true
      end
    end
    
    describe '#four_of_a_kind' do
      it 'should identify four of a kind' do
        four_of_a_kind.four_of_a_kind?.should be_true
      end
    end
    
    describe '#full_house' do
      it 'should identify full houses' do
        full_house.full_house?.should be_true
      end
    end
    
    describe '#flush' do
      it 'should identify flushes' do
        flush.flush?.should be_true
        straight_flush.flush?.should be_true
      end
    end
    
    describe '#straight' do
      it 'should identify straights' do
        straight.straight?.should be_true
        straight_flush.straight?.should be_true
      end
    end
    
    describe '#three_of_a_kind' do
      it 'should identify three of a kind' do
        three_of_a_kind.three_of_a_kind?.should be_true
      end
    end
    
    describe '#two_pair' do
      it 'should identify two pair' do
        two_pair.two_pair?.should be_true
      end
    end
    
    describe '#one_pair' do
      it 'should identify one pair' do
        one_pair.one_pair?.should be_true
      end
    end
    
    describe '#high_card' do
      it 'should identify high card' do
        high_card.high_card?.should be_true
      end
    end
    
    
  end
end
