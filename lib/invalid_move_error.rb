# frozen_string_literal: true

# this type of error is raised when the player input for move_piece is faulty.
# ArgumentError parent class accepts a string argument
class InavlidMoveError < ArgumentError
  'Unable to move to that position'
end
