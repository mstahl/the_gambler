require 'spec_helper'

module TheGambler
  describe "three of a kind hand" do
    Card::RANKS.each do |rank|
      it "should correctly identify three #{rank}'s" do
        a = (Card::RANKS - [rank]).shuffle.first
        b = (Card::RANKS - [rank, a]).shuffle.first
        
        Hand.new("#{rank}C", "#{rank}H", "#{rank}D", "#{a}H", "#{b}H").three_of_a_kind?.should be_true
      end
    end
    
    describe 'valuation' do
      it 'should recognize that three 10s is more valuable than three 5s' do
        Hand.new(*%w{10S 10H 10C 9D AS}).poker_value.should > Hand.new(*%w{5S 5C 5H 3D 10D}).poker_value
      end
      
      it 'should recognize that three aces is more valuable than three kings' do
        Hand.new(*%w{AS AH AC 10D 7C}).poker_value.should > Hand.new(*%w{KS KC KH QD 10D}).poker_value
      end
    end
  end
end
