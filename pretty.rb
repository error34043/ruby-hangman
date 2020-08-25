# frozen-string-literal: true

# Contains methods that change the appreance of strings
class String
  def use_code(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

  def red;          use_code(31) end
  def green;        use_code(32) end
  def yellow;       use_code(33) end
  def blue;         use_code(34) end
  def magenta;      use_code(35) end
  def teal;         use_code(36) end

  def bg_red;       use_code(41) end
  def bg_green;     use_code(42) end
  def bg_yellow;    use_code(43) end
  def bg_blue;      use_code(44) end
  def bg_magenta;   use_code(45) end
  def bg_teal;      use_code(46) end
end

# Contains methods that display the person/character throughout the game
module HangedMan
  def images
    {
      '0' => %{
              +-------------+     
              |             |
                            |
                            |
                            |
                            |
                            |
                            |
          ====================
      },
      '1' => %{
              +-------------+     
              |             |
              }+"O".teal+%{             |
                            |
                            |
                            |
                            |
                            |
          ====================
      },
      '2' => %{
              +-------------+     
              |             |
              }+"O".teal+%{             |
              }+"|".teal+%{             |
              }+"|".teal+%{             |
                            |
                            |
                            |
          ====================
      },
      '3' => %{
              +-------------+     
              |             |
              }+"O".teal+%{             |
             }+"\\|".teal+%{             |
              }+"|".teal+%{             |
                            |
                            |
                            |
          ====================
      },
      '4' => %{
              +-------------+     
              |             |
              }+"O".teal+%{             |
             }+"\\|/".teal+%{            |
              }+"|".teal+%{             |
                            |
                            |
                            |
          ====================
      },
      '5' => %{
              +-------------+     
              |             |
              }+"O".teal+%{             |
             }+"\\|/".teal+%{            |
              }+"|".teal+%{             |
             }+"/".teal+%{              |
                            |
                            |
          ====================
      },
      '6' => %{
            +-------------+     
            |             |
            }+"O".teal+%{             |
           }+"\\|/".teal+%{            |
            }+"|".teal+%{             |
           }+"/ \\".teal+%{            |
                          |
                          |
         ====================
      }
    }
  end
end

# Contains methods that display instructions
module Instructable
  def logo
    "                                       *                                                             *
                          *      ▄█    █▄      ▄████████ ███▄▄▄▄      ▄██████▄    ▄▄▄▄███▄▄▄▄      ▄████████ ███▄▄▄▄         *
                                ███    ███    ███  * ███ ███▀▀▀██▄   ███    ███ ▄██▀▀▀███▀▀▀██▄   ███    ███ ███▀▀▀██▄ 
            *                   ███    ███    ███    ███ ███   ███   ███    █▀  ███   ███   ███   ███    ███ ███   ███ *
                               ▄███▄▄▄▄███▄▄  ███    ███ ███   ███  ▄███        ███   ███   ███   ███    ███ ███ * ███  
                              ▀▀███▀▀▀▀███▀ ▀███████████ ███   ███ ▀▀███ ████▄  ███   ███   ███ ▀███████████ ███   ███ 
                                ███    ███    ███    ███ ███   ███   ███    ███ ███   ███   ███   ███*   ███ ███   ███                         *
                                ███    ███    ███    ███ ███   ███   ███  * ███ ███   ███   ███   ███    ███ ███   ███ 
                  *             ███ *  █▀     ███    █▀   ▀█   █▀    ████████▀   ▀█   ███   █▀    ███    █▀   ▀█   █▀            *
                                                            *             \n\n".teal
  end

  def introduction
    "Your spaceship crashed on the Planet Xnathax 10 days ago. You don't really know how you got yourself caught up in a save-the-planet scheme so quick.\nYou also don't quite remember how you ended up at a killer robot's assembly plant with the fate of the planet resting on your shoulders.\nIt all happened so fast!\n\nWhat you" + " do ".red + "know is that you need to guess the password to the Big Bad's computer.\nIf you don't, he'll complete the construction of his mechadroid and rain destruction over the planet.\nEvery wrong guess brings his plan one step closer to completion, so watch out.\n\n"
  end

  def welcome(name)
    "\nHello, " + "Explorer #{name}!".bg_blue + "\nYour comarades have informed you that Big Bad's password is a single word.\nIt is either a random word, a movie name, or a person's name.\nWhich do you think it is?"
  end

  def feedback(number_wrong, guesses_left, wrong_guesses)
    puts "#{number_wrong.to_s.red} part(s) of the mechadroid have been assembled."
    puts "Wrong guesses: #{wrong_guesses.join(' ').red}"
  end

  def win(mode, word)
    case mode
    when 1
      puts "\nCongratulations! You guessed the word #{word.green}. Xnathax is saved.\n\n"
    when 2
      puts "\nCongratulations! You guessed the movie #{word.green}. Xnathax is saved.\n\n"
    when 3
      puts "\nCongratulations! You guessed the name #{word.green}. Xnathax is saved.\n\n"
    else
      puts "\nYou've found a bug! Please report it to the game creator.\n\n"
    end
  end

  def lose(mode, word)
    case mode
    when 1
      puts "\nOh no! The word was #{word.red}. The mechadroid is fully assembled and Xnathax will soon burn.\n\n"
    when 2
      puts "\nOh no! The movie was #{word.red}. The mechadroid is fully assembled and Xnathax will soon burn.\n\n"
    when 3
      puts "\nOh no! The name was #{word.red}. The mechadroid is fully assembled and Xnathax will soon burn.\n\n"
    else
      puts "\nYou've found a bug! Please report it to the game creator.\n\n"
    end
  end
end