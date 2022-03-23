# Source File
# Creator: Andres Ojeda
# Project: Tic-Tac-Toe
# 
# Enjoy it! :)

#___________________________________________________MODULE SECTOR_________________________________________________________________________________________________________________________
module Game_Engine
  def Turn_shifter
    if @turn == 0
      @turn = 1
    else
      @turn = 0
    end
  end
  
  def order_input
    puts @player_move_text
    first_time = true 
    loop do
      if first_time == false then puts "\n #{@error_input_msgs.sample}" end
      text = gets
      first_time = false
      break if text =~ /^[a,b,c][0,1,2]$/i
    end
  end

end


module Logic_Framework
  def row_check (array)
    array.each do |inner_array|
      if (inner_array.each_cons(2).all? {|x,y| x == y}) && !inner_array.include?("-")
        @win_condition = true
      end
    end
  end

  def column_check (array)
    (0..2).each do |i|
      if (array[0][i] == array[1][i]) && (array[1][i] == array[2][i]) && array[0][i] != '-'
        @win_condition = true
      end
    end
  end
  
  def diagonal_check (array)
    if ((array[0][0] == array[1][1]) && (array[1][1] == array[2][2])) || ((array[0][2] == array[1][1]) && (array[1][1] == array[2][0])) && array[1][1] != "-"
      win_condition = true
    end
  end
end 

module Language
  def selector
    case @language
    when 0
      english
    when 1
      spanish
    else
      puts "NON VALID INPUT"
    end
  end

  def spanish 
    @intro_text = 
     "\"\n\n\n\nHola! Este es un prototipo del famoso juego \" 3 en raya \"... /n
      Solo que esta vez no esta en el dorso de tu cuaderno si no que está en la pantalla de tu computador.   :)\n\n
      Las reglas son sencillas, el que logré anotar 3 símbolos seguidos gana ( De ahí el nombre de 3 en raya, duh ).
      La Unica modalidad disponible es el PVP ya que no le he añadido el PVM aún. Para poder anotar dónde quieres poner  
      cada uno, seguiremos una notación de una letra para el eje \"Y\" y un número en el eje \"X\" (Ejemplo: A1)\n
      Habiendo dicho todo esto... les pediré que introduzcan sus nombres . ¡Y que gane el mejor!\"\n"
      
    @draw_text = "¡Se acabo! parece ser que quedaron en tablas. ¿Quieren jugar otra vez?"
      
    @motivational_array = 
     ["Mejor suerte para la proxima :)", "GG WP", 
      "¿A que no aceptas una revancha eh?", 
      "¡Buen juego", "Y asi es como se rompen amistades...", 
      "¡¡Juguemos otra vez!!"]

    @who_win_text = "El jugador #{@winner} gano!/n #{@motivational_array.sample}"
      
    @player1_selector_text = "\nEscribe el nombre del primer jugador:\n"

    @player2_selector_text = "\n¿Ahora que tal si me cuentan el del segundo?:\n"
    
    @player_move_text= "\nAhora haz tu movimiento:\n"

    @error_input_msgs = 
     ["\nNo usaste el formato correcto\n", 
      "\nPor favor introducelo en el formato correcto\n",
      "\nDebes usar el formato Letra/Numero (Ejemplo: A0, C2)\n"]
    return 0
  end

  def english
    @intro_text = 
    "\n\n\n\nHello! This is a prototype of the famous game \"Tic-Tac-Toe\"... Only this time it\'s not on the back of your notebook but on your computer screen. :)\n\n
     The rules are simple, whoever managed to score 3 symbols in a row wins ( Hence the 'why' is in someplaces called '3 in a row', duh ).
     The only mode available is the PVP since I haven\'t added the PVM yet. In order to write down where you 
     want to put each one, we will follow a notation of a letter for the \"Y\" axis and a number on the \"X\" axis (Example: A1)

     Having said all this... I will ask you to enter your names. And may the best win!"

     
    @draw_text = "It's over! and it's a draw... Do you want to play again?"
     
    @motivational_array = 
     ["Better luck next time :)", 
      "GG WP", "What about a remacht?", 
      "Good Game!", "Sometimes i think this will end a couple of friendships...", 
      "Let's play again!!"]

    @who_win_text = "#{@winner} win!\n #{@motivational_array.sample}"
     
    @player1_selector_text = "\nTell me the name of the first player:\n"

    @player2_selector_text = "\nNow tell me the name of the second one:\n"

    @player_move_text= "\nNow make your move:\n"

    @error_input_msgs = 
     ["\nYou didn't use the right format\n", 
      "\nPlease, use the right format\n",
      "\nYou have to use the Letter/Number format (Example: A0 or C2)\n"]
    return 0
  end
end

#___________________________________________________CLASS SECTOR_________________________________________________________________________________________________________________________

class Game
  include Language
  include Logic_Framework

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
  def select_language
    puts "\nSelect your Language:\n\n English:0 \n Spanish:1\n\nSorry if your language isn't here yet, i am working on it"
    @language = gets.chomp.to_i
    selector()
  end
  def game_menu
    puts
  end
  def select_name
    puts @intro_text
    puts @player1_selector_text
    @player1_name = gets.chomp
    puts @player2_selector_text
    @player2_name = gets.chomp
  end
end
# instanceOne = Game.new
# instanceOne.select_language

def position_decrypter (text)
  position_array = text.split("")
  p position_array
end
position_decrypter("a1")