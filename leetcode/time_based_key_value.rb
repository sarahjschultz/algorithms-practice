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
