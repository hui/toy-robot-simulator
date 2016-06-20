require_relative 'robot'
require_relative 'table'

class Simulator
  # Parse the commands in text format and report to the standard output.
  def self.run(commands)
    robot = Robot.new(Table.new)

    # Parse commands line by line, ignore unrecognized commands.
    commands.split("\n").each do |command|
      case command
      when /^PLACE/
        params = command.split(' ').last.split(',')
        robot.place(params[0].to_i, params[1].to_i, params[2])
      when 'MOVE'
        robot.move
      when 'LEFT', 'RIGHT'
        robot.turn(command)
      when 'REPORT'
        puts robot.report
      end
    end
  end
end
