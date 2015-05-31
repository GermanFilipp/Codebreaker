module CodeBreaker

  class Game
    attr_accessor :secret_code, :available_hints, :move
    def initialize 
      @secret_code     = ""
      @available_hints = 4
      @move            = 5
    end 

    def start
      @secret_code = generate_code
    end

    def generate_code
      4.times { @secret_code += "#{rand(1..6)}"}
      @secret_code
    end

    def check_number input_number
      @move             -= 1
      result             = String.new
      code_without_eql   = String.new
      input_without_eql  = String.new

      return "something wrong with your number" if input_number.size != 4
      return "fail number" unless input_number.match(/^[1-6]{1,4}/)

      for i in 0...4
        if input_number[i] == @secret_code[i]
          result << "+"
        else
        code_without_eql << @secret_code[i]
        input_without_eql << input_number[i]
        end
      end

      input_without_eql.each_char do |arg|
       if code_without_eql.include? arg
           result << "-"
           input_without_eql.slice!(arg) 
           code_without_eql.slice!(arg)
        end
      end

      result
    end

    def get_hint
      @available_hints -= 1
      position = rand(4)
      "Number from secret code - #{@secret_code[position]}. You have #{@available_hints} hints"
    end

  end

end
