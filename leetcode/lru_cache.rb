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
