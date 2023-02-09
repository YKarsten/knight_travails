# frozen_string_literal: true

require_relative './lib/pieces_collection'
require_relative './lib/board'
require_relative './lib/board_render'

# # make new Board instance
board = Board.start_chess

# # Makes a board and populates the second and seventh rank with pawns
text_board = BoardRender.new(board)
puts text_board.render

# puts 'pawn moves'
# p board[[1, 0]].available_moves

# puts 'available moves'
# puts board[[0, 2]].available_moves

# level_order = board[[0, 2]].level_order

# Check for knight travails functionality
# puts 'Starting from [0,2], whats the shortest path to reach [2,6] for a knight?'
# p board[[0, 2]].knight_move(level_order, [2, 6])

p board[[1, 1]].available_moves

board[[2, 2]] = Pawn.new(board, [2, 2], :white)
p board[[1, 1]].available_moves
board[[2, 0]] = Pawn.new(board, [2, 0], :white)
p board[[1, 1]].available_moves

# p board[[1, 2]].available_moves

# Display all possible moves for the knight at [0, 2]

# puts text_board.render

# b = Board.new
# b[[0, 0]] = Pawn.new(b, :white)
# b[[0, 1]] = Pawn.new(b, :black)

# piece = b[[0, 0]]
# puts piece.enemy?([0, 1])

# b = Board.new
# b[[0, 0]] = Pawn.new(b, [0, 0], :black)
# p b[[0, 0]].available_moves

test = Board.new
test[[7, 3]] = Queen.new(test, [7, 3], :black)
test[[7, 4]] = King.new(test, [7, 4], :black)
test[[7, 5]] = Bishop.new(test, [7, 5], :black)

p test[[7,4]].available_moves
