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
    "Introduction!\n\n"
  end

  def welcome(name)
    "Hello, #{name.bg_blue}!"
  end

  def feedback(number_wrong, guesses_left, wrong_guesses)
    puts "Number wrong: #{number_wrong}, guesses left: #{guesses_left}"
    puts "Wrong guesses: #{wrong_guesses.join(' ').red}"
  end

  def win(mode, word)
    case mode
    when 1
      puts "Congratulations! You guessed the word #{word.green}."
    when 2
      puts "Congratulations! You guessed the movie #{word.green}."
    when 3
      puts "Congratulations! You guessed the name #{word.green}."
    else
      puts "You've found a bug! Please report it to the game creator."
    end
  end

  def lose(mode, word)
    case mode
    when 1
      puts "You lost! The word was #{word.red}."
    when 2
      puts "You lost! The movie was #{word.red}."
    when 3
      puts "You lost! The name was #{word.red}."
    else
      puts "You've found a bug! Please report it to the game creator."
    end
  end
end