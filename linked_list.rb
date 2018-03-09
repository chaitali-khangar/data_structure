class Node
  attr_accessor :value, :node_next
  def initialize(value, node_next)
    @value = value
    @node_next = node_next
  end
end

class LinkedList
  attr_accessor :head
  def initialize(value)
    @head = Node.new(value, nil)
  end

  def add(value)
    current_node = @head
    while current_node.node_next != nil
      current_node = current_node.node_next
    end
    current_node.node_next = Node.new(value, nil)
  end

  def delete(value)
    current_node = @head
    if current_node.value == value
      @head = current_node.next_node
      current_node.next_node = nil
    else
      while current_node.node_next.value != value
        current_node = current_node.node_next
      end
      current_node.node_next = current_node.node_next.node_next
    end
    
  end 

  def reverse
    current_node = @head
    @prev_node, @next_node = nil, nil
    while current_node
      @next_node = current_node.node_next
      current_node.node_next = @prev_node
      @prev_node = current_node
      current_node = @next_node
    end
    @head = @prev_node
  end 

  def print_linked_list
    current_node = @head
    while current_node.node_next != nil
      puts "Link List Value #{current_node.value} => #{current_node.node_next}"
      current_node = current_node.node_next
    end
    puts "Link List Value #{current_node.value} => #{current_node.node_next}"
  end
end

linked_list = LinkedList.new(10)
linked_list.add(20)
linked_list.add(30)
linked_list.add(40)
linked_list.add(50)
linked_list.print_linked_list
puts "After Delete Operation"
linked_list.delete(30)
linked_list.print_linked_list
linked_list.reverse
puts "After reverse Operation"
linked_list.print_linked_list