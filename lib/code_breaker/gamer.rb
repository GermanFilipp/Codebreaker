require 'yaml'

module CodeBreaker
  class Gamer
    @@file = "users_data.yaml"
    attr_accessor :gamers

    def initialize
      @gamers = []
    end

    def add obj
      @gamers.push obj
    end

    def create_table_score
      @gamers.each do |f|
        puts "Name: #{f.name} Turns: #{f.turns} Rounds complite: #{f.complite}"
      end
    end

    def save_data
        File.open(@@file, "w" ) do |f|
        f.write(YAML::dump(@gamers))
        f.close
      end
    end

    def load_data
      a = Dir.entries"/home/german/code_breaker/"
      return "file not found" unless a.include? @@file

      data    = File.read(@@file)
      new_obj = YAML::load(data)
     unless new_obj.nil?
      new_obj.each do |f|
        @gamers.push User.new(name: f.name, turns: f.turns, complite: f.complite)
      end
     end
    end

  end

end