# frozen_string_literal: true


class Game
  attr_reader :player1, :player2
  attr_accessor :current_player

  def initialize
    @player1 = Player.new(:black)
    @player2 = Player.new(:white)
    @current_player = @player1
  end

  def swap_player!
    self.current_player = (current_player == player1 ? player2 : player1)
  end

  def play

    #prompt current player to enter a starting position
    # prompt current player to enter a end position
    # move the piece
  end
end