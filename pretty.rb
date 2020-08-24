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
module Instructions
  def logo
    "     ██░ ██  ▄▄▄      ███▄     █  ▄████  ███▄ ▄███▓  ▄▄▄       ███▄    █ 
    ▓██░ ██▒▒████▄     ██ ▀█   █  ██▒ ▀█▒▓██▒▀█▀ ██▒▒████▄     ██ ▀█   █ 
    ▒██▀▀██░▒██  ▀█▄  ▓██  ▀█ ██▒▒██░▄▄▄░▓██    ▓██░▒██  ▀█▄  ▓██  ▀█ ██▒
    ░▓█ ░██ ░██▄▄▄▄██ ▓██▒  ▐▌██▒░▓█  ██▓▒██    ▒██ ░██▄▄▄▄██ ▓██▒  ▐▌██▒
    ░▓█▒░██▓ ▓█   ▓██▒▒██░   ▓██░░▒▓███▀▒▒██▒   ░██▒ ▓█   ▓██▒▒██░   ▓██░
     ▒ ░░▒░▒ ▒▒   ▓▒█░░ ▒░   ▒ ▒  ░▒   ▒ ░ ▒░   ░  ░ ▒▒   ▓▒█░░ ▒░   ▒ ▒ 
     ▒ ░▒░ ░  ▒   ▒▒ ░░ ░░   ░ ▒░  ░   ░ ░  ░      ░  ▒   ▒▒ ░░ ░░   ░ ▒░
     ░  ░░ ░  ░   ▒      ░   ░ ░ ░ ░   ░ ░      ░     ░   ▒      ░   ░ ░ 
     ░  ░  ░      ░  ░         ░       ░        ░         ░  ░         ░ 
                                                                         \n\n\n"
  end

  def introduction
    
  end

  def welcome(name)
    "Hello, #{name.bg_blue}!"
  end

  def win(word)
    puts "Congratulations! You guessed #{word.green}."
  end

  def lose(word)
    puts "You lost! The word was #{word.red}."
  end
end