require 'spec_helper'

module TheGambler
  describe "high card hand" do
    
    describe 'valuation' do
      it 'should recognize that ace high is more valuable than king high' do
        Hand.new(*%w{AH QD 10C 5H 2D}).poker_value.should > Hand.new(*%w{KH 10H 8C 4C 2D}).poker_value
      end
      
      it 'should recognize that queen high is more valuable than 8 high' do
        Hand.new(*%w{QD 10C 7D 4H 2D}).poker_value.should > Hand.new(*%w{8D 5H 7D 2C 3H}).poker_value
      end
      
    end
  end
end
