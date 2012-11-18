require 'spec_helper'

module TheGambler
  describe "straight hands" do
    
    let(:ten_high)  { Hand.new('6D', '7C', '8D', '9D', '10C') }
    let(:nine_high) { Hand.new('5D', '6C', '7D', '8D', '9C') }
    let(:ace_high)  { Hand.new('AD', 'KC', 'QD', 'JD', '10C') }
    let(:five_high) { Hand.new('AD', '2C', '3D', '4D', '5C') }
    
    it 'should recognize a trivial straight' do
      Hand.new(*%w{5D 6C 7H 8S 9D}).straight?.should be_true
    end
    
    it 'should recognize a 5-high straight' do
      Hand.new(*%w{5D 4C 3H 2S AD}).straight?.should be_true
    end
    
    it 'should recognize an ace-high straight' do
      Hand.new(*%w{10D JC KH QS AD}).straight?.should be_true
    end
    
    context "compared to other straight hands" do
      it "should value an ace-high straight higher than a 9-high straight" do
        ace_high.poker_value.should > nine_high.poker_value
      end
      
      it "should value an ace-high straight higher than a 5-high straight" do
        ace_high.poker_value.should > five_high.poker_value
      end
      
      it "should value a 10-high straight higher than a 9-high straight" do
        ten_high.poker_value.should > nine_high.poker_value
      end
      
      it "should value a 10-high straight higher than a 5-high straight" do
        ten_high.poker_value.should > five_high.poker_value
      end
    end
  end
end
