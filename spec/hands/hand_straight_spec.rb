require 'spec_helper'

module TheGambler
  describe "straight hands" do
    
    it 'should recognize a trivial straight' do
      Hand.new(*%w{5D 6C 7H 8S 9D}).straight?.should be_true
    end
    
    it 'should recognize a 5-high straight' do
      Hand.new(*%w{5D 4C 3H 2S AD}).straight?.should be_true
    end
    
    it 'should recognize an ace-high straight' do
      Hand.new(*%w{10D JC KH QS AD}).straight?.should be_true
    end
    
  end
end
