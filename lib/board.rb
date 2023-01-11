# frozen_string_literal: true

# Class that holds location values of a 8x8 chess board. Can be used to determine valid moves
class Board
  attr_reader :grid

  # Makes a board and populates the second and seventh rank with pawns
  def self.start_chess
    board = new
    8.times do |c|
      board[[1, c]] = Pawn.new(board, [1, c], :black)
      board[[6, c]] = Pawn.new(board, [6, c], :white)
    end
    board[[0, 2]] = Knight.new(board, [0, 2], :black)
    board[[0, 5]] = Knight.new(board, [0, 5], :black)
    board[[7, 2]] = Knight.new(board, [7, 2], :white)
    board[[7, 5]] = Knight.new(board, [7, 5], :white)
    board
  end

  def initialize
    @grid = Array.new(8) { Array.new }
  end

  # set data for location
  def []=(location, piece)
    row, column = location
    grid[row][column] = piece
  end

  # get data for location
  def [](location)
    row, column = location
    grid[row][column]
  end

  # check if location is valid. returns boolean
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
end
