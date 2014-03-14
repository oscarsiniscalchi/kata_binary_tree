require './tree.rb'

describe BinaryTree do
  it 'should be able to instantiate' do
    BinaryTree.new.class.should eq BinaryTree
  end

  describe 'add' do
    before :each do
      @bt = BinaryTree.new
    end

    it 'should add the root element when calling add for the first time' do
      @bt.add('F')
      @bt.root.value.should eq('F')
    end

    it 'should add the right node for root element when calling add with a bigger value' do
      @bt.add('F')
      @bt.add('G')
      @bt.root.right.value.should eq('G')
    end

    it 'should add the left node for root element when calling add with a smaller value' do
      @bt.add('F')
      @bt.add('A')
      @bt.root.left.value.should eq('A')
    end

    it 'should add the subnodes correctly' do
      @bt.add('F')
      @bt.add('A')
      @bt.add('G')

      @bt.add('Z')
      @bt.add('B')

      @bt.root.right.right.value.should eq('Z')
      @bt.root.left.right.value.should eq('B')
    end
  end

  describe 'find' do
    before :each do
      @bt = BinaryTree.new
    end

    it 'should return nil if tree empty' do
      @bt.find('A').should be_nil
    end

    it 'should return the root when searching the root' do
      @bt.add('F')

      @bt.find('F').should be_a(TreeNode)
      @bt.find('F').value.should eq('F')
    end

    it 'should return nil if element is not in the tree' do
      @bt.add('F')
      @bt.add('A')
      @bt.add('G')
      @bt.add('Z')
      @bt.add('B')

      @bt.find('X').should be_nil
    end

    it 'should return the right node if element is in the tree' do
      @bt.add('F')
      @bt.add('A')
      @bt.add('G')
      @bt.add('Z')
      @bt.add('B')

      @bt.find('A').should be_a(TreeNode)
      @bt.find('A').value.should eq('A')

      @bt.find('Z').should be_a(TreeNode)
      @bt.find('Z').value.should eq('Z')
    end
  end
end
