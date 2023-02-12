# frozen_string_literal: true

# Visualization of the Board class instance
class BoardRender
  attr_accessor :board

  def initialize(board)
    @board = board
  end

  def render
    8.times do |row|
      8.times do |column|
        print "#{board[[row, column]]} "
      end
      puts ''
    end
    puts ''
  end
end
