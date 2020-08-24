# frozen-string-literal: true

require 'json'
require_relative 'pretty.rb'
require_relative 'saveable.rb'
require_relative 'playable.rb'

class Game < Gameplay
  include Saveable
  include Instructable
  include HangedMan

  def match
    puts logo
    puts introduction
    game_type = new_or_saved_game
    if game_type == 1
      @continue = new_game_start
    elsif game_type == 2
      load_game
    end
    play_game
  end

  private

  def initialize
    @blanks = []
    @number_wrong = 0
    @all_guesses = []
    @wrong_guesses = []
  end

  def new_or_saved_game
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

  def save_game
    File.open('saved.txt', 'w') { |file| file.puts serialize }
    puts "The game has been saved!"
    exit
  end

  def load_game
    if File.exist?'saved.txt'
      saved_game = File.read 'saved.txt'
      unserialize(saved_game)
      puts "Welcome back, #{@player_name}!\n\n"
      puts image_to_display(@number_wrong)
      puts @blanks.join
      puts "\n"
      feedback(@number_wrong, @guesses_left, @wrong_guesses)
    end
  end
end

game = Game.new
game.match
