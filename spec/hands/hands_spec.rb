module TheGambler
  describe Hand do
    include_examples "hands"
    
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
        it 'should value basic two-card hands', wip:true do
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
      
    end
  end
end
