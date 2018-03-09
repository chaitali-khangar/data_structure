class Node
  attr_accessor :value, :node_next, :prev_node
  def initialize(value, prev_node, node_next)
    @value = value
    @node_next = node_next
    @prev_node = prev_node
  end
end

class DoubleLinkedList
  attr_accessor :head
  def initialize(value)
    @head = Node.new(value, nil, nil)
  end
  def add(value)
    current = @head
    node = Node.new(value, nil, current)
    current.prev_node = node
    @head = node
  end

  def add_last(value)
    current = @head
    while current.node_next != nil
      current = current.node_next
    end
    node = Node.new(value, current, nil)
    current.node_next = node
  end

  def insert(position, value)
    current = @head
    index = 0
    while index < position
      index += 1
      current = current.node_next
    end
    previous_node = current.prev_node
    node = Node.new(value, previous_node, current)
    current.prev_node = node
    previous_node.node_next = node
  end

  def delete_at(position)
    current = @head
  end

  def delete(value)
    current = @head
    if current.value == value
      @head = current.node_next
      @head.prev_node = nil
      current.node_next = nil
    else
      while current.value != value
        current = current.node_next
      end
      remove(current)
    end
  end

  def delete_last(value)
    current = @head
    while current.node_next != nil
      current = current.node_next
    end
    while current.value != value
      current = current.prev_node
    end
    remove(current)
  end

  def remove(current)
    previous_node = current.prev_node
    next_node = current.node_next
    previous_node.node_next = next_node
    next_node.prev_node = previous_node unless next_node.nil?
    current.prev_node = nil
    current.node_next = nil
  end

  def reverse
    current_node = @head
    while current_node.node_next != nil
      current_node = current_node.node_next
    end
    while current_node.prev_node != nil
      puts "Link List Value #{current_node.value} => #{current_node.prev_node}"
      current_node = current_node.prev_node
    end
    puts "Link List Value #{current_node.value} => #{current_node.prev_node}"
  end

  def print_linked_list
    current_node = @head
    while current_node.node_next != nil
      puts "Link List Value #{current_node.value} => #{current_node.node_next}"
      current_node = current_node.node_next
    end
    puts "Link List Value #{current_node.value} => #{current_node.node_next}"
    puts "Head is #{@head.value}"
  end
end

linked_list = DoubleLinkedList.new(10)
linked_list.add(20)
linked_list.add(30)
linked_list.print_linked_list
puts "Delete"
linked_list.delete(20)
linked_list.print_linked_list
puts "Add last"
linked_list.add_last(40)
linked_list.print_linked_list
# puts "Delete last"
# linked_list.delete_last(40)
# linked_list.print_linked_list
puts "Insert"
linked_list.insert(1,50)
linked_list.print_linked_list
puts "reverse"
linked_list.reverse
