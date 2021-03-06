# frozen-string-literal: true

class Gameplay
  def random_word_generator
    wordfile = File.open('wordlist.txt', 'r')
    random_words_array = wordfile.readlines.map { |word| word.chomp }
    wordfile.close
    @random_word = random_words_array.sample.upcase
    @random_word_array = @random_word.split('')
  end

  def random_movie_generator
    wordfile = File.open('movielist.txt', 'r')
    random_movies_array = wordfile.readlines.map { |movie| movie.chomp }
    wordfile.close
    @random_word = random_movies_array.sample.upcase
    @random_word_array = @random_word.split('')
  end

  def random_name_generator
    wordfile = File.open('namelist.txt', 'r')
    random_names_array = wordfile.readlines.map { |name| name.chomp }
    wordfile.close
    @random_word = random_names_array.sample.upcase
    @random_word_array = @random_word.split('')
  end

  def blanks_on_start
    blanklength = @random_word_array.length - 1
    blanklength.downto(0) do |index|
      @blanks.push('_ ')
    end
    @blanks
  end

  def blanks_per_turn(guess)
    @random_word_array.each_with_index do |letter, index|
      if guess == letter
        @random_word_array[index] = 'guessed'
        @blanks[index] = "#{letter.green} "
      elsif !@blanks[index].match(/[A-Z]/)
        @blanks[index] = '_ '
      end
    end
  end

  def valid_input?(guess)
    if guess.length == 1 && guess.match?(/[A-Z]/)
      if @all_guesses.include? guess
        puts "\nYou've already guessed that letter!\n"
        false
      else
        @all_guesses.push(guess)
        true
      end
    elsif guess == 'SAVE'
      true
    else
      puts "\nPlease enter a single alphabet.\n"
      false
    end
  end

  def check_guess(guess)
    if @random_word_array.include? guess
      blanks_per_turn(guess)
    elsif guess == 'SAVE'
      save_game
    else
      @number_wrong += 1
      @wrong_guesses.push(guess)
    end
    guesses_remaining_count
  end

  def receive_guess
    pass = false
    while pass == false
      puts "Please enter your guess as a single alphabet, or enter 'save' to save the game."
      print "\u00bb".encode.teal + " "
      guess = gets.chomp.upcase.freeze
      pass = valid_input?(guess)
    end
    guess
  end

  def guesses_remaining_count
    @guesses_left = 0
    @blanks.each do |item|
      if item == "_ "
        @guesses_left += 1
      end
    end
  end

  def continue_play?
    if @guesses_left > 0 && @number_wrong < 6
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
    puts "\nWhat is your name, brave champion?"
    @player_name = gets.chomp
  end

  def turn
    guess = receive_guess
    check_guess(guess)
    puts "\n\n\n"
    puts image_to_display(@number_wrong)
    puts @blanks.join
    puts "\n"
    feedback(@number_wrong, @guesses_left, @wrong_guesses)
    puts ''
  end

  def decide_play_mode
    puts "\n1. Random word"
    puts "2. Title of a movie"
    puts "3. Name of a person"
    loop do
      print "[1/2/3]: "
      input = gets.chomp.to_i
      case input
      when 1
        @mode = 1
        random_word_generator
        break
      when 2
        @mode = 2
        random_movie_generator
        break
      when 3
        @mode = 3
        random_name_generator
        break
      else
        puts "I'm sorry, what was that?"
      end
    end
  end

  def new_game_start
    receive_player_name
    puts welcome(@player_name)
    decide_play_mode
    puts "\nYou were right! The password hint on the laptop agrees with you."
    puts "Time to work on cracking the password itself."
    @guesses_left = @random_word.length
    puts image_to_display(0)
    puts blanks_on_start.join
    puts "\n"
    continue_play?
  end

  def play_game
    while @continue
      turn
      @continue = continue_play?
    end
    if @number_wrong == 6
      lose(@mode, @random_word)
    else
      win(@mode, @random_word)
    end
  end
end