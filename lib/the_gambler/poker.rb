module TheGambler
  module Poker
    POKER_HANDS = %w{
      high_card one_pair two_pair three_of_a_kind straight flush full_house four_of_a_kind straight_flush royal_flush
    }
    
    # Valuation methods ===========================================================================
    
    def poker_value
      if royal_flush? then
        
        10e10
        
      elsif straight_flush? then
        
        if contents.map(&:numerical_value).sort == [2, 3, 4, 5, 14] then
          10e9 + 1
        else
          10e9 + contents.max_by(&:numerical_value).numerical_value
        end
        
      elsif four_of_a_kind? then
        
        c = contents.group_by(&:numerical_value)
        10e8 + 13 * c.keys.max_by{|k| c[k].count} + c.keys.min_by{|k| c[k].count}
        
      elsif full_house? then
        
        c = contents.group_by(&:numerical_value)
        10e7 + c.keys.detect{|k| c[k].count == 3} * 13 + c.keys.detect{|k| c[k].count == 2}
        
      elsif flush? then
        
        10e6 + contents.max_by(&:numerical_value).numerical_value
        
      elsif straight? then
        
        if contents.map(&:numerical_value).sort == [2, 3, 4, 5, 14] then
          10e5 + 1
        else
          10e5 + contents.max_by(&:numerical_value).numerical_value
        end
        
      elsif three_of_a_kind? then
        
        c = contents.group_by(&:numerical_value)
        a, b = c.keys.select{|k| c[k].count == 1}.minmax
        10e4 + 13 * 13 * c.keys.detect{|k| c[k].count == 3} + 13 * b + a
        
      elsif two_pair? then
        
        c = contents.group_by(&:numerical_value)
        
        pair_one, pair_two = c.keys.select{|k| c[k].count == 2}.minmax
        kicker = c.keys.detect{|k| c[k].count == 1}
        
        10e3 + 13 * 13 * pair_two + 13 * pair_one + kicker
        
      elsif one_pair? then
        
        c = contents.group_by(&:numerical_value)
        10e2 + c.keys.detect{|k| c[k].count == 2}
        
      elsif high_card? then
        
        contents.max_by(&:numerical_value).numerical_value
        
      end
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
      values = contents.map(&:numerical_value).sort
      values == (values.min..values.max).to_a or values == [2, 3, 4, 5, 14]
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
      contents.sort_by(&:numerical_value).map(&:to_s).join =~ %r{\A10([SCHD])J\1Q\1K\1A\1\Z}i
    end
    
  end
end
