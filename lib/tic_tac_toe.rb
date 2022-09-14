class TicTacToe
    attr_accessor :board
    def initialize
        @board = [" "," "," "," "," "," "," "," "," "]
    end

WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]]

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} " 
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} " 
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} " 

    end

    def input_to_index (num_string)
       input = (num_string.to_i) -1
        # valid_move?
    end

    def move (input, token)
        # input_to_index(index)
        @board[input] = token
    end

    def position_taken? (input)
       @board[input] == " " ? false : true
    end

    def valid_move? (input)
        input<9 && input >=0 && position_taken?(input) == false ? true : false
        # is the move a correct number and not already taken? true else false
    end
     def turn_count
        @board.count("X") + @board.count("O")
     end

     def current_player
       turn_count.odd? ? "O" : "X"
     end
     def turn
        input = gets
         index = input_to_index(input)
         token = current_player()
         valid_move?(index) ? move(index, token) : turn()
         display_board
     end

     def won?
        WIN_COMBINATIONS.any? do |w|
          if position_taken?(w[0]) && @board[w[0]] == @board[w[1]] && @board[w[1]] == @board[w[2]]
            return w
          end
        end
      end


     def full? 
       turn_count == 9 ? true : false
     end

     def draw?
        full? && !won?
     end
    
     def over?
        won? || draw?
     end
     
     def winner
        if w = won?
          @board[w[0]]
        end
      end

      def play
        turn until over?
        puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
      end

end