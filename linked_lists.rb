# frozen_string_literal: true

require './node'

# this class creates the linked lists
class LinkedList
  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    node = Node.new(value)
    if @head.nil?
      @head = node
      @tail = node
    else
      @tail.next = node
      @tail = node
    end
  end

  def prepend(value)
    node = Node.new(value)
    if @head.nil?
      @head = node
      @tail = node
    else
      node.next = @head
      @head = node
    end
  end

  def size
    return 0 if @head.nil?

    count = 0
    temp = @head
    until temp.nil?
      count += 1
      temp = temp.next
    end
    count
  end

  def at(index)
    temp = @head
    index.times do
      temp = temp.next
    end
    temp
  end

  def pop
    return nil if @head.nil?

    last = @tail
    @tail = self.at(self.size - 2)
    @tail.next = nil
    last
  end

  def contains?(value)
    for i in 0...self.size
      return true if self.at(i).value == value
    end
    false
  end
end
