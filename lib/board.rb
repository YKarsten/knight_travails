# frozen_string_literal: true

# Class that holds location values of a 8x8 chess board. Can be used to determine valid moves
class Board
  #  attr_reader allows access to the instance variable by calling it without the @ in front
  attr_reader :grid

  # factory method
  # Makes a new board and populates it with pieces
  def self.start_chess
    board = new
    8.times do |c|
      # pawns
      board[[1, c]] = Pawn.new(board, [1, c], :black)
      board[[6, c]] = Pawn.new(board, [6, c], :white)
    end
    # knights
    board[[0, 2]] = Knight.new(board, [0, 2], :black)
    board[[0, 5]] = Knight.new(board, [0, 5], :black)
    board[[7, 2]] = Knight.new(board, [7, 2], :white)
    board[[7, 5]] = Knight.new(board, [7, 5], :white)
    # rooks
    board[[0, 0]] = Rook.new(board, [0, 0], :black)
    board[[0, 7]] = Rook.new(board, [0, 7], :black)
    board[[7, 0]] = Rook.new(board, [7, 0], :white)
    board[[7, 7]] = Rook.new(board, [7, 7], :white)
    # bishops
    board[[0, 1]] = Bishop.new(board, [0, 1], :black)
    board[[0, 6]] = Bishop.new(board, [0, 6], :black)
    board[[7, 1]] = Bishop.new(board, [7, 1], :white)
    board[[7, 6]] = Bishop.new(board, [7, 6], :white)
    # queens
    board[[0, 3]] = Queen.new(board, [0, 3], :black)
    board[[7, 3]] = Queen.new(board, [7, 3], :white)
    # kings
    board[[0, 4]] = King.new(board, [0, 4], :black)
    board[[7, 4]] = King.new(board, [7, 4], :white)

    board
  end

  def initialize
    # instance variable
    @grid = Array.new(8) { [] }
  end

  # set data for location/ put a piece on the board
  def []=(location, piece)
    row, column = location
    grid[row][column] = piece
  end

  # get data for location/ what piece is in that square? or empty?
  def [](location)
    row, column = location
    grid[row][column]
  end

  # is the location within the board?
  def in_bounds?(location)
    row, column = location
    row < grid.length &&
      column < grid.length &&
      row >= 0 &&
      column >= 0
  end

  def empty?(location)
    row, column = location
    grid[row][column].nil?
  end

  def move_piece(start_pos, end_pos)
    # validate that end pos is in available moves
    piece = self[start_pos]

    unless piece.available_moves.include?(end_pos)
      raise InavlidMoveError.new("End position #{end_pos} not in available moves: #{piece.available_moves}")
    end
    raise 'End position not in bounds' unless in_bounds?(end_pos)

    # remove the piece from the board at the current location
    self[start_pos] = nil

    # place the piece in the board at the new location
    self[end_pos] = piece

    # update the piece's internal location with end pos
    piece.location = end_pos
  end
end
