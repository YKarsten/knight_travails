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
    puts "It's #{current_player.color}'s turn"
    
    #prompt current player to enter a starting position
    loop do
      puts 'Select a piece to move: '
      start_pos = current_player.get_pos
      p start_pos
    end 

    # prompt current player to enter a end position
    puts 'Select a position to move to:'
    end_pos = current_player.get_pos
    p end_pos


    # move the piece
  end
end