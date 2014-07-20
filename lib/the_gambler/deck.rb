module TheGambler
  class Deck
    attr_reader :contents

    # Exceptions ---------------------------------------------------------------

    class EmptyDeckException
    end

    # Initializer --------------------------------------------------------------

    def initialize
      @contents = (0..51).map{|i| Card.new(i)}.shuffle
    end

    # Public instance methods --------------------------------------------------

    def deal
      @contents.pop.tap do |card|
        raise EmptyDeckException.new if card.nil?
      end
    end

  end
end
