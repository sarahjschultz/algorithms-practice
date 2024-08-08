class TimeMap
  attr_accessor :store

  def initialize
    @store = Hash.new { |h, k| h[k] = [] }
  end

  def set(key, value, timestamp)
    store[key] << [value, timestamp]
  end

  def get(key, timestamp)
    # If the key does not exist in our data store, return empty string
    result = ""

    time_value_pairs = store[key]

    low  = 0
    high = time_value_pairs.length - 1

    while low <= high
      mid = (low + high) / 2

      val  = time_value_pairs[mid].first
      time = time_value_pairs[mid].last

      if time == timestamp
        return val
      elsif time > timestamp
        high = mid - 1
      else
        result = val
        low    = mid + 1
      end
    end

    result
  end
end

# Questions to ask:
# 1. In the getter, what should we return if we find nothing?
# 2. In the getter, would it be valuable to return the closest (but not future) value we have stored relative to the timestamp?
# 3. Do we need any kind of eviction policy?
# 4. Are all inserts presumed to be current -- meaning, will the times naturally sort themselves?
