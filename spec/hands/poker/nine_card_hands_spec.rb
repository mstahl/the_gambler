require 'spec_helper'

module TheGambler
  describe Hand do
    context 'nine-card hands' do
      it 'should recognize a royal flush within a nine-card hand' do
        Hand.new(*%w{2D QH 3D KH 4C JH QD 10H AH}).royal_flush?.should be_true
      end

      it 'should recognize a straight flush within a nine-card hand' do
        Hand.new(*%w{9H QH KH 4C JH 10H 2D 4H 7D}).straight_flush?.should be_true
      end

      context 'with four of a kind' do
        it 'should recognize a four of a kind within a nine-card hand' do
          Hand.new(*%w{9D 9H 9C 4C 9S 10H 5D QD 7D}).four_of_a_kind?.should be_true
        end

        it 'should recognize four of a kind and three of a kind at the same time as four of a kind only' do
          Hand.new(*%w{9D 9H 9C 4C 9S QD 5H 4H 4D}).four_of_a_kind?.should be_true
        end
      end

      context 'with a full house' do
        it 'should recognize a full house within a nine-card hand' do
          Hand.new(*%w{9D 3D 2C 9H 9H 4C 4H 10H 7D}).full_house?.should be_true
        end

        it 'should recognize a full house within a nine-card hand' do
          Hand.new(*%w{9D 9H 9H 4C 4H 2D JH 4H 7D}).full_house?.should be_true
        end
      end

      it 'should recognize a flush within a nine-card hand' do
        Hand.new(*%w{9H QH KH 3D 10H 4C 6H 10H 7D}).flush?.should be_true
      end

      context 'with a straight' do
        it 'should recognize a straight within a nine-card hand' do
          Hand.new(*%w{9D 3C AD QH KH JC 6H 10H 7D}).straight?.should be_true
        end
      end

      it 'should recognize a three of a kind within a nine-card hand' do
        Hand.new(*%w{QD QH QC 4C 3D 6C JH 10H 7D}).three_of_a_kind?.should be_true
      end

      it 'should recognize a two pair within a nine-card hand' do
        Hand.new(*%w{9D QH 9H 2D QC 4C 4H 10H QD}).two_pair?.should be_true
      end

      it 'should recognize a pair within a nine-card hand' do
        Hand.new(*%w{KD QH KH 2C 5D 4C JH 10H 7D}).one_pair?.should be_true
      end

      it 'should recognize a high card within a nine-card hand' do
        Hand.new(*%w{9D QH 3C 6D KH 4C 2H 10H 7D}).high_card?.should be_true
      end

    end
  end
end

