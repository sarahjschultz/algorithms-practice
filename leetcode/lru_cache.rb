# Ruby tricks version
class LRUCache
  def initialize(capacity)
    @capacity = capacity
    @entries  = {}
  end

  def get(key)
    val = remove(key)
    if val
      insert(key, val)
    else
      -1
    end
  end

  def remove(key)
    @entries.delete key
  end

  def insert(key, val)
    @entries[key] = val
  end

  def put(key, value)
    remove(key)
    insert(key, value)
    # Evict the LRU entry if we exceeded capacity from this put action
    # We know @entries.first.first is LRU because of Ruby Hash conventions
    # Hash keys are guaranteed to be stored in order of insert
    # Because reads and writes all touch the entry (updating the key insert order)
    # We can safely terminate the first entry as oldest
    remove(@entries.first.first) if @entries.size > @capacity
  end
end

# Your LRUCache object will be instantiated and called as such:
# obj = LRUCache.new(capacity)
# param_1 = obj.get(key)
# obj.put(key, value)
#

# Linked List Version
class Node
  attr_accessor :prev, :next

  def initialize(key, val)
    @key  = key
    @val  = val
    @prev = nil
    @next = nil
  end
end

class LRUCache
  def initialize(capacity)
    @capacity = capacity
    # Keys will actually point to node objects containing the key and value
    @cache = {}

    # Left maps to least recent
    # Right maps to most recent
    @left  = Node.new(0, 0)
    @right = Node.new(0, 0)
  end

  def get(key)
    list_node = @cache[key]
    if list_node
      # Since we are accessing this record, we need to touch it updating its position in our list
      # Beginning with removing it from its position
      remove(list_node)
      # And then adding it back in at the end as most recently access
      insert(list_node)
      # Then we return the value of the node
      return list_node.val
    end

    -1
  end

  def insert(node)
    # When we insert, we need to update our right pointer
    # We need to add to the cache
    # AND we need to check capacity
    # If capacity is exceeded, we need to evict the least recently used element
    prev = @right.prev
    nxt  = @right

    prev.next = node
    nxt.prev  = node
    node.prev = prev
    node.next = nxt

    @cache[node.key] = node
  end

  def remove(node)
    # First we need to update the prev and next nodes in our list
    # Such that they point to each other
    # Then we can delet this node from our hash
    prev      = node.prev
    nxt       = node.next
    prev.next = nxt
    nxt.prev  = prev

    @cache.delete node.key
  end

  def put(key, value)
    # If the key exists, update the record value and its position in our DLL
    # Else, add it to the DLL and cache
    list_node = @cache[key]
    new_node  = Node.new(key, value)
    if list_node
      remove(list_node)
    end
    insert(new_node)

    # Evict if exceed capacity
    if @cache.length > @capacity
      lru = @left.next
      remove(lru)
      @cache.delete lru.key
    end
  end
end
