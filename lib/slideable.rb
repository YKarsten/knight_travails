# Allows piece like rook, bishop and queen to slide across the board. Piece class needs to include this.
module Slideable
    def available_moves
    moves = []

    # dr: direction_row, dc: direction_column
    move_dirs.each do |(dr, dc)|
      current_r, current_c = location

      loop do
        current_r += dr
        current_c += dc
        loc = current_r, current_c

        break unless board.in_bounds?(loc)

        moves << loc if board.empty?(loc)
        if enemy?(loc)
          moves << loc
          break
        end
      end
    end
    moves
  end
end