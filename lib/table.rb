class Table
  attr_reader :width, :height

  # Set up a 5x5 square table by default
  def initialize(width = 5, height = 5)
    @width = width
    @height = height
  end

  # Position should be on the table top and not falling down.
  def valid?(x, y)
    x >= 0 && y >= 0 && x < width && y < height
  end
end
