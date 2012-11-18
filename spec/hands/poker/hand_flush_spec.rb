require 'spec_helper'

module TheGambler
  describe "flush hand" do
    %w{S C H D}.each do |suit|
      it "should correctly identify a flush of #{suit}'s" do
        Hand.new("4#{suit}", "7#{suit}", "10#{suit}", "A#{suit}", "J#{suit}").flush?.should be_true
      end
    end
    
    describe 'valuation' do
      it 'should recognize that a 10-high flush is more valuable than a 9-high flush' do
        Hand.new(*%w{10S 5S 2S 6S 9S}).poker_value.should > Hand.new(*%w{9S 5S 2S 4S 3S}).poker_value
      end
      
      it 'should recognize that an ace-high flush is more valuable than a 10-high flush' do
        Hand.new(*%w{AH QH 10H 2H 7H}).poker_value.should > Hand.new(*%w{10S 5S 2S 6S 9S}).poker_value
      end
    end
  end
end
