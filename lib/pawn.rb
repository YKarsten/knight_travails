# frozen_string_literal: true

# Basic pawn chess piece
class Pawn < Piece
  # Currently black is always on the topside of the board so the black pawns walk down the white ones walk up the board.
  def fwd_direction
    color == :black ? 1 : -1
  end

  def at_start?
    color == :black && current_r == 1 || color == :white && current_r == 6
  end

  def available_moves
    moves = []

    # 1 forward move
    one_forward = [current_r + fwd_direction, current_c]
    moves << one_forward if board.empty?(one_forward)

    # 2 forward move
    two_forward = [current_r + fwd_direction * 2, current_c]
    moves << two_forward if board.empty?(two_forward) && board.empty?(one_forward) && at_start?

    diag_left = [current_r + fwd_direction, current_c + 1]
    diag_right = [current_r + fwd_direction, current_c + -1]
    moves << diag_left if enemy?(diag_left)
    moves << diag_right if enemy?(diag_right)

    moves.select { |m| board.in_bounds?(m) }
  end

  # puts or p.to_s override
  # what does this piece look like if we print it to the console?
  def to_s
    # depending on the color, this prints unicode chess pieces in black or white
    color == :black ? "\u265F" : "\u2659"
  end
end
