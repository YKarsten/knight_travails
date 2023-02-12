# frozen_string_literal: true

# Allows piece like rook, bishop and queen to slide across the board. Piece class needs to include this.
module Slideable
  def available_moves
    moves = []
    # dr: direction_row, dc: direction_column
    # each piece has a few set directions it can move, stored in move_dirs
    # This method picks up one of those directions and iterates in the given direction until
    # it hits a piece or the edge of the board.
    # The available moves are saved in an array and returned.
    move_dirs.each do |(dr, dc)|
      current_r, current_c = location

      loop do
        # until we hit a piece, add the location + dr, dc to moves
        current_r += dr
        current_c += dc
        loc = [current_r, current_c]

        break unless board.in_bounds?(loc)

        if enemy?(loc)
          moves << loc
          break
        end

        # if the position is empty, add it to moves array
        break unless board.empty?(loc)

        moves << loc
        # if there is an enemy in the position, add that position and then break out of the loop
      end
    end
    moves
  end
end
