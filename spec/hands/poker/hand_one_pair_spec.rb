require 'spec_helper'

module TheGambler
  describe "one pair hand" do
    
    describe 'valuation' do
      it 'should recognize that a pair of aces is more valuable than a pair of kings' do
        Hand.new(*%w{AH AD 10C 5H 2D}).poker_value.should > Hand.new(*%w{KH KH 8C 4C 2D}).poker_value
      end
      
      it 'should recognize that a pair of queens is more valuable than a pair of 10s' do
        Hand.new(*%w{QD QC 7D 4H 2D}).poker_value.should > Hand.new(*%w{10D 10H 7D 2C 3H}).poker_value
      end
      
    end
  end
end
