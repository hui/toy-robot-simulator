class Robot
  attr_reader :x, :y, :facing

  # Store deltas for X and Y to move on different directions
  MOVE_DELTAS = { EAST: { x: 1, y: 0 }, SOUTH: { x: 0, y: -1 }, WEST: { x: -1, y: 0 }, NORTH: { x: 0, y: 1 } }.freeze

  # A array of directions to valid commands and caculate next facing direction
  DIRECTIONS = %w(EAST SOUTH WEST NORTH).freeze

  # A table will pass the robot to test if the next position is valid.
  def initialize(table)
    @table = table
    @x = @y = @facing = nil
  end

  def place(x, y, facing)
    return unless DIRECTIONS.include? facing
    return unless @table.valid?(x, y)

    @x = x
    @y = y
    @facing = facing
  end

  # Ignore command when not placed on the table.
  # Caculate next position and validate with the table.
  # Only make the movement when next position is valid.
  def move
    return unless placed?

    next_x = MOVE_DELTAS[@facing.to_sym][:x] + x
    next_y = MOVE_DELTAS[@facing.to_sym][:y] + y
    return unless @table.valid?(next_x, next_y)

    @x = next_x
    @y = next_y
  end

  # Ignore command when not placed on the table.
  # Caculate next facing with directions array.
  def turn(direction)
    return unless placed?

    current = DIRECTIONS.index(@facing)
    case direction
    when 'LEFT'
      @facing = DIRECTIONS[(current + 3) % 4]
    when 'RIGHT'
      @facing = DIRECTIONS[(current + 1) % 4]
    end
  end

  # Ignore command when not placed on the table.
  def report
    return unless placed?
    [@x, @y, @facing].join(',')
  end

  private

  # The robot should have valid X, Y and facing when placed.
  def placed?
    @x && @y && @facing
  end
end
