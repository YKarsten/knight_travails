# frozen_string_literal : true

# Visualization of the Board class instance
class BoardRender
  attr_reader :board

  def initialize(board)
    @board = board
  end

  def render
    8.times do |row|
      8.times do |column|
        piece = board[[row, column]]
        if piece.nil?
          # unicode empty square character
          print "\u25A1" + ' '
        else
          print "#{board[[row, column]]} "
        end
      end
      puts ''
    end
  end
end
