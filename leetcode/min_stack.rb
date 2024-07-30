class Minstack
  attr_reader :stack

  def initialize()
    @stack = []
  end

  def push(val)
    @stack << val
  end

  def pop()
    @stack.pop
  end

  def top()
    @stack.last
  end

  def get_min()
    @stack.min
  end

end
