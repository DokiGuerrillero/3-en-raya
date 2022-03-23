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
