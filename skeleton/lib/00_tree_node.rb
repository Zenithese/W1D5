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

  # def parent=(node)
  #   self.parent = node
  #   node.children << self
  # end

end