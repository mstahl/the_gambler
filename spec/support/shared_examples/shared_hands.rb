require 'the_gambler/hand'

shared_examples "poker hands" do
  let(:royal_flush)     { Hand.new "AD", "KD", "QD", "JD", "10D" }
  let(:straight_flush)  { Hand.new "JC", "10C", "9C", "8C", "7C" }
  let(:four_of_a_kind)  { Hand.new "4D", "4C", "4S", "4H", "AC" }
  let(:full_house)      { Hand.new "5S", "5H", "5D", "8S", "8H" }
  let(:flush)           { Hand.new "2D", "7D", "8D", "QD", "3D" }
  let(:straight)        { Hand.new "2D", "3H", "4D", "5D", "6C" }
  let(:three_of_a_kind) { Hand.new "AD", "AC", "AS", "JD", "10D" }
  let(:two_pair)        { Hand.new "AD", "AC", "QD", "QS", "10D" }
  let(:one_pair)        { Hand.new "AD", "AC", "QD", "JD", "10D" }
  let(:high_card)       { Hand.new "AD", "3H", "QD", "JD", "10D" }
end
