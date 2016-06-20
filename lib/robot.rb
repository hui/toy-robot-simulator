class Robot
  attr_reader :x, :y, :facing

  MOVE_DELTAS = { EAST: { x: 1, y: 0 }, SOUTH: { x: 0, y: -1 }, WEST: { x: -1, y: 0 }, NORTH: { x: 0, y: 1 } }.freeze
  DIRECTIONS = %w(EAST SOUTH WEST NORTH).freeze

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

  def move
    return unless placed?

    next_x = MOVE_DELTAS[@facing.to_sym][:x] + x
    next_y = MOVE_DELTAS[@facing.to_sym][:y] + y
    return unless @table.valid?(next_x, next_y)

    @x = next_x
    @y = next_y
  end

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

  def report
    return unless placed?
    [@x, @y, @facing].join(',')
  end

  private

  def placed?
    @x && @y && @facing
  end
end
