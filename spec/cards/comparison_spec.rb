require 'spec_helper'

module TheGambler

  describe Card do
    context 'comparisons with other cards', comparisons:true do
      describe '#<' do
        it 'should be able to compare two cards by rank' do
          Card.new("7D").should < Card.new("10S")
        end
      end

      describe '#>' do
        it 'should be able to compare two cards by rank' do
          Card.new("JD").should > Card.new("5D")
        end
      end

      describe '#<=>' do
        it 'should return -1 when less than its argument' do
          (Card.new('10S') <=> Card.new('JS')).should == -1
        end

        it 'should return 0 when equal to its argument' do
          (Card.new('10S') <=> Card.new('10H')).should == 0
        end

        it 'should return +1 when greater than its argument' do
          (Card.new('KD') <=> Card.new('5H')).should == 1
        end
      end

      # TODO Decide what I wanna do about the handling of aces.
      # context 'including aces' do
      #   pending "I do not even wanna deal with aces right now for this...."
      # end
    end
  end
end
