
# create Game class and call .new to begin new game.


# Overall goal: Create a game which will allow the user to guess a word and get ASCII-art as feedback on their guesses.
words_array = %w[bear road read book]

# rand_word = random_word

class Game

  attr_accessor :word

  def initialize(input_array)
    @words = input_array
  end

  def random_word
    word = words_array[rand(words_array.length)]
    return word
  end

  def split_word
    return @word.split("")
  end

end

new_game = Game.new(words_array)
puts new_game
puts new_game.split_word


# # The user should be able to input a single letter at a time.
num_guesses = 4
until num_guesses == 0
  print "Please enter ONE letter to guess: "
  guess_letter = gets.chomp
  #see if guess matches letter in word. if wrong, decrement num_guesses
  # guess_letter.length == 1 && guess_letter =~ /[a-zA-Z]/
  # puts "Invalid entry, try again."
  # guess_letter = gets.chomp
  num_guesses -= 1
end
#
#
# # Between each guess, the board should be redrawn to the terminal (ASCII art!).
# # Fix art later?
# draw (@) based on num_guesses remaining
def print_art
  puts "   (@)(@)(@)(@)   "
  puts "     *,*,*,*      "
  puts "     _*,*,*_      "
  puts "     |_____|      "
  puts "      |   |       "
  puts "      |___|       "
end

print_art

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
