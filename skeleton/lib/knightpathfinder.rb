require_relative '00_tree_node.rb'
require 'byebug'

class KnightPathFinder

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
    valid_moves << [row - 1, col - 2] if (row - 1 >= 0 && col - 2 >= 0) && (row - 1 <= 7 && col - 2 <= 7)
    valid_moves << [row - 2, col - 1] if (row - 2 >= 0 && col - 1 >= 0) && (row - 2 <= 7 && col - 1 <= 7)
    valid_moves << [row - 2, col + 1] if (row - 2 >= 0 && col + 1 >= 0) && (row - 2 <= 7 && col + 1 <= 7)
    valid_moves << [row - 1, col + 2] if (row - 1 >= 0 && col + 2 >= 0) && (row - 1 <= 7 && col + 2 <= 7)
    valid_moves << [row + 1, col - 2] if (row + 1 >= 0 && col - 2 >= 0) && (row + 1 <= 7 && col - 2 <= 7)
    valid_moves << [row + 2, col - 1] if (row + 2 >= 0 && col - 1 >= 0) && (row + 2 <= 7 && col - 1 <= 7)
    valid_moves << [row + 2, col + 1] if (row + 2 >= 0 && col + 1 >= 0) && (row + 2 <= 7 && col + 1 <= 7)
    valid_moves << [row + 1, col + 2] if (row + 1 >= 0 && col + 2 >= 0) && (row + 1 <= 7 && col + 2 <= 7)
    valid_moves
  end

  def new_move_positions(pos)
    moves = KnightPathFinder.valid_moves(pos) 
    new_moves = moves.select { |move| !@considered_positions.include?(move) }
    @considered_positions += new_moves
    new_moves
  end

end

kpf = KnightPathFinder.new([4, 3])
p kpf.new_move_positions([7,4])