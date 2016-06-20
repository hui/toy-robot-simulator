require_relative '../spec_helper'

describe Robot do
  before :each do
    @robot = Robot.new(Table.new)
  end

  it 'should raise error without a table when initializing' do
    proc { Robot.new }.must_raise ArgumentError
  end

  it 'should be controllable by Simulator' do
    @robot.must_respond_to :place
    @robot.must_respond_to :move
    @robot.must_respond_to :turn
    @robot.must_respond_to :report
  end

  it 'should be placed correctly with right positions' do
    @robot.place(0, 1, 'NORTH')
    @robot.x.must_equal 0
    @robot.y.must_equal 1
    @robot.facing.must_equal 'NORTH'

    @robot.place(4, 1, 'SOUTH')
    @robot.x.must_equal 4
    @robot.y.must_equal 1
    @robot.facing.must_equal 'SOUTH'

    @robot.place(3, 2, 'WEST')
    @robot.x.must_equal 3
    @robot.y.must_equal 2
    @robot.facing.must_equal 'WEST'

    @robot.place(1, 0, 'EAST')
    @robot.x.must_equal 1
    @robot.y.must_equal 0
    @robot.facing.must_equal 'EAST'
  end

  it 'should not be placed correctly with wrong positions' do
    @robot.place(10, 1, 'NORTH')
    @robot.x.must_be_nil
    @robot.y.must_be_nil
    @robot.facing.must_be_nil

    @robot.place(1, -1, 'NORTH')
    @robot.x.must_be_nil
    @robot.y.must_be_nil
    @robot.facing.must_be_nil

    @robot.place(1, 1, 'TOP')
    @robot.x.must_be_nil
    @robot.y.must_be_nil
    @robot.facing.must_be_nil
  end

  it 'should move with correct direction' do
    @robot.place(0, 0, 'NORTH')
    @robot.move
    @robot.x.must_equal 0
    @robot.y.must_equal 1
    @robot.facing.must_equal 'NORTH'

    @robot.place(2, 2, 'SOUTH')
    @robot.move
    @robot.x.must_equal 2
    @robot.y.must_equal 1
    @robot.facing.must_equal 'SOUTH'

    @robot.place(2, 2, 'WEST')
    @robot.move
    @robot.x.must_equal 1
    @robot.y.must_equal 2
    @robot.facing.must_equal 'WEST'

    @robot.place(2, 2, 'EAST')
    @robot.move
    @robot.x.must_equal 3
    @robot.y.must_equal 2
    @robot.facing.must_equal 'EAST'
  end

  it 'should stand still with invalid direction' do
    @robot.place(0, 0, 'SOUTH')
    @robot.move
    @robot.x.must_equal 0
    @robot.y.must_equal 0
    @robot.facing.must_equal 'SOUTH'

    @robot.place(4, 0, 'EAST')
    @robot.move
    @robot.x.must_equal 4
    @robot.y.must_equal 0
    @robot.facing.must_equal 'EAST'
  end

  it 'should ignore move when not on the table' do
    @robot.move
    @robot.x.must_be_nil
    @robot.y.must_be_nil
    @robot.facing.must_be_nil
  end

  it 'should turn to the right facing' do
    @robot.place(0, 0, 'NORTH')
    @robot.turn 'LEFT'
    @robot.facing.must_equal 'WEST'
    @robot.turn 'LEFT'
    @robot.facing.must_equal 'SOUTH'
    @robot.turn 'LEFT'
    @robot.facing.must_equal 'EAST'
    @robot.turn 'LEFT'
    @robot.facing.must_equal 'NORTH'
    @robot.turn 'RIGHT'
    @robot.facing.must_equal 'EAST'
    @robot.turn 'RIGHT'
    @robot.facing.must_equal 'SOUTH'
    @robot.turn 'RIGHT'
    @robot.facing.must_equal 'WEST'
    @robot.turn 'RIGHT'
    @robot.facing.must_equal 'NORTH'
  end

  it 'should ignore turn command when not on the table' do
    @robot.turn 'LEFT'
    @robot.facing.must_be_nil
    @robot.turn 'RIGHT'
    @robot.facing.must_be_nil
  end

  it 'should ignore wrong direction to turn' do
    @robot.place(0, 0, 'NORTH')
    @robot.turn 'BACK'
    @robot.facing.must_equal 'NORTH'
  end

  it 'should report correct position' do
    @robot.place(0, 0, 'NORTH')
    @robot.report.must_equal '0,0,NORTH'

    @robot.place(2, 2, 'EAST')
    @robot.move
    @robot.report.must_equal '3,2,EAST'

    @robot.place(4, 0, 'EAST')
    @robot.move
    @robot.report.must_equal '4,0,EAST'
  end

  it 'should ignore report command when not on the table' do
    @robot.report.must_be_nil
  end
end
