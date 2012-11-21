module TheGambler
  module Poker
    POKER_HANDS = %w{
      high_card one_pair two_pair three_of_a_kind straight flush full_house four_of_a_kind straight_flush royal_flush
    }
    
    # Valuation methods ===========================================================================
    
    def poker_value
      if royal_flush? then
        
        10000e10
        
      elsif straight_flush? then
        
        if contents.map(&:numerical_value).sort == [2, 3, 4, 5, 14] then
          10000e9 + 1
        else
          10000e9 + contents.max_by(&:numerical_value).numerical_value
        end
        
      elsif four_of_a_kind? then
        
        c = contents.group_by(&:numerical_value)
        10000e8 + 13 * c.keys.max_by{|k| c[k].count} + c.keys.min_by{|k| c[k].count}
        
      elsif full_house? then
        
        c = contents.group_by(&:numerical_value)
        10000e7 + c.keys.detect{|k| c[k].count == 3} * 13 + c.keys.detect{|k| c[k].count == 2}
        
      elsif flush? then
        
        10000e6 + contents.max_by(&:numerical_value).numerical_value
        
      elsif straight? then
        
        if contents.map(&:numerical_value).sort == [2, 3, 4, 5, 14] then
          10000e5 + 1
        else
          10000e5 + contents.max_by(&:numerical_value).numerical_value
        end
        
      elsif three_of_a_kind? then
        
        c = contents.group_by(&:numerical_value)
        a, b = c.keys.select{|k| c[k].count == 1}.minmax
        10000e4 + 13 * 13 * c.keys.detect{|k| c[k].count == 3} + 13 * b + a
        
      elsif two_pair? then
        
        c = contents.group_by(&:numerical_value)
        
        pair_one, pair_two = c.keys.select{|k| c[k].count == 2}.minmax
        kicker = c.keys.detect{|k| c[k].count == 1}
        
        10000e3 + 13 * 13 * pair_two + 13 * pair_one + kicker
        
      elsif one_pair? then
        
        c = contents.group_by(&:numerical_value)
        kicker_value = 0
        c.keys.select{|k| c[k].count == 1}.each do |n|
          kicker_value = kicker_value * 13 + n
        end
        10000e2 + (13 ** 4) * c.keys.detect{|k| c[k].count == 2} + kicker_value
        
      elsif high_card? then
        
        value = 0
        contents.map(&:numerical_value).sort.each_with_index do |n, i|
          value += 13 ** i * n
        end
        value
        
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
      nums = contents.map(&:numerical_value).sort
      return true if nums == [2, 3, 4, 5, 14]

      one_different = nums[1..-1].zip(nums[0..-2]).group_by{|a, b| a - b}[1]

      one_different and one_different.count >= 4
    end
    
    def flush?
      c = contents.group_by(&:suit)
      !! contents.group_by(&:suit).values.detect{|k| k.count == 5}
    end
    
    def full_house?
      c = contents.group_by(&:numerical_value).values.map(&:count)
      c.any?{|x| x == 3} and c.select{|x| x >= 2}.count >= 2
    end
    
    def four_of_a_kind?
      contents.sort_by(&:numerical_value).map(&:to_s).join =~ %r{(.{1,2})[SCHD]\1[SCHD]\1[SCHD]\1[SCHD]}i
    end
    
    def straight_flush?
      straight? and flush?
    end
    
    def royal_flush?
      contents.sort_by(&:numerical_value).map(&:to_s).join =~ %r{10([SCHD])J\1Q\1K\1A\1}i
    end
    
  end
end
