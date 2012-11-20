require 'spec_helper'

module TheGambler
  describe Hand do
    context 'seven-card hands' do
      it 'should recognize a royal flush within a seven-card hand' do
        Hand.new(*%w{2D QH KH 4C JH 10H AH}).royal_flush?.should be_true
      end

      it 'should recognize a straight flush within a seven-card hand', wip:true do
        Hand.new(*%w{9H QH KH 4C JH 10H 7D}).straight_flush?.should be_true
      end

      it 'should recognize a four of a kind within a seven-card hand' do
        Hand.new(*%w{9D 9H 9C 4C 9S 10H 7D}).four_of_a_kind?.should be_true
      end

      it 'should recognize a full house within a seven-card hand' do
        pending
        Hand.new(*%w{9D QH KH 4C JH 10H 7D}).royal_flush?.should be_true
      end

      it 'should recognize a flush within a seven-card hand', wip:true do
        Hand.new(*%w{9H QH KH 4C 6H 10H 7D}).flush?.should be_true
      end

      it 'should recognize a straight within a seven-card hand', wip:true do
        Hand.new(*%w{9D QH KH JC 6H 10H 7D}).straight?.should be_true
      end

      it 'should recognize a three of a kind within a seven-card hand' do
        pending
        Hand.new(*%w{9D QH KH 4C JH 10H 7D}).royal_flush?.should be_true
      end

      it 'should recognize a two pair within a seven-card hand' do
        pending
        Hand.new(*%w{9D QH KH 4C JH 10H 7D}).royal_flush?.should be_true
      end

      it 'should recognize a pair within a seven-card hand' do
        pending
        Hand.new(*%w{9D QH KH 4C JH 10H 7D}).royal_flush?.should be_true
      end

      it 'should recognize a high card within a seven-card hand' do
        pending
        Hand.new(*%w{9D QH KH 4C JH 10H 7D}).royal_flush?.should be_true
      end
    end
  end
end

