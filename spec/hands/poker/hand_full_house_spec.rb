require 'spec_helper'

module TheGambler
  describe "full house hand" do
    Card::RANKS.each do |primary_rank|
      (Card::RANKS - [primary_rank]).each do |secondary_rank|
        it "should correctly identify #{primary_rank}'s over #{secondary_rank}'s" do
          Hand.new("#{primary_rank}C", "#{primary_rank}H", "#{primary_rank}S", "#{secondary_rank}C", "#{secondary_rank}D").full_house?.should be_true
        end
      end
    end
    
    describe 'valuation' do
      it 'should recognize that 10s over 5s is more valuable than 9s over 4s' do
        Hand.new(*%w{10S 10C 10D 5D 5C}).poker_value.should > Hand.new(*%w{9C 9H 9D 4D 4C}).poker_value
      end
      
      it 'should recognize that 10s over 5s is more valuable than 10s over 4s' do
        Hand.new(*%w{10S 10C 10D 5D 5C}).poker_value.should > Hand.new(*%w{10S 10C 10D 4D 4C}).poker_value
      end
      
      it 'should recognize that 10s over 5s is more valuable than 5s over 10s' do
        Hand.new(*%w{10S 10C 10D 5D 5C}).poker_value.should > Hand.new(*%w{10S 10C 5D 5D 5C}).poker_value
      end
      
      it 'should recognize that 10s over aces is more valuable than 10s over 4s' do
        Hand.new(*%w{10S 10C 10D AD AC}).poker_value.should > Hand.new(*%w{10S 10C 10D 4D 4C}).poker_value
      end
      
      it 'should recognize that aces over 2s is more valuable than kings over aces' do
        Hand.new(*%w{AS AC AD 2D 2C}).poker_value.should > Hand.new(*%w{KS KC KD AD AC}).poker_value
      end
      
    end
  end
end
