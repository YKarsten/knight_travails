# frozen_string_literal: true

require_relative './node'
require_relative './board'

class Tree < Board 

  def initialize(current_r, current_c)
    @root = build_tree(current_r, current_c)
    @current_r = current_r
    @current_c = current_c
  end

  def build_tree(r, c, counter = 0)

    node = Node.new([r, c])
    return node if counter > 7

    node.first = build_tree(r + 1, c + 2, counter += 1) if in_bounds?(r + 1, c + 2)
      
    node.second = build_tree(r + 1, c - 2, counter += 1) if in_bounds?(r + 1, c - 2)
        
    node.third = build_tree(r - 1, c + 2, counter += 1) if in_bounds?(r - 1, c + 2)

    node.fourth = build_tree(r - 1, c - 2, counter += 1) if in_bounds?(r - 1, c - 2)

    node.fifth = build_tree(r + 2, c + 1, counter += 1) if in_bounds?(r + 2, c + 1)

    node.sixth = build_tree(r +2 1, c - 1, counter += 1) if in_bounds?(r + 2, c - 1)

    node.seventh = build_tree(r - 2, c + 1, counter += 1) if in_bounds?(r - 2, c + 1)

    node.third = build_tree(r - 2, c - 1, counter += 1) if in_bounds?(r - 2, c - 1)
  
    node
  end

  def in_bounds?(row, column)
    row < 8 &&
      column < 8 &&
      row >= 0 &&
      column >= 0
  end
end