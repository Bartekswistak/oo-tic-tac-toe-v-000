class TicTacToe

 def initialize(board = nil)
   @board = board || Array.new(9, " ")
 end

 WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [6, 4, 2]]

 def display_board
   puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
   puts "-----------"
   puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
   puts "-----------"
   puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
 end

 def input_to_index(user_input)
     user_input.to_i - 1
 end

 def move(index, token = "X")
   @board[index] = token
 end

 def position_taken?(index)
   @board[index] != " "
 end

 def valid_move?(index)
   (0..8).include?(index) && !position_taken?(index)
 end

def turn_count
  turns = 0
  @board.each do |token|
    if token == "X" || token == "O"
      turns += 1
    end
  end
    turns
end

def current_player
  turn_count.even? ? "X" : "O"
end

def turn
  puts "Please enter 1-9"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
end

def won?
  WIN_COMBINATIONS.find do |win_combo|
    @board[win_combo[0]] == @board[win_combo[1]] && @board[win_combo[2]] == @board[win_combo[1]] && @board[win_combo[1]] != " "
  end
end

def full?
  @board.all? {|space| space != " "}
end

def draw?
  full? && !won?
end

def over?
  won? || draw?
end

def winner
  won? ? @board[won?.first] : nil
end

def play
  until over? || won?
    turn
  end
   if draw?
     puts "Cat's Game!"
   elsif won?
     puts "Congratulations #{winner}" + "!"
   end
end

end
