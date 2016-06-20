require_relative '../spec_helper'

describe Simulator do
  it 'should have a "run" method accept commands in text format' do
    Simulator.must_respond_to :run
    proc { Simulator.run }.must_raise ArgumentError
    proc { Simulator.run 'PLACE 0,0,NORTH' }.must_be_silent
  end

  it 'should run and give correct output' do
    proc {
      Simulator.run <<~COMMANDS
        PLACE 0,0,NORTH
        MOVE
        REPORT
      COMMANDS
    }.must_output "0,1,NORTH\n"

    proc {
      Simulator.run <<~COMMANDS
        PLACE 0,0,NORTH
        LEFT
        REPORT
      COMMANDS
    }.must_output "0,0,WEST\n"

    proc {
      Simulator.run <<~COMMANDS
        PLACE 1,2,EAST
        MOVE
        MOVE
        LEFT
        MOVE
        REPORT
      COMMANDS
    }.must_output "3,3,NORTH\n"


    proc {
      Simulator.run <<~COMMANDS
        PLACE 1,2,EAST
        MOVE
        MOVE
        LEFT
        MOVE
        PLACE 0,0,NORTH
        LEFT
        REPORT
      COMMANDS
    }.must_output "0,0,WEST\n"

    proc {
      Simulator.run <<~COMMANDS
        PLACE 1,2,EAST
        MOVE
        MOVE
        MOVE
        MOVE
        MOVE
        MOVE
        REPORT
      COMMANDS
    }.must_output "4,2,EAST\n"

    proc {
      Simulator.run <<~COMMANDS
        BLAH BLAH
        PLACE -1,2,TOP
        MOVE
        REPORT
      COMMANDS
    }.must_output "\n"

    proc {
      Simulator.run <<~COMMANDS
        BLAH BLAH
        PLACE 0,0,NORTH
        LEFT
        REPORT
      COMMANDS
    }.must_output "0,0,WEST\n"

    proc {
      Simulator.run <<~COMMANDS
        BLAH BLAH
        PLACE NORTH
        LEFT
        REPORT
      COMMANDS
    }.must_output "\n"
  end
end
