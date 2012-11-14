require 'spec_helper'

module TheGambler
  describe "flush hand" do
    %w{S C H D}.each do |suit|
      it "should correctly identify a flush of #{suit}'s" do
        Hand.new("4#{suit}", "7#{suit}", "10#{suit}", "A#{suit}", "J#{suit}").flush?.should be_true
      end
    end
  end
end
