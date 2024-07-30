class TimeMap
  def initialize
    @store = Hash.new { |h, k| h[k] = {} }
  end

  def set(key, value, timestamp)
    @store[key][timestamp] = value
  end

  def get(key, timestamp)
    @store[key][timestamp].present? ? @store[key][timestamp] : ""
  end
end
