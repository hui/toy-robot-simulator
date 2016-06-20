require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs.push 'spec'
  t.pattern = 'spec/**/*_spec.rb'
  t.warning = true
  t.verbose = true
end

task default: :test

require_relative 'lib/simulator'
task :run do
  if ENV['CMD_FILE'].nil?
    puts 'Usage: rake run CMD_FILE=samples/a.txt'
  else
    Simulator.run(open(ENV['CMD_FILE']).read)
  end
end
