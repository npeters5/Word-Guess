# Overall goal: Create a game which will allow the user to guess a word and get ASCII-art as feedback on their guesses.

# create Game class
class Game

  attr_accessor :word, :guess_letter, :guessed_letters, :guessed_letters

  # Constructor, does not take in any arguments
  def initialize
    @guessed_letters = []
    @blanks_array = []
    @word_array = []
    @flower_pot = [
      "    (@)(@)(@)(@)
      *,*,*,*
      _*,*,*_
      |_____|
       |   |
       |___|",
      "    (@)(@)(@)
      *,*,*,*
      _*,*,*_
      |_____|
       |   |
       |___|",
      "    (@)(@)
      *,*,*,*
      _*,*,*_
      |_____|
       |   |
       |___|",
      "    (@)
      *,*,*,*
      _*,*,*_
      |_____|
       |   |
       |___|",
      "
      *,*,*,*
      _*,*,*_
      |_____|
       |   |
       |___|",
    ]
    game_intro
  end

  def game_intro
    puts "\nWelcome to the word guess game!"
    puts "It's kinda of like Hangman. You will be given a mysterious 4-letter word. Each turn you will have the opportunity to guess letters in the word. \n\nHere is your flower pot. Each time you guess an incorrect letter, a rose will be removed. After four incorrect guesses there will be no more roses and the game will be over. Good luck! :) \n\n"
    puts @flower_pot[0]
    random_word
    guess
  end

  def random_word
    random_words_array = %w[book bear road read pipe pump coin]
    @word = random_words_array[rand(random_words_array.length)]
    # puts @word
    split_word
  end

  def split_word
    @word_array = @word.split("")
    @word_array.each do
      @blanks_array << "_ "
    end
    print @blanks_array.join
    puts
  end

  def guess
    num_wrong_guesses = 0
    until num_wrong_guesses == 4 || @blanks_array.join("") == @word
      print "\nPlease enter ONE letter to guess: "
      @guess_letter = gets.chomp

      # The user should be able to input a single letter at a time.
      # Between each guess, the board should be redrawn to the terminal (ASCII art!).
      until guess_letter.length == 1 && guess_letter =~ /[a-zA-Z]/
        puts "Invalid entry, try again."
        @guess_letter = gets.chomp
      end
      if @word_array.include?(@guess_letter)
        @word_array.length.times do |i|
          if @word_array[i] == @guess_letter
            @blanks_array[i] = @guess_letter
            puts @flower_pot[num_wrong_guesses]
            @guessed_letters << @guess_letter
          end
        end
        # print @blanks_array.join
      else puts @flower_pot[num_wrong_guesses + 1]
        num_wrong_guesses += 1
        @guessed_letters << @guess_letter
      end
      # Display the letters that have already been guessed before each player guesses a new letter.
      print @blanks_array.join
      print "\nHere are the letters you've already guessed: #{@guessed_letters.join(" ")}\n"

    end
    # The user should be able to win or lose.
    if num_wrong_guesses == 4
      puts "Sorry, you lose. Goodbye!"
      puts "The word was: #{@word}."
    else
      puts "Congratulations! You win!"
    end
  end
end

new_game = Game.new
