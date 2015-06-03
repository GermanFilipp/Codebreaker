require 'yaml'

module CodeBreaker
  class Gamer
    FILE = "./code_breaker/users_data.yaml"
    attr_accessor :gamers

    def initialize
      @gamers = []
    end

    def add obj
      @gamers.push obj
    end

    def create_table_score
      @gamers.each do |f|
        puts "Name: #{f.name} Turns: #{f.turns}"
      end
    end

    def save_data
      return "file not found" unless File.exist? FILE
        File.open(FILE, "w" ) do |f|
        f.write(YAML::dump(@gamers))
        f.close
      end
    end

    def load_data

      return "file not found" unless File.exist? SCORE_INFO

      data    = File.read(FILE)
      new_obj = YAML::load(data)
     unless new_obj.nil?
      new_obj.each do |f|
        @gamers.push User.new(name: f.name, turns: f.turns)
      end
     end
    end

  end

end
