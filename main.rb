# frozen-string-literal: true

require_relative 'pretty.rb'
require_relative 'gameplay.rb'

class Game < Gameplay
  include Instructions
  include HangedMan

  def match
    continue = start
    while continue
      turn
      continue = continue_play?
    end
    if @number_wrong == 6
      lose(@random_word)
    else
      win(@random_word)
    end
  end

  private

  def initialize
    @blanks = []
    @number_wrong = 0
    @all_guesses = []
    @wrong_guesses = []
  end

  def new_or_saved_game ####################INCOMPLETE
    pass = false
    puts "Would you like to:"
    puts "1. Start a new game"
    puts "2. Load a saved game?"
    loop do
      print "[1/2]: "
      input = gets.chomp.to_i
      if input == 1 || input == 2
        return input
      else
        puts "That didn't look quite right. Try again."
      end
    end
  end

  def play_new_game

  end

  def play_saved_game

  end

  def save_game
    Dir.makedir('saves') unless Dir.exist?('saves')
    saves = load_saves
    current_game = {
      'player_name' => @player_name,
      'random_word' => @random_word,
      'random_word_array' => @random_word_array,
      'blanks' => @blanks,
      'number_wrong' => @number_wrong,
      'all_guesses' => @all_guesses,
      'wrong_guesses' => @wrong_guesses,
      'guesses_left' => @guesses_left,
      'mode' => @mode
    }
    saves.push(current_game)
    serialized = Marshal.dump(saves)
    File.open('saves/saves.txt', 'w') do |file|
      file.puts serialized
    end
  end

  def load_saves
    if File.exist? 'saves/saves.txt'
      saved_games = File.read('saves/saves.txt')
      saves = Marshal.load(saved_games)
    else
      []
    end
  end
end

game = Game.new
game.match
