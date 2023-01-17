# frozen_string_literal: true

require_relative './node'
require_relative './tree'
require_relative './piece'

# Basic pawn chess piece
class Knight < Piece
  attr_accessor :result

  def to_s
    # depending on the color, this prints unicode chess pieces in black or white
    color == :black ? "\u265E" : "\u2658"
  end

  def available_moves
    Tree.new(current_r, current_c)
  end

  # level order traversal
  def level_order
    # if the tree is empty, return
    root = available_moves.root
    return if root.nil?

    queue = [root]
    result = []

    # While there is at least one discovered node
    until queue.empty?
      # push the address of the nodes children to the queue

      queue << queue[0].first unless queue[0].first.nil?
      queue << queue[0].second unless queue[0].second.nil?
      queue << queue[0].third unless queue[0].third.nil?
      queue << queue[0].fourth unless queue[0].fourth.nil?
      queue << queue[0].fifth unless queue[0].fifth.nil?
      queue << queue[0].sixth unless queue[0].sixth.nil?
      queue << queue[0].seventh unless queue[0].seventh.nil?
      queue << queue[0].eight unless queue[0].eight.nil?

      # push that node into result that node
      result << queue[0]

      # remove the front element of the queue
      queue.shift
    end
    # print just the end result
    result
  end

  def knight_move(level_order, goal)
    # return unless goal.instance_of?(array) && goal.length == 2

    level_order.find { |node| node.data == goal }
    # print node data
    # go to parent class
    # repeat until parent = nil
    # invert the array
  end
end
