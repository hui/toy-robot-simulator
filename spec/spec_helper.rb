require 'simplecov'
SimpleCov.start do
  command_name 'MiniTest'
  add_filter '/spec/'
end

require 'minitest/autorun'
require_relative '../lib/simulator'
require_relative '../lib/robot'
require_relative '../lib/table'
