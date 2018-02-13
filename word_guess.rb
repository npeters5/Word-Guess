
# create Game class and call .new to begin new game.


# Overall goal: Create a game which will allow the user to guess a word and get ASCII-art as feedback on their guesses.


# rand_word = random_word


class Game

  #attr_accessor :word

  def initialize
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
    puts " Welcome to the word guess game "
    puts "It's like Hangman game. You will be given a random mystery word. You have the opportunity to guess letters in a word. Here is your flower pot. Each time you guess an incorrect letter, a rose will be removed. After four incorrect guesses there will be no more roses and the game will be over. Good luck! :) \n\n"
    puts @flower_pot[0]
    random_word
    guess
  end

  def random_word
    random_words_array = %w[bear road read book]
    @word = random_words_array[rand(random_words_array.length)]
    puts @word
    split_word
  end

  def split_word
    @word_array = @word.split("")
    @word_array.each do
      @blanks_array << "_ "
    end
    print @blanks_array.join
  end

  def guess
    num_guesses_remaining = 4
    until num_guesses_remaining == 0
      print "Please enter ONE letter to guess: "
      guess_letter = gets.chomp
      #see if guess matches letter in word. if wrong, decrement num_guesses_remaining
      until guess_letter.length == 1 && guess_letter =~ /[a-zA-Z]/
        puts "Invalid entry, try again."
        guess_letter = gets.chomp
      end
      num_guesses_remaining -= 1
    end
  end
end

new_game = Game.new
# puts new_game
# puts new_game.random_word


# # The user should be able to input a single letter at a time.

# # Between each guess, the board should be redrawn to the terminal (ASCII art!).

# Display the letters that have already been guessed before each player guesses a new letter.

def display_guesses(input)
  guessed_letters = []
  guessed_letters << input
  return guessed_letters
end
#
letters_guessed = display_guesses(guess_letter)
puts letters_guessed

# The user should be able to win or lose.
