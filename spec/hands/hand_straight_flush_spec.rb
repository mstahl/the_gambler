require 'spec_helper'

module TheGambler
  describe "straight flush hands" do
    
    %w{S C H D}.each do |suit|
      it 'should recognize a trivial straight flush' do
        Hand.new("5#{suit}", "6#{suit}", "7#{suit}", "8#{suit}", "9#{suit}").straight_flush?.should be_true
      end
    
      it 'should recognize a 5-high straight flush' do
        Hand.new("5#{suit}", "4#{suit}", "3#{suit}", "2#{suit}", "A#{suit}").straight_flush?.should be_true
      end
    
      it 'should recognize an ace-high straight flush' do
        Hand.new("10#{suit}", "J#{suit}", "K#{suit}", "Q#{suit}", "A#{suit}").straight_flush?.should be_true
      end
    end
    
  end
end
