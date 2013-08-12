require 'spec_helper'

module TheGambler
  describe "royal flush hand" do
    %w{S C H D}.each do |suit|
      it "should correctly identify a flush of #{suit}'s" do
        Hand.new("A#{suit}", "K#{suit}", "Q#{suit}", "J#{suit}", "10#{suit}").royal_flush?.should be_true
      end
    end
  end
end
