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

    [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
      .each_with_index do |piece_klass, column|
      [[0, :black], [7, :white]].each do |(row, color)|
        location = [row, column]
        board[location] = piece_klass.new(board, location, color)
      end
    end
    board
  end

  def initialize
    # instance variable
    @grid = Array.new(8) { Array.new(8, NullPiece.instance) }
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
    grid[row][column] == NullPiece.instance
  end

  def in_check?(color)
    # find returns the actual instance of the king.
    # select would return an array that doesnt support #location method
    king = pieces.find { |piece| piece.color == color && piece.is_a?(King) }.location

    # guard clause
    raise 'No king on the board' if king.nil?

    king_pos = king.location

    # loop over all the pieces of the opposite color
    pieces.reject { |piece| piece == color }.each do |piece|
      #  if any of their pieces available_moves includes the king of color
      # return true, the king is in check
      return true if piece.available_moves.include?(king_pos)
    end
    false
  end

  def checkmate?(color)
    return false unless in_check?(color)

    # select all pieces of one color
    color_pieces = pieces.select { |piece| piece.color == color }
    # check if the pieces have any safe_move
    color_pieces.all? { |piece| piece.safe_moves.empty? }
  end

  def pieces
    # turn the 2D array into a 1D array and remove the nil values
    grid.flatten.reject { |piece| piece.is_a(NullPiece) }
  end

  def move_piece(start_pos, end_pos)
    # validate that end pos is in safe moves
    piece = self[start_pos]

    unless piece.safe_moves.include?(end_pos)
      raise InavlidMoveError.new(
        "End position #{end_pos} not in available moves: #{piece.safe_moves}"
      )
    end
    raise 'End position not in bounds' unless in_bounds?(end_pos)

    move_piece!(start_pos, end_pos)
  end

  # Disconnect the check ups and the actual movement of the piece
  # prevents recursive loops for checkmate situations.
  def move_piece!(start_pos, end_pos)
    # remove the piece from the board at the current location
    # place the piece in the board at the new location
    self[start_pos], self[end_pos] = NullPiece.instance, self[start_pos]

    # update the piece's internal location with end pos
    self[end_pos].location = end_pos
  end

  # dup is also a ruby method, but it doesnt do a deep copy of the board
  # this method copies the board without a memory referency to the original board
  def dup
    new_board = Board.new
    pieces.each do |piece|
      # the new board also needs reference to a "deep copy" of the pieces
      new_piece = piece.class.new(
        new_board,
        piece.location,
        piece.color
      )
      new_board[new_piece.location] = new_piece
    end

    new_board
  end
end
