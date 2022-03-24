# Source File
# Creator: Andres Ojeda
# Project: Tic-Tac-Toe
# 
# Enjoy it! :)

#___________________________________________________MODULE SECTOR_________________________________________________________________________________________________________________________
module Game_Engine
  def select_name
    system "clear"
    puts @intro_text
    puts @player1_selector_text
    @player1 = gets.chomp
    puts @player2_selector_text
    @player2 = gets.chomp
  end

  def mode_loop (first_time)
    loop do
      @selected_mode =  gets
      break if @selected_mode =~ /^[0-2]\n$/i 
      puts @error_text
    end
    @selected_mode =  @selected_mode.chomp.to_i
  end
  
  def turn_shifter
    if @turn == 0
      @turn = 1
      @playing = @player2
    else
      @turn = 0
      @playing = @player1
    end
  end
  
  def order_input
    puts @player_move_text
    first_time = true 
    loop do
      if first_time == false then puts "\n #{@error_input_msgs.sample}" end
        @text = gets.chomp
        first_time = false
        break if @text =~ /^[a,b,c][0,1,2]$/i
      end
    @text
  end
    
  def print_board 
    system "clear"
    puts" 
    \n\n\t#{@board_text}#{@player1} vs #{@player2} #{@turn_text} #{@playing}\n
    \t\t\t\t   0   1   2
    \t\t\t\t ┌───┬───┬───┐
    \t\t\t\tA│ #{@game_board[0][0]} │ #{@game_board[0][1]} │ #{@game_board[0][2]} │
    \t\t\t\t ├───┼───┼───┤
    \t\t\t\tB│ #{@game_board[1][0]} │ #{@game_board[1][1]} │ #{@game_board[1][2]} │
    \t\t\t\t ├───┼───┼───┤
    \t\t\t\tC│ #{@game_board[2][0]} │ #{@game_board[2][1]} │ #{@game_board[2][2]} │
    \t\t\t\t └───┴───┴───┘
    \n
    \n
    "
      
  end 
    
  
  def board_changer
    loop do
      text = order_input()
      @positions = position_decrypter(text)
      break if @game_board[@positions[0]][@positions[1]] == "-"
      puts "\n#{@error_text}"
    end
    if @turn == 0
      @game_board[@positions[0]][@positions[1]] = "x"
    else
      @game_board[@positions[0]][@positions[1]] = "o"
    end
  end
  
  def position_decrypter(text)
    unfiltered_array = text.split("")
    position_array = []
  
    case unfiltered_array[0].upcase
    when "A"
      position_array[0] = 0 
    when "B"
      position_array[0] = 1
    when "C"
      position_array[0] = 2
    end
    position_array[1] = unfiltered_array[1].to_i
    position_array
  end
  def win_check 
    row_check(@game_board)
    column_check(@game_board)
    diagonal_check(@game_board)
  end
  
  def draw_checker
    if (!@game_board.flatten.include? ("-")) && (@win_condition == false)
      @draw = true
    end
  end
     
end

  
module Logic_Framework
    def row_check(array)
      array.each do |inner_array|
        if (inner_array.each_cons(2).all? {|x,y| x == y}) && !inner_array.include?("-")
        @win_condition = true
      end
    end
  end

  def column_check(array)
    (0..2).each do |i|
      if (array[0][i] == array[1][i]) && (array[1][i] == array[2][i]) && array[0][i] != '-'
        @win_condition = true
      end
    end
  end
  
  def diagonal_check(array)
    if ((array[0][0] == array[1][1]) && (array[1][1] == array[2][2])) || ((array[0][2] == array[1][1]) && (array[1][1] == array[2][0])) && array[1][1] != "-"
      @win_condition = true
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
    @lang_text = "\nSelecciona el idioma:\n\n Ingles:0 \n Español:1\n\nPerdona si aun no tenemos tu idioma, estoy trabajando en ello"
    
    @mode_selector_text = 
     "\nOpciones:\n  0 - Jugar.\n  1 - Idioma.\n  2 - Salir.\n\n"
    @intro_text = 
     "\nHola! Este es un prototipo del famoso juego \" 3 en raya \"... \nSolo que esta vez no esta en el dorso de tu cuaderno si no que está en la pantalla de tu computador.   :)\n\nLas reglas son sencillas, el que logré anotar 3 símbolos seguidos gana ( De ahí el nombre de 3 en raya, duh ).\nLa Unica modalidad disponible es el PVP ya que no le he añadido el PVM aún. Para poder anotar dónde quieres poner\ncada uno, seguiremos una notación de una letra para el eje \"Y\" y un número en el eje \"X\" (Ejemplo: A1)\n\n\n\nHabiendo dicho todo esto... les pediré que introduzcan sus nombres . ¡Y que gane el mejor!\"\n"
      
    @draw_text = "¡Se acabo! parece ser que quedaron en tablas. ¿Quieren jugar otra vez?"
      
    @motivational_array = 
     ["Mejor suerte para la proxima :)", "GG WP", 
      "¿A que no aceptas una revancha eh?", 
      "¡Buen juego", "Y asi es como se rompen amistades...", 
      "¡¡Juguemos otra vez!!"]

    @who_win_text = " gano!\n #{@motivational_array.sample}"
      
    @player1_selector_text = "\n\nEscribe el nombre del primer jugador:\n"

    @player2_selector_text = "\n\n¿Ahora que tal si me cuentan el del segundo?:\n"
    
    @board_text= "Tablero: "
    
    @turn_text= "| Turno de:"

    @player_move_text= "\nAhora haz tu movimiento:\n"

    @error_input_msgs = 
     ["\nNo usaste el formato correcto\n", 
      "\nPor favor introducelo en el formato correcto\n",
      "\nDebes usar el formato Letra/Numero (Ejemplo: A0, C2)\n"]
    
    @error_text = "Seleccion invalida"
    return 0
  end

  def english 
    @lang_text = "\nSelect your Language:\n\n English:0 \n Spanish:1\n\nSorry if your language isn't here yet, i am working on it"
    
    @mode_selector_text = "\nOptions:\n  0 - Play.\n  1 - Language.\n  2 - Exit\n\n"

    @intro_text = 
    "\nHello! This is a prototype of the famous game \"Tic-Tac-Toe\"... Only this time it\'s not on the back of your notebook but on your computer screen. :)\n\nThe rules are simple, whoever managed to score 3 symbols in a row wins ( Hence the 'why' is in someplaces called '3 in a row', duh ).\nThe only mode available is the PVP since I haven\'t added the PVM yet. In order to write down where you \nwant to put each one, we will follow a notation of a letter for the \"Y\" axis and a number on the \"X\" axis (Example: A1)\n\n\n\nHaving said all this... I will ask you to enter your names. And may the best win!"

     
    @draw_text = "It's over! and it's a tie... Do you want to play again?"
     
    @motivational_array = 
     ["Better luck next time :)", 
      "GG WP", "What about a remacht?", 
      "Good Game!", "Sometimes i think this will end a couple of friendships...", 
      "Let's play again!!"]

    @who_win_text = " win!\n #{@motivational_array.sample}"
     
    @player1_selector_text = "\n\nTell me the name of the first player:\n"

    @player2_selector_text = "\n\nNow tell me the name of the second one:\n"
    
    @board_text= "Game: "
    
    @turn_text= "| Turno de:"

    @player_move_text= "\nNow make your move:\n"

    @error_input_msgs = 
     ["\nYou didn't use the right format\n", 
      "\nPlease, use the right format\n",
      "\nYou have to use the Letter/Number format (Example: A0 or C2)\n"]

    @error_text = "Invalid input"
    return 0
  end
end

#___________________________________________________CLASS SECTOR_________________________________________________________________________________________________________________________

class Game
  include Game_Engine
  include Logic_Framework
  include Language

  def initialize ()
      @game_board = [
        ["-","-","-"],
        ["-","-","-"],
        ["-","-","-"]
      ]
      @win_condition= false
      @draw = false
      @language = 0
      @selected_mode = 0
      @turn = 0
      selector()
      select_language()
      mode_selector()
  end
  
  def select_language
    system "clear"
    puts @lang_text
    loop do
      @language = gets
      break if @language =~ /^[0-1]\n$/i 
      puts "wrong input"
    end
    @language = @language.to_i 
    selector()
  end

  def mode_selector
    while @selected_mode != 2
      system "clear"          
      puts @mode_selector_text
      first_time = true
      mode_loop(first_time)
      if @selected_mode == 0 then ingame_logic() end
      if @selected_mode == 1 then (select_language()) end
    end
  end 

  def ingame_logic
    select_name()
    @turn = 1
    while (@win_condition == false) && (@draw == false)
      turn_shifter()
      print_board()
      board_changer()
      win_check()
      draw_checker()
      if @win_condition == true
        print_board()
        puts "#{@playing} #{@who_win_text}"
        puts "\n Press enter to continue"
        gets
      end
      if @draw == true
        print_board()
        puts @draw_text
        puts "\n Press enter to continue"
        gets
      end
    end
    @win_condition =false
    @draw = false
    @game_board = [
        ["-","-","-"],
        ["-","-","-"],
        ["-","-","-"]
      ]
  end
end
game = Game.new 