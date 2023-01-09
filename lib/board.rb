class Board
  attr_reader :grid
  def initialize
    @grid = [
      [nil, nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil, nil]
    ]
  end

  # set data for location
  def []= (location, piece)
    row, column = location
    grid[row][column] = piece
  end

  # get data for location
  def [] (location)
    row, column = location
    grid[row][column] 
  end

  def in_bounds?(location)
    row, column = location
    row < grid.length &&
    column < grid.length &&
    row >= 0 &&
    column >= 0
  end
end

