require_relative 'Game'
module GameoflifeGem
  class Rules < Game_Life
    def check_rules(coorx, coory)
      aliveCells = 0
      row = coorx
      col = coory
      if (row != 0 && row != @@board_size - 1 && col != 0 && col != @@board_size - 1) 
        aliveCells = middle_cells(row,col)
      end
      # left corner  top
      if (row == 0 && col == 0) 
        aliveCells = left_corner_top(row,col)
      end
      #rigth corner top
      if (row == 0 && col == @@board_size - 1) 
        aliveCells = rigth_corner_top(row,col)
      end
      #left corner down
      if (row == @@board_size - 1 && col == 0) 
        aliveCells = left_corner_down(row,col)
      end
      #rigth corner down
      if (row == @@board_size - 1 && col == @@board_size - 1) 
        aliveCells = rigth_corner_down(row,col)        
      end
      #edge central top
      if (row == 0 && col != 0 && col != @@board_size - 1) 
        aliveCells = edge_central_top(row,col)
      end
      #edge central down
      if (row == @@board_size - 1 && col != 0 && col != @@board_size - 1) 
        aliveCells = edge_central_down(row,col)
      end
      #edge left
      if (col == 0 && row != @@board_size - 1 && row != 0) 
        aliveCells = edge_left(row,col) 
      end
      #edge right
      if (col == @@board_size - 1 && row != 0 && row != @@board_size - 1) 
        aliveCells =  edge_right(row,col)
      end
      currentCell = @@board[coorx][coory];
      cell = live_die(aliveCells , currentCell) #val of cell
      return cell 
    end

    def middle_cells(row,col)
      aliveCells = 0
      #top
      if (@@board[row - 1][col - 1] == 1) 
        aliveCells += 1 
      end
      if (@@board[row - 1][col] == 1) 
          aliveCells += 1 
      end
      if (@@board[row - 1][col + 1] == 1) 
           aliveCells += 1 
      end
      #same row 
      if (@@board[row][col - 1] == 1) 
           aliveCells += 1 
      end
      if (@@board[row][col + 1] == 1) 
           aliveCells += 1 
      end
      #under
      if (@@board[row + 1][col - 1] == 1) 
          aliveCells += 1 
      end
      if (@@board[row + 1][col] == 1) 
          aliveCells += 1 
      end
      if (@@board[row + 1][col + 1] == 1) 
           aliveCells += 1 
      end
      return aliveCells
    end

    def left_corner_top(row,col)
      aliveCells = 0
      #top
      if (@@board[@@board_size - 1][@@board_size - 1] == 1) 
          aliveCells+=1
      end
      if (@@board[@@board_size - 1][0] == 1) 
          aliveCells+=1
      end
      if (@@board[@@board_size - 1][1] == 1) 
          aliveCells+=1
      end
      #same row 
      if (@@board[row][@@board_size - 1] == 1) 
          aliveCells+=1
      end
      if (@@board[row][col + 1] == 1) 
          aliveCells+=1
      end
      #under
      if (@@board[row + 1][@@board_size - 1] == 1) 
          aliveCells+=1
      end
      if (@@board[row + 1][col] == 1) 
          aliveCells+=1
      end
      if (@@board[row + 1][col + 1] == 1) 
          aliveCells+=1
      end
      return aliveCells
    end

    def rigth_corner_top(row,col)
      aliveCells = 0
      #top
      if (@@board[@@board_size - 1][col - 1] == 1) 
          aliveCells+=1
      end
      if (@@board[@@board_size - 1][col] == 1) 
          aliveCells+=1
      end
      if (@@board[@@board_size - 1][0] == 1) 
          aliveCells+=1
      end
      #same row 
      if (@@board[row][col - 1] == 1) 
          aliveCells+=1
      end
      if (@@board[row][0] == 1) 
          aliveCells+=1
      end
      #under
      if (@@board[row + 1][col - 1] == 1) 
          aliveCells+=1
      end
      if (@@board[row + 1][col] == 1) 
          aliveCells+=1
      end
      if (@@board[row + 1][0] == 1) 
          aliveCells+=1
      end
       # puts "Celulas vivas rigth corner top"
       # puts aliveCells
       return aliveCells
    end

    def left_corner_down(row,col)
      aliveCells = 0
      #top
      if (@@board[row - 1][@@board_size - 1] == 1) 
          aliveCells+=1
      end
      if (@@board[row - 1][col] == 1) 
          aliveCells+=1
      end
      if (@@board[row - 1][col + 1] == 1) 
          aliveCells+=1
      end
      #same row 
      if (@@board[row][@@board_size - 1] == 1) 
          aliveCells+=1
      end
      if (@@board[row][col + 1] == 1) 
          aliveCells+=1
      end
      #under
      if (@@board[0][@@board_size - 1] == 1) 
          aliveCells+=1
      end
      if (@@board[0][col] == 1) 
          aliveCells+=1
      end
      if (@@board[0][col + 1] == 1) 
          aliveCells+=1
      end
      return aliveCells
    end

    def rigth_corner_down(row,col)
      aliveCells = 0
      #top
      if (@@board[row - 1][col - 1] == 1) 
          aliveCells+=1
      end
      if (@@board[row - 1][col] == 1) 
          aliveCells+=1
      end
      if (@@board[row - 1][0] == 1) 
          aliveCells+=1
      end
      #same row 
      if (@@board[row][col - 1] == 1) 
          aliveCells+=1
      end
      if (@@board[row][0] == 1) 
          aliveCells+=1
      end
      #under
      if (@@board[0][col - 1] == 1) 
          aliveCells+=1
      end
      if (@@board[0][col] == 1) 
          aliveCells+=1
      end
      if (@@board[0][0] == 1) 
          aliveCells+=1
      end
      return aliveCells
    end

    def edge_central_top(row,col)
      aliveCells = 0
      if (@@board[@@board_size - 1][col - 1] == 1) 
          aliveCells+=1
      end
      if (@@board[@@board_size - 1][col] == 1) 
          aliveCells+=1
      end
      if (@@board[@@board_size - 1][col + 1] == 1) 
          aliveCells+=1
      end
      #same row 
      if (@@board[row][col - 1] == 1) 
          aliveCells+=1
      end
      if (@@board[row][col + 1] == 1) 
          aliveCells+=1
      end
      #under
      if (@@board[row + 1][col - 1] == 1) 
          aliveCells+=1
      end
      if (@@board[row + 1][col] == 1) 
          aliveCells+=1
      end
      if (@@board[row + 1][col + 1] == 1) 
          aliveCells+=1
      end
      return aliveCells
    end

    def edge_central_down(row,col)
      aliveCells = 0
      if (@@board[row - 1][col - 1] == 1) 
          aliveCells+=1
      end
      if (@@board[row - 1][col] == 1) 
          aliveCells+=1
      end
      if (@@board[row - 1][col + 1] == 1) 
          aliveCells+=1
      end
      #same row 
      if (@@board[row][col - 1] == 1) 
          aliveCells+=1
      end
      if (@@board[row][col + 1] == 1) 
          aliveCells+=1
      end
      #under
      if (@@board[0][col - 1] == 1) 
          aliveCells+=1
      end
      if (@@board[0][col] == 1) 
          aliveCells+=1
      end
      if (@@board[0][col + 1] == 1) 
          aliveCells+=1
      end
      return aliveCells
    end

    def edge_left(row,col)
      aliveCells = 0
      if (@@board[row - 1][@@board_size - 1] == 1) 
          aliveCells+=1
      end
      if (@@board[row - 1][col] == 1) 
          aliveCells+=1
      end
      if (@@board[row - 1][col + 1] == 1) 
          aliveCells+=1
      end
      #same row 
      if (@@board[row][@@board_size - 1] == 1) 
          aliveCells+=1
      end
      if (@@board[row][col + 1] == 1) 
          aliveCells+=1
      end
      #under
      if (@@board[row + 1][@@board_size - 1] == 1) 
          aliveCells+=1
      end
      if (@@board[row + 1][col] == 1) 
          aliveCells+=1
      end
      if (@@board[row + 1][col + 1] == 1) 
          aliveCells+=1
      end
      return aliveCells
    end

    def edge_right(row,col)
      aliveCells = 0
      if (@@board[row - 1][col - 1] == 1) 
          aliveCells+=1
      end
      if (@@board[row - 1][col] == 1) 
          aliveCells+=1
      end
      if (@@board[row - 1][0] == 1) 
          aliveCells+=1
      end

      #same row 
      if (@@board[row][col - 1] == 1) 
          aliveCells+=1
      end
      if (@@board[row][0] == 1) 
          aliveCells+=1
      end

      #under
      if (@@board[row + 1][col - 1] == 1) 
          aliveCells+=1
      end
      if (@@board[row + 1][col] == 1) 
          aliveCells+=1
      end
      if (@@board[row + 1][0] == 1) 
          aliveCells+=1
      end
      return aliveCells
    end

    def live_die(aliveCells,currentCell )
      if (currentCell == 1 && aliveCells < 2) 
        return 0
      end
      if (currentCell == 1 && aliveCells > 3) 
        return 0
      end
      if (currentCell == 1 && (aliveCells >= 2 || aliveCells <= 3)) 
        return 1
      end
      if (currentCell == 0 && aliveCells == 3) 
        return 1
      end
      return 0
    end
    
  end
end
