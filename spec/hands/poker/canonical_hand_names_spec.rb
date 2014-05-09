require 'spec_helper'

describe 'Canonical poker hand names' do
  describe 'with royal flush' do
    it 'identifies the hand correctly' do
      expect(TheGambler::Hand.new(*%w{ AH KH QH JH 10H }).canonical_name).to eq('royal flush')
    end
  end

  describe 'with straight flush' do
    it 'identifies the hand correctly' do
      expect(TheGambler::Hand.new(*%w{ KH QH JH 10H 9H }).canonical_name).to eq('straight flush')
    end
  end

  describe 'with four of a kind' do
    it 'identifies the hand correctly' do
      expect(TheGambler::Hand.new(*%w{ AH AC AD AS 10H }).canonical_name).to eq('four of a kind')
    end
  end

  describe 'with full house' do
    it 'identifies the hand correctly' do
      expect(TheGambler::Hand.new(*%w{ AH AC AS JH JD }).canonical_name).to eq('full house')
    end
  end

  describe 'with flush' do
    it 'identifies the hand correctly' do
      expect(TheGambler::Hand.new(*%w{ 8H 3H 4H 6H 10H }).canonical_name).to eq('flush')
    end
  end

  describe 'with straight' do
    it 'identifies the hand correctly' do
      expect(TheGambler::Hand.new(*%w{ 4D 5C 6H 7S 8D }).canonical_name).to eq('straight')
    end
  end

  describe 'with three of a kind' do
    it 'identifies the hand correctly' do
      expect(TheGambler::Hand.new(*%w{ 4D 4H 4C 10D JC }).canonical_name).to eq('three of a kind')
    end
  end

  describe 'with two pair' do
    it 'identifies the hand correctly' do
      expect(TheGambler::Hand.new(*%w{ AH AD QH QD 10H }).canonical_name).to eq('two pair')
    end
  end

  describe 'with one pair' do
    it 'identifies the hand correctly' do
      expect(TheGambler::Hand.new(*%w{ AH AD QH JH 10H }).canonical_name).to eq('one pair')
    end
  end

  describe 'with high card' do
    it 'identifies the hand correctly' do
      expect(TheGambler::Hand.new(*%w{ AH 8D 4C 2D KD }).canonical_name).to eq('high card')
    end
  end

end
