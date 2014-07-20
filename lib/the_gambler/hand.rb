require 'the_gambler/poker'
require 'the_gambler/blackjack'

module TheGambler
  class Hand
    include TheGambler::Blackjack
    include TheGambler::Poker

    attr_reader :contents

    def initialize(*args)
      @contents = []
      args.each{|a| @contents << Card.new(a) }
    end
  end
end
