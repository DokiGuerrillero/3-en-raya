# Source File
# Creator: Andres Ojeda
# Project: Tic-Tac-Toe
# 
# Enjoy it! :)


class MyClass
  def initialize ()
      @game_board = [
        ["-","-","-"],
        ["-","-","-"],
        ["-","-","-"]
      ]
      @win_condition= false
      @player1_name = ""
      @player2_name = ""
      @language = "no"
      @turn = 0
  end
  def select_language (language = gets.chomp.to_i)
    puts "\n\n English:0 \n Spanish:1\n\nSorry if your language isnt here yet, i am working on it"
    @language = language
  end
  def select_name
    puts @intro_text
    gets @player1_name
    puts @player1_selector_text
    gets @player1_name
    puts @player2_selector_text
    gets @player2_name
  end
end
  instanceOne = MyClass.new
  instanceOne.select_language