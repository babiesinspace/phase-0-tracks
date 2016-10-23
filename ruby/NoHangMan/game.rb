#Create class which initializes game with input of word/phrase to be guessed
#Initilize game with: @guess count = 0, @is_over = false, @bad_guess = [], @good_guess = [], @win_phrase = input.split(by character)

#Find given phrase:
#Downcase given string, for every character a..z, sub '*'. Return as game-ready
# Print this as the start of the game, begin taking guesses 
#@given_phrase = game-ready_phrase.split(by character)

class NoHangMan
    attr_reader :available_guesses
    attr_accessor :guess, :is_over
    
    def initialize(phrase)
        phrase.downcase!
        @win_phrase = phrase.split("")
        @is_over = false 
        @bad_guess = []
        @good_guess = []
        @guess_count = 0 
        @given_phrase = phrase.gsub(/[abcdefghijklmnopqrstuvwxyz]/, "*")
        p @given_phrase
    end 

#Find allowed guesses Method:
#IF @given_phrase.count('*') is btw 1-10, allow 3 wrong guesses (bad_guess.length <= 3), 11-20 up to 5, 21+ 8 wrong guesses

    def allowed_guesses
        blanks = @given_phrase.count("*")
            if blanks <= 10
                @wrong_guesses = 3
            elsif (blanks >= 11) && (blanks <= 20)
                @wrong_guesses = 5
            else 
                @wrong_guesses = 8
            end
        puts "You are allowed #{@wrong_guesses} wrong guesses."
        @wrong_guesses
    end 

    def guess_valid(guess)
    valid_input = false 
    until valid_input == true 
        if (guess.length == 1) && (guess =~ /[[:alpha:]]/) && (@good_guess.include?(guess) == false) && (@bad_guess.include?(guess) == false)
            valid_input = true 
        else 
            puts "invalid"
            puts "Please type a letter to guess."
            guess = gets.chomp!
        end 
    end 
    guess 
    end 
    
    def user_guess(letter)
        if @win_phrase.include?(letter)
            @good_guess << letter
            @given_phrase.split("")
            i = 0 
            while i < @win_phrase.length
                if @win_phrase[i] == letter
                    @given_phrase[i] = letter #Change index of @given_phrase tguess 
                end
                i += 1 
            end
        else 
            @bad_guess << letter
        end
        @available_guesses = @wrong_guesses - @bad_guess.length
        puts "Guessed letters: #{@good_guess + @bad_guess}."
        puts "#{@available_guesses} guesses left."
        p @given_phrase
        if @available_guesses == 0
            puts "Sorry buddy, you stupid."
            @is_over = true
        end
        if @given_phrase.include?("*") == false
            puts "You WON!"
            @is_over = true
        end     
    end 

#If their guess is valid (input.length == 1 && btw a-z && (not included in either bad_guess || good_guess)) THEN 
#   Compare guess to @win_phrase
#       If guess is included, Push guess to @good_guess array and find index of guess in @win_phrase.
#           Change index of @given_phrase to guess
#           print good_guess array + bad_guess array,
#           print allowed guesses - bad_guess.length
#           Print @given_phrase.join
#               IF @given_phrase.eql?(@win_phrase) == true
#                   @is_over == true 
#       Else guess not included, push guess to @bad_guess array
#           print good_guess array + bad_guess array,
#           print allowed guesses - bad_guess.length
#           print @given_phrase.join
#   Else guess is NOT valid, ask for another guess

end 

puts "Please enter a word/phrase for your partner to guess.."
secret_phrase = gets.chomp! 

game = NoHangMan.new(secret_phrase)

game.allowed_guesses

#Get a guess from the user and downcase it

puts "Please type a letter to guess."
guess = gets.chomp!

input = game.guess_valid(guess)
game.user_guess(input)

while game.is_over != true 
    puts 'enter another letter'
    guess = gets.chomp
    input = game.guess_valid(guess)
    game.user_guess(input)
end  
