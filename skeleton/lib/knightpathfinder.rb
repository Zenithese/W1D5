require_relative '00_tree_node.rb'
require 'byebug'

class KnightPathFinder

  MOVES = [
    [-1, -2], 
    [-2, -1], 
    [-2, +1], 
    [-1, +2], 
    [+1, -2], 
    [+2, -1], 
    [+2, +1], 
    [+1, +2]
  ]

  def initialize(pos)
    @root_node = PolyTreeNode.new(pos)
    @considered_positions = [pos]
    self.build_move_tree(@root_node)
  end

  def build_move_tree(start_pos)
    queue = []
    queue << start_pos
    until queue.empty?
      node = queue.shift
      new_moves = new_move_positions(node.value)
      new_nodes = new_moves.map {|move| PolyTreeNode.new(move)}
      new_nodes.each do |new_node|
        node.add_child(new_node)
        queue << new_node
      end
    end 
  end

  def self.valid_moves(pos)
    valid_moves = []
    row, col = pos
    MOVES.each do |dx, dy|
      valid_moves << [row + dx, col + dy] if (0..7).include?(row + dx) && (0..7).include?(col + dy)
    end
    valid_moves
  end

  def new_move_positions(pos)
    moves = KnightPathFinder.valid_moves(pos) 
    new_moves = moves.reject { |move| @considered_positions.include?(move) }
    @considered_positions += new_moves
    new_moves
  end

  def find_path(end_pos)
    dfs
  end

  def trace_path_back(node)
  end

end

kpf = KnightPathFinder.new([0, 0])
p kpf.new_move_positions([7,7])