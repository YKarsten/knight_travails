# frozen_string_literal: true

# Class used to store a color and get input to move a piece
class Player
  attr_reader :color

  def initialize(color)
    @color = color
  end

  def get_pos
    # get input from the player
    # remove the newlines
    # split the string along the comma
    # map it to integers
    # return the result
    gets
      .chomp
      .split(',')
      .map {|part| part.to_i}
  end
end
