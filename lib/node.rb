# frozen_string_literal: true

# A class that stores data and pointers to left and right child nodes.
class Node
  attr_accessor :data, :first, :second, :third, :fourth, :fifth, :sixth,:seventh, :eight 

  def initialize(data, first = nil, second = nil, third = nil,
   fourth = nil, fifth = nil, sixth = nil, seventh = nil, eight = nil)
    @data = data
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
