require "code_breaker/version"
require "code_breaker/game"
require "code_breaker/gamer"
require "code_breaker/user"
module CodeBreaker

game = Game.new
gamer = Gamer.new

  puts "Play game?(y/n)"
  result =  gets.chomp
  case result
    when /y/
     game.start
     true_false = true
     while true_false
      puts "Enter number that consist 4 numbers from 1-4.(?-to hints ex - to exit)"
      answer = gets.chomp
      case answer
        when "?"
          unless game.available_hints == 0
          puts game.get_hint
          else
            "You have not hints"
          end
        when /ex/
          true_false = false
        else
          if game.move == 0
            puts "Game over. Secret code is #{game.secret_code}"
            true_false = false
          else
            response =  game.check_number answer

            if response == "++++"
              puts "You win!"
              puts "Do you want save score?(y/n)"
             case gets.chomp
               when /y/
                 puts "Enter your name"
                 name = gets.chomp
                 gamer.load_data
                 gamer.add(User.new(name:name,turns:game.move,complete:1))
                 gamer.save_data
                 true_false = false
               else
                 true_false = false
             end
            end
          end
      end
     end

    when/n/
      puts "ok,Boss :("
    else
      puts "something wrong"
  end








end
