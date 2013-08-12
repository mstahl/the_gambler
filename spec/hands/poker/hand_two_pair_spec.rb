require 'spec_helper'

module TheGambler
  describe "two pair hand" do
    Card::RANKS.each do |primary_rank|
      (Card::RANKS - [primary_rank]).each do |secondary_rank|
        it "should correctly identify #{primary_rank}'s over #{secondary_rank}'s" do
          Hand.new(
            "#{primary_rank}C", "#{primary_rank}H",
            "#{secondary_rank}C", "#{secondary_rank}D", 
            "#{(Card::RANKS - [primary_rank, secondary_rank]).first}H"
          ).two_pair?.should be_true
        end
      end
    end
    
    describe 'valuation' do
      it 'should value two pair queens and 10s higher than two pair jacks and 10s' do
        Hand.new(*%w{QH QD 10H 10C 8D}).poker_value.should > Hand.new(*%w{JH JD 10H 10C 8D}).poker_value
      end
      
      it 'should value two pair 10s and 4s higher than 10s and 2s' do
        Hand.new(*%w{10H 10C 4H 4C 8D}).poker_value.should > Hand.new(*%w{10H 10C 2D 2H 8D}).poker_value
      end
      
      it 'should value two pair aces and 2s higher than kings and tens' do
        Hand.new(*%w{AH AD 2D 2H 8D}).poker_value.should > Hand.new(*%w{KH KD 10D 10C 8C}).poker_value
      end
    end
  end
end
