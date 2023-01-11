# frozen_string_literal: true

require_relative './lib/pieces_collection'
require_relative './lib/board'
require_relative './lib/board_render'

# # make new Board instance
# board = Board.start_chess

# # Makes a board and populates the second and seventh rank with pawns
# text_board = BoardRender.new(board)
# puts text_board.render

# b = Board.new
# b[[0, 0]] = Pawn.new(b, :white)
# b[[0, 1]] = Pawn.new(b, :black)

# piece = b[[0, 0]]
# puts piece.enemy?([0, 1])

b = Board.new
b[[0, 0]] = Rook.new(b, [0, 0], :black)
p b[[0, 0]].available_moves
