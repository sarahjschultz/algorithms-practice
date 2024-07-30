class TrieNode
  attr_accessor :children, :end_of_word, :current

  def initialize()
    @children    = {}
    @end_of_word = false
  end
end

class Trie
  def initialize()
    @root = TrieNode.new
  end

  def insert(word)
    initialize_current_node
    word.each_char do |c|
      @current.children[c] = TrieNode.new unless included_as_child?(c)

      set_current_to_child(c)
    end
    @current.end_of_word = true
  end

  def search(word)
    initialize_current_node

    word.each_char do |c|
      return false unless included_as_child?(c)

      set_current_to_child(c)
    end

    @current.end_of_word
  end

  def starts_with(prefix)
    initialize_current_node

    prefix.each_char do |c|
      return false unless included_as_child?(c)

      set_current_to_child(c)
    end

    true
  end

  private

  def included_as_child?(char)
    @current.children.include?(char)
  end

  def set_current_to_child(child)
    @current = @current.children[child]
  end

  def initialize_current_node
    @current = @root
  end

end
