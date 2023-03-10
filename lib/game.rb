# frozen_string_literal: true

# Class to control the game flow
class Game
  attr_reader :player1, :player2, :board, :renderer
  attr_accessor :current_player

  def initialize(board, player1, player2, renderer_class)
    @board = board
    @renderer = renderer_class.new(board)
    @player1 = player1
    @player2 = player2
    @current_player = @player1
  end

  def swap_player!
    self.current_player = (current_player == player1 ? player2 : player1)
  end

  def play
    until over?
      # render the board
      renderer.render
      puts "It's #{current_player.color}'s turn"
      puts "#{curren_player.color} is in check" if board.in_check?(current_player.color)

      take_turn
      swap_player!
    end
    # When the game is over, swap the player again
    # Puts a message who won
    # print the board
    swap_player!
    puts "Game over! The winner is: #{current_player.color}"
    renderer.render
  end

  def over?
    # checkmated
    board.checkmate?(current_player.color)
    # stalemate
    # current_player.pieces.all? { |piece| piece.available_moves.empty? }
  end

  def take_turn
    start_pos = nil

    # prompt current player to enter a starting position
    loop do
      puts 'Select a piece to move: '
      start_pos = current_player.get_pos
      break if board[start_pos].color != current_player.color

      puts "Did not select a #{current_player.color} piece."
    end

    # prompt current player to enter a end position
    loop do
      puts 'Select a position to move to:'
      end_pos = current_player.get_pos

      # move the piece
      begin
        board.move_piece(start_pos, end_pos)
        # if the input is valid, break out of this begin.. rescue block
        break
        # in case there is the specific error of not providing a valid end position.
        # rescue that error and provide a custom message.
      rescue InvalidMoveError => e
        puts e.message
      end
    end
  end
end
