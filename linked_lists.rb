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

  def find(value)
    index = 0
    for i in 0...self.size
      return index if self.at(i).value == value

      index += 1
    end
    nil
  end

  def to_s
    str = ''
    for i in 0...self.size
      str += "(#{self.at(i).value}) -> "
    end
    "#{str}nil"
  end

  def insert_at(value, index)
    node = Node.new(value)
    at_index = self.at(index)
    after_index = self.at(index + 1)
    at_index.next = node
    node.next = after_index
    self.to_s
  end

  def remove_at(index)
    at_idx = self.at(index)
    before_idx = self.at(index - 1)
    after_idx = self.at(index + 1)

    if at_idx == @head
      @head = after_idx
    elsif at_idx == @tail
      @tail = before_idx
      before_idx.next = nil
    else
      before_idx.next = after_idx
    end
    at_idx
  end
end
