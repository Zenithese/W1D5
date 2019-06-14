require 'byebug'

class PolyTreeNode

  def initialize(value)
    @parent = nil
    @children = []
    @value = value
  end

  def parent
    @parent
  end

  def children
    @children
  end

  def value
    @value
  end

  def parent=(node)
    @parent.children.delete(self) unless @parent.nil?
    @parent = node
    unless node.nil? || node.children.include?(self)
      node.children << self
    end
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    raise "Idiot! Node not child" unless self.children.include?(child_node)
    child_node.parent = nil
  end

  def dfs(target_value)
    return self if self.value == target_value
    self.children.each do |child|
      found = child.dfs(target_value)
      return found unless found.nil?
    end
    nil
  end

  def inspect
    { 'value' => @value, 'parent_value' => @parent.value }.inspect
  end

  def bfs(target_value)
    queue = []
    queue << self
    debugger
    queue.each do |node|
    #until queue.empty?
      shifted = queue.shift
      return shifted if shifted.value == target_value
      node.children.each do |child|
        queue << child
      end 
    end
    nil
  end

end