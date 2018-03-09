class Node
  attr_accessor :value, :node_next
  def initialize(value, node_next)
    @value = value
    @node_next = node_next
  end
end