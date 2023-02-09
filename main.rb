# frozen_string_literal: true

require_relative './lib/pieces_collection'
require_relative './lib/board'
require_relative './lib/board_render'
require_relative './lib/player'
require_relative './lib/game'

g = Game.new
g.play
