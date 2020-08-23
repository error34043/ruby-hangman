# frozen-string-literal: true

require_relative 'pretty.rb'

class Game
  include Instructions
  include HangedMan
  attr_accessor :blanks, :random_word_array, :guesses_left, :number_wrong, :wrong_guesses

  @player_name = ''
  @random_word = ''
  @random_word_array = []
  @blanks = []
  @number_wrong = 0
  @wrong_guesses = []
  @guesses_left = 0
  @win = false

  def initialize
    @blanks = []
    @number_wrong = 0
    @wrong_guesses = []
    @win = false
  end

  def random_word_generator
    wordfile = File.open('wordlist.txt', 'r')
    random_words_array = wordfile.readlines.map { |word| word.chomp }
    wordfile.close
    @random_word = random_words_array.sample.upcase
    @guesses_left = @random_word.length
    @random_word_array = @random_word.split('')
  end

  def show_blanks(guess = nil)
    if guess.nil?
      blanklength = @random_word_array.length - 1
      blanklength.downto(0) do |index|
        @blanks.push('_ ')
      end
      @blanks.push("\n\n")
    else
      if @random_word_array.include? guess
        @random_word_array.each_with_index do |letter, index|
          if guess == letter
            @random_word_array[index] = 'guessed'
            @blanks[index] = "#{letter.green} "
          elsif !@blanks[index].match(/[A-Z]/)
            @blanks[index] = '_ '
          end
        end
      else
        @number_wrong += 1
        @wrong_guesses.push(guess)
        @blanks
      end
    end
    guesses_reminaing_count
    @blanks
  end

  def valid_input?(guess)
    if guess.length == 1 && guess.match?(/[A-Z]/)
      true
    elsif @wrong_guesses.include? guess
      puts "You've already guessed that letter!"
      false
    else
      puts "Please enter a single alphabet."
      false
    end
  end

  def recieve_guess
    loop do
      guess = gets.chomp
      break if valid_input?(guess)
    end
  end

  def guesses_reminaing_count
    @guesses_left = 0
    @blanks.each do |item|
      if item == "_ "
        @guesses_left += 1
      end
    end
  end

  def continue_play?
    if guesses_left > 0 && @number_wrong < 6
      return true
    else
      return false
    end
  end

  def image_to_display(number)
    case number
    when 0
      images['0']
    when 1
      images['1']
    when 2
      images['2']
    when 3
      images['3']
    when 4
      images['4']
    when 5
      images['5']
    when 6
      images['6']
    else
      "Here's a bug, please report it to the game's creator."
    end
  end

  def receive_player_name
    puts "What is your name?"
    @player_name = gets.chomp
  end

  def turn

  end

  def start

  end
end



test = Game.new
word = test.random_word_generator.join
maxlength = word.length
# puts word
puts test.show_blanks.join
continue = test.continue_play?
while continue
  print "gimme: "
  guess = gets.chomp.upcase # methodified
  puts "\n\n\n"
  puts test.show_blanks(guess).join
  puts "Number wrong: #{test.number_wrong}, guesses left: #{test.guesses_left}"
  puts "Wrong guesses: #{test.wrong_guesses.join(' ').red}"
  continue = test.continue_play?
end
