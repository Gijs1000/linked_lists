class Node
  attr_accessor :value, :next_node
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  attr_accessor :name

  def initialize
    @head = nil
    @tail = nil
  end

  def append(node)
    if @head.nil? # if there are no nodes yet, head points towards the node that was just added, since it's the only node.
      @head = node
      @tail = node
    else # if there are nodes already...
      @tail.next_node = node # newly passed node gets added after last node
      @tail = node # newly passed node is identified as the new last node
    end
  end

  def prepend(node)
    if @head.nil?
      @head = node
      @tail = node
    else
      node.next_node = @head
      @head = node
    end
  end

  def size
    temp_node = @head
    counter = 0
    until temp_node.nil?
      counter += 1
      temp_node = temp_node.next_node
    end
    counter
  end

  def head
    @head
  end

  def tail
    @tail
  end

  def at(index)
    temp_node = @head
    index.times do
      temp_node = temp_node.next_node
    end 
    temp_node
  end

  def pop
    temp_node = @head
    until temp_node.next_node == @tail # until the node after the current temp_node is the last node..
      temp_node = temp_node.next_node # ..temp node becomes the next node
    end 
    temp_node.next_node = nil # once that is done. The temp node's next_node property is set to nil, since it will become the new last node.
    @tail = temp_node # the tail is assigned the temp_node. Since that is now the last node.
  end

  def contains?(value)
    temp_node = @head
    until temp_node == nil
      return true if temp_node.value == value
      temp_node = temp_node.next_node
    end
    false
  end

  def find(value)
    temp_node = @head
    index = 0
    until temp_node == nil
      return index if temp_node.value == value
      index += 1
      temp_node = temp_node.next_node
    end
  end

  def to_s
    return 'nil' if @head.nil?
    string = "( #{@head.value} )"
    temp_node = @head
    until temp_node == @tail
      string.concat(" -> ( #{temp_node.next_node.value} )")
      temp_node = temp_node.next_node
    end
    string.concat(" -> nil")
  end
end


linked_list = LinkedList.new 
linked_list.prepend(Node.new(5))
linked_list.prepend(Node.new(6))
linked_list.prepend(Node.new(7))
linked_list.append(Node.new('aaa'))
linked_list.append(Node.new('bbb'))
p linked_list
p linked_list.to_s
