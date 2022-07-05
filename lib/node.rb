# frozen_string_literal: true

# creates nodes
class Node
  attr_accessor :value, :next

  def initialize(value = nil)
    @value = value
    @next = nil
  end
end
