# frozen_string_literal: true

require_relative './lib/pieces_collection'
require_relative './lib/board'
require_relative './lib/board_render'

# # make new Board instance
board = Board.start_chess

# # Makes a board and populates the second and seventh rank with pawns
text_board = BoardRender.new(board)
puts text_board.render
# p board[[1, 1]].available_moves

# board[[2, 2]] = Pawn.new(board, [2, 2], :white)
# p board[[1, 1]].available_moves
# board[[2, 0]] = Pawn.new(board, [2, 0], :white)
# p board[[1, 1]].available_moves

# p board[[1, 2]].available_moves

# Display all possible moves for the knight at [0, 2]
puts "available moves"
moves = board[[0, 2]].available_moves

level_order = board[[0, 2]].level_order

puts 'Return the first node that matches my goal position'
p board[[0, 2]].knight_move(level_order, [2, 6])


# puts text_board.render

# b = Board.new
# b[[0, 0]] = Pawn.new(b, :white)
# b[[0, 1]] = Pawn.new(b, :black)

# piece = b[[0, 0]]
# puts piece.enemy?([0, 1])

# b = Board.new
# b[[0, 0]] = Pawn.new(b, [0, 0], :black)
# p b[[0, 0]].available_moves
