module TheGambler
  module Blackjack

    def blackjack?
      contents.count == 2 and contents.select(&:face_card?).count == 1 and contents.select(&:ace?).count == 1
    end
    
    def blackjack_value
      value = 0
      # Add up all the values in the hand that aren't aces.
      contents.reject(&:ace?).each do |card|
        if card.face_card? then
          value += 10
        else
          value += card.numerical_value
        end
      end
      
      # Now add up the aces greedily
      contents.select(&:ace?).each do |card|
        if 21 - value >= 11 then
          value += 11
        else
          value += 1
        end
      end
      
      value
    end
  end
end
