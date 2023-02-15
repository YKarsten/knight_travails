# frozen_string_literal: true

require_relative './node'
require_relative './tree'

module KnightPath
  # Take the level order array and find the first match for the desired position.
  # Go back up the tree to the root using the parent attribute of node.
  def knight_move(start, goal, result = [])
    goal = goal.data unless goal.instance_of?(Array)

    goal_node = level_order(start).find { |node| node.data == goal }
    result << goal_node

    return print_path(result).reverse if goal_node.parent.nil?

    knight_move(level_order, goal_node.parent, result)
  end
  
  # method used to find the shortest path for a knight from point a to b
  def level_order(start)
    # if the tree is empty, return
    root = Tree.new(current_r, current_c).root
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

  # print the knight moves as a nice Array
  def print_path(knight_moves, result = [])
    knight_moves.each { |node| result << node.data }
    result
  end
end