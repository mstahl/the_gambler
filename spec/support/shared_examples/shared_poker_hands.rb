shared_examples "poker hands" do
  let(:royal_flush)     { TheGambler::Hand.new "AD", "KD", "QD", "JD", "10D" }
  let(:straight_flush)  { TheGambler::Hand.new "JC", "10C", "9C", "8C", "7C" }
  let(:four_of_a_kind)  { TheGambler::Hand.new "4D", "4C", "4S", "4H", "AC" }
  let(:full_house)      { TheGambler::Hand.new "5S", "5H", "5D", "8S", "8H" }
  let(:flush)           { TheGambler::Hand.new "2D", "7D", "8D", "QD", "3D" }
  let(:straight)        { TheGambler::Hand.new "AC", "2D", "3D", "4D", "5D" }
  let(:three_of_a_kind) { TheGambler::Hand.new "AD", "AC", "AS", "JD", "10D" }
  let(:two_pair)        { TheGambler::Hand.new "AD", "AC", "QD", "QS", "10D" }
  let(:one_pair)        { TheGambler::Hand.new "AD", "AC", "QD", "JD", "10D" }
  let(:high_card)       { TheGambler::Hand.new "AD", "3H", "QD", "JD", "10D" }
end
