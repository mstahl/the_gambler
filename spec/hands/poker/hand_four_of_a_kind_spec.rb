require 'spec_helper'

module TheGambler
  describe "four of a kind hand" do
    Card::RANKS.each do |rank|
      it "should correctly identify four #{rank}'s" do
        Hand.new("#{rank}C", "#{rank}C", "#{rank}C", "#{rank}C", "#{(Card::RANKS - [rank]).shuffle.first}H").four_of_a_kind?.should be_true
      end
    end
    
    describe 'valuation' do
      it 'should recognize that four 10s is more valuable than four 5s' do
        Hand.new(*%w{10S 10H 10C 10D AS}).poker_value.should > Hand.new(*%w{5S 5C 5H 5D 10D}).poker_value
      end
      
      it 'should recognize that four aces is more valuable than four kings' do
        Hand.new(*%w{AS AH AC AD AS}).poker_value.should > Hand.new(*%w{KS KC KH KD 10D}).poker_value
      end
    end
  end
end
