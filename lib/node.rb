# frozen_string_literal: true

# A class that stores data and pointers to the parent node and all eight possible move directions a knight can go.
class Node
  attr_accessor :data, :parent, :first, :second, :third, :fourth, :fifth, :sixth, :seventh, :eight

  def initialize(data, parent = nil, first = second = third = fourth = fifth = sixth = seventh = eight = nil)
    @data = data
    @parent = parent
    @first = first
    @second = second
    @third = third
    @fourth = fourth
    @fifth = fifth
    @sixth = sixth
    @seventh = seventh
    @eight = eight
  end
end
