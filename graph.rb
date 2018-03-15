class Graph
  attr_accessor :edges, :nodes
  def initialize(nodes)
    @edges = {}
    @nodes = nodes
    nodes.each do |node|
      @edges.merge!({ "#{node}" => [] })
    end
  end

  def add_edge(edge)
    key = edge[0].to_s
    value = edge[1].to_s
    @edges[key].push(value)
    @edges[value].push(key)
  end

  def uniq_edges
    unique_edges = []
    @edges.each do |key, values|
      values.each do |value|
        edge = "#{key}#{value}"
        unless unique_edges.include?(edge) || unique_edges.include?(edge.reverse)
          unique_edges.push(edge)
        end
      end
    end
    puts "Unique edges are #{unique_edges.length}"
    unique_edges.each do |edge|
      puts "Edge #{edge}"
    end
  end

  def print_graph
    @edges.each do |key, values|
      values.each do |value|
        puts "Edge: #{key}#{value}"
      end
    end
  end

  def dfs
    visited = Hash.new
    @nodes.each do |node|
      visited.merge!({"#{node}"=> false})
    end
    dfs_until(@nodes.first, visited)
  end

  def dfs_until(node, visited)
    visited[node] = true
    puts "Visited #{node}"
    neighbours = @edges[node]
    neighbours.each do |neighbour|
      dfs_until(neighbour, visited) if visited[neighbour] == false
    end
  end

  def bfs
    visited = Hash.new
    queue = [@nodes.first]
    @nodes.each do |node|
      visited.merge!({"#{node}"=> false})
    end
    bfs_until(queue.first, visited, queue)
  end

  def bfs_until(node, visited, queue)
    visited[node] = true if visited[node] == false
    queue.shift if queue[0] == node
    puts "Visited to BFS: #{node}"
    childrens = @edges[node]
    childrens.each do |children_node|
      if visited[children_node] == false
        visited[children_node] = true
        queue.push(children_node) unless queue.include?(node)
      end
    end
    bfs_until(queue[0], visited, queue) if !queue.empty?  
  end

end
nodes = %w{A B C D E F G}
graph = Graph.new(nodes)
graph.add_edge(["A","B"])
graph.add_edge(["A","E"])
graph.add_edge(["A","F"])
graph.add_edge(["B","C"])
graph.add_edge(["C","D"])
graph.add_edge(["F","G"])
graph.print_graph
graph.uniq_edges
puts "Output of DFS"
graph.dfs
puts "Output of BFS"
graph.bfs