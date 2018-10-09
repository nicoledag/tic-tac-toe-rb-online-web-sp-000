require 'pry'

WIN_COMBINATIONS = [[0,1,2],
[3,4,5],
[6,7,8],
[0,3,6],
[1,4,7],
[2,5,8],
[0,4,8],
[6,4,2]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
   converted_input = user_input.to_i - 1
   converted_input
end

def move(board, index, char)
  board[index] = char
end

def position_taken?(board, index)
  board[index] != " " && board[index] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"

  user_input = gets.strip
  index = input_to_index(user_input)

  if valid_move?(board, index)
    player = current_player(board)
    move(board, index, player)
    display_board(board)

  else
    turn(board)

 end
end

def turn_count(board)

counter = 0

board.each do |space|
  if space == "X" || space == "O"
  counter += 1

 end
end
 return counter

end


def current_player(board)

if turn_count(board) % 2 == 0
  return "X"
else
  return "O"

 end
end


def won?(board)
WIN_COMBINATIONS.each do | win_combination |

  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]

  position_1 = board[win_index_1]
  position_2 = board[win_index_2]
  position_3 = board[win_index_3]

  if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return win_combination
  elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
    return win_combination
      end
    end
    return false
  end


  def full?(board)
  board.all? { |index| index == "X" || index == "O"  }
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  else
    false
  end
end

def winner(board)
  if win_combination = won?(board)
  return  board[win_combination.first]
  end
end

def play(board)
 until over?(board) == true
  turn(board)
end

if won?(board)
  puts "Congratulations #{winner(board)}!"

else draw?(board)
  puts "Cat's Game!"

 end

end
