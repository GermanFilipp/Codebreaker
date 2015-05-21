
module CodeBreaker

  class User < Gamer

    attr_accessor :name, :turns, :complite

    def initialize (name:, turns:, complite:)
      @name     = name
      @turns    = turns
      @complite = complite
    end

  end


end