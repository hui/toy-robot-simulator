class Table
  attr_reader :width, :height

  def initialize(width = 5, height = 5)
    @width = width
    @height = height
  end

  def valid?(x, y)
    x >= 0 && y >= 0 && x < width && y < height
  end
end
