module TheGambler
  class Hand
    include TheGambler::Blackjack
    
    attr_reader :contents
    
    def initialize(*args)
      @contents = []
      args.each{|a| @contents << Card.new(a) }
    end
  end
end
