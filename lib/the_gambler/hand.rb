module TheGambler
  class Hand
    attr_reader :contents
    
    def initialize(*args)
      @contents = []
      args.each{|a| @contents << Card.new(a) }
    end
  end
end
