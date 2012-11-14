module TheGambler
  class Card
    attr_reader :raw

    SUIT_STRINGS = %w{S C H D}
    SUIT_SYMBOLS = %w{spades clubs hearts diamonds}.map(&:to_sym)
    RANKS        = %w{2 3 4 5 6 7 8 9 10 J Q K A}

    def initialize(arg)
      case arg.class.to_s
      when 'String'
        if arg =~ /([ajqk2-9]|10)([SCHD])/i then
          rank, suit = $1.upcase, $2
        else
          raise ArgumentError.new("Invalid string: '#{arg}'")
        end
      when 'Array'
        if RANKS.include?(arg[0]) and SUIT_STRINGS.include?(arg[1]) then
          rank, suit = arg[0].upcase, arg[1]
        else
          raise ArgumentError.new("Invalid array: #{arg.inspect}")
        end
      when 'Hash'
        if RANKS.include?(arg[:rank]) and SUIT_STRINGS.include?(arg[:suit]) then
          rank, suit = arg[:rank].upcase, arg[:suit]
        else
          raise ArgumentError.new("Invalid hash: #{arg.inspect}")
        end
      when 'Card','TheGambler::Card'
        rank, suit = arg.rank, arg.suit
      else
        raise ArgumentError.new("Must supply either a String, an Array, or a Hash, not a #{arg.class.to_s}")
      end
      
      if SUIT_STRINGS.include?(suit)
        @raw = 13 * SUIT_STRINGS.index(suit) + RANKS.index(rank)
      elsif SUIT_SYMBOLS.include?(suit)
        @raw = 13 * SUIT_SYMBOLS.index(suit) + RANKS.index(rank)
      end
    end

    def ace?
      rank == 'A'
    end

    def face_card?
      %w{J Q K}.include?(rank)
    end

    def numerical_value
      RANKS.index(rank) + 2
    end

    def rank
      RANKS[@raw % 13]
    end

    def suit
      SUIT_SYMBOLS[@raw / 13]
    end

    def to_s
      "#{rank}#{SUIT_STRINGS[@raw / 13]}"
    end

  end
end
