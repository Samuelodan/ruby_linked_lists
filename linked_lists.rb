# frozen_string_literal: true

require './node'

# this class creates the linked lists
class LinkedList
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

  def head
    hd = @head
    hd.value
  end

  def tail
    tl = @tail
    tl.value
  end

  def at(index)
    temp = @head
    index.times do
      temp = temp.next
    end
    temp.value
  end
end
