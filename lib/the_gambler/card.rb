module TheGambler
  class Card
    attr_reader :rank, :suit

    SUIT_STRINGS = %w{S C H D}
    SUIT_SYMBOLS = %w{spades clubs hearts diamonds}.map(&:to_sym)
    RANKS        = %w{A 2 3 4 5 6 7 8 9 10 J Q K}

    def initialize(arg)
      case arg.class.to_s
      when 'String'
        if arg =~ /([ajqk2-9]|10)([SCHD])/i then
          @rank, @suit = $1.upcase, SUIT_SYMBOLS[SUIT_STRINGS.index($2)]
        else
          raise ArgumentError.new("Invalid string: '#{arg}'")
        end
      when 'Array'
        if RANKS.include?(arg[0]) and SUIT_STRINGS.include?(arg[1]) then
          @rank, @suit = arg[0].upcase, SUIT_SYMBOLS[SUIT_STRINGS.index(arg[1])]
        else
          raise ArgumentError.new("Invalid array: #{arg.inspect}")
        end
      when 'Hash'
        if RANKS.include?(arg[:rank]) and SUIT_STRINGS.include?(arg[:suit]) then
          @rank, @suit = arg[:rank].upcase, SUIT_SYMBOLS[SUIT_STRINGS.index(arg[:suit])]
        else
          raise ArgumentError.new("Invalid hash: #{arg.inspect}")
        end
      else
        raise ArgumentError.new("Must supply either a String, an Array, or a Hash, not a #{arg.class.to_s}")
      end
    end



  end
end
