
module CodeBreaker

  class User < Gamer

    attr_accessor :name, :turns

    def initialize (name:, turns:)
      @name     = name
      @turns    = turns
      
    end

  end


end
