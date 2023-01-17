# frozen_string_literal: true

require_relative './node'
require_relative './board'

# A balanced binary search tree of 8 levels that represents the positions a knight piece can travel. 
class Tree < Board
  attr_accessor :root

  def initialize(current_r, current_c)
    @root = build_tree(current_r, current_c)
    @current_r = current_r
    @current_c = current_c
  end

  # Builds a binary search tree of positions the knight can move to. Also has reference to the parent node/ position
  def build_tree(r, c, counter = 0, parent = nil)
    node = Node.new([r, c])
    node.parent = parent

    return node if counter > 7

    node.first = build_tree(r + 1, c + 2, counter += 1, Node.new([r, c])) if counter <= 7 && in_bounds?(r + 1, c + 2)

    node.second = build_tree(r + 1, c - 2, counter += 1, Node.new([r, c])) if counter <= 7 && in_bounds?(r + 1, c - 2)

    node.third = build_tree(r - 1, c + 2, counter += 1, Node.new([r, c])) if counter <= 7 && in_bounds?(r - 1, c + 2)
 
    node.fourth = build_tree(r - 1, c - 2, counter += 1, Node.new([r, c])) if counter <= 7 && in_bounds?(r - 1, c - 2)

    node.fifth = build_tree(r + 2, c + 1, counter += 1, Node.new([r, c]))  if counter <= 7 && in_bounds?(r + 2, c + 1)
 
    node.sixth = build_tree(r + 2, c - 1, counter += 1, Node.new([r, c]))  if counter <= 7 && in_bounds?(r + 2, c - 1)
 
    node.seventh = build_tree(r - 2, c + 1, counter += 1, Node.new([r, c])) if counter <= 7 && in_bounds?(r - 2, c + 1)
 
    node.eight = build_tree(r - 2, c - 1, counter += 1, Node.new([r, c]))  if counter <= 7 && in_bounds?(r - 2, c - 1)


    node
  end

  def in_bounds?(row, column)
    row < 8 &&
      column < 8 &&
      row >= 0 &&
      column >= 0
  end
end
