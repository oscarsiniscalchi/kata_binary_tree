class BinaryTree
  attr_accessor :root

  def add(value)
    if self.root.nil?
      self.root = TreeNode.new(value)
    else
      self.root.add(value)
    end
  end

  def find(value)
    return nil if root.nil?
    if root.value < value
      return root.right.find(value)
    elsif root.value > value
      return root.left.find(value)
    elsif root.value == value
      return root
    end
  end
end

class TreeNode
  attr_accessor :right, :left, :value

  def initialize(val)
    self.value = val
  end

  def add(val)
    if val > self.value
      if !self.right.nil?
        self.right.add(val)
      else
        self.right = TreeNode.new(val)
      end
    else
      if !self.left.nil?
        self.left.add(val)
      else
        self.left = TreeNode.new(val)
      end
    end
  end

  def find(val)
    return self if val == value

    if val > self.value
      if !self.right.nil?
        self.right.find(val)
      else
        return self.right
      end
    else
      if !self.left.nil?
        self.left.find(val)
      else
        return self.left
      end
    end
  end
end
