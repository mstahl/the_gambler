require 'spec_helper'

module TheGambler
  describe "straight flush hands" do
    
    %w{S C H D}.each do |suit|
      let(:nine_high) { Hand.new("5#{suit}", "6#{suit}", "7#{suit}", "8#{suit}", "9#{suit}")  }
      let(:five_high) { Hand.new("5#{suit}", "4#{suit}", "3#{suit}", "2#{suit}", "A#{suit}")  }
      let(:ace_high)  { Hand.new("10#{suit}", "J#{suit}", "K#{suit}", "Q#{suit}", "A#{suit}") }
      
      it 'should recognize a trivial straight flush' do
        nine_high.straight_flush?.should be_true
      end
    
      it 'should recognize a 5-high straight flush' do
        five_high.straight_flush?.should be_true
      end
    
      it 'should recognize an ace-high straight flush' do
        ace_high.straight_flush?.should be_true
      end
      
      describe 'valuation' do
        it 'should recognize that a 9-high straight flush is more valuable than a 5-high flush' do
          nine_high.poker_value.should > five_high.poker_value
        end
      
        it 'should recognize that an ace-high straight flush is more valuable than a 9-high straight flush' do
          ace_high.poker_value.should > nine_high.poker_value
        end
      
        it 'should recognize that an ace-high straight flush is more valuable than a 5-high straight flush' do
          ace_high.poker_value.should > five_high.poker_value
        end
      
      end
    end
    
  end
end
