# frozen_string_literal: true

# this type of error is raised when the player input for move_piece is faulty.
# ArgumentError parent class accepts a string argument
class InvalidMoveError < ArgumentError
  # I'm not sure if this needs to be here
  'Unable to move to that position'
end
