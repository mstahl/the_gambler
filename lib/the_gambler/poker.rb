module TheGambler
  module Poker
    POKER_HANDS = %w{
      high_card one_pair two_pair three_of_a_kind straight flush full_house four_of_a_kind straight_flush royal_flush
    }
    
    # Valuation methods ===========================================================================
    
    def poker_value
      value = 1
      
      POKER_HANDS.reverse.each_with_index do |hand, i|
        if self.send(:"#{hand}?") then
          value = 10 ** (POKER_HANDS.count - i)
          break
        end
      end
      
      value
    end
    
    # Different kinds of hands ====================================================================
    
    def high_card?
      true  # Every hand has a high card.
    end
    
    def one_pair?
      contents.sort_by(&:numerical_value).map(&:to_s).join =~ %r{(.{1,2})[SCHD]\1[SCHD]}i
    end
    
    def two_pair?
      contents.sort_by(&:numerical_value).map(&:to_s).join =~ %r{(.{1,2})[SCHD]\1[SCHD].*(.{1,2})[SCHD]\2[SCHD]}i
    end
    
    def three_of_a_kind?
      contents.sort_by(&:numerical_value).map(&:to_s).join =~ %r{(.{1,2})[SCHD]\1[SCHD]\1[SCHD]}i
    end
    
    def straight?
      values = contents.map(&:numerical_value)
      values.sort == (values.min..values.max).to_a
    end
    
    def flush?
      contents.map(&:suit).uniq.count == 1
    end
    
    def full_house?
      as_string = contents.sort_by(&:numerical_value).map(&:to_s).join
      as_string =~ %r{(.{1,2})[SCHD]\1[SCHD]\1[SCHD](.{1,2})[SCHD]\2[SCHD]} or as_string =~ %r{(.{1,2})[SCHD]\1[SCHD](.{1,2})[SCHD]\2[SCHD]\2[SCHD]}
    end
    
    def four_of_a_kind?
      contents.sort_by(&:numerical_value).map(&:to_s).join =~ %r{(.{1,2})[SCHD]\1[SCHD]\1[SCHD]\1[SCHD]}i
    end
    
    def straight_flush?
      straight? and flush?
    end
    
    def royal_flush?
      contents.sort_by(&:numerical_value).map(&:to_s).join =~ %r{\AA([SCHD])10\1J\1Q\1K\1\Z}i
    end
    
  end
end
