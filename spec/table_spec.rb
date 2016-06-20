require_relative 'spec_helper'

describe Table do
  before do
    @table = Table.new
  end

  it 'should have a valid? method' do
    @table.must_respond_to :valid?
  end

  it 'should valid the robot\'s position with x, y params' do
    @table.valid?(0, 0).must_equal true
    @table.valid?(1, 2).must_equal true
    @table.valid?(4, 4).must_equal true

    @table.valid?(-1, 1).must_equal false
    @table.valid?(1, -1).must_equal false
    @table.valid?(-1, -1).must_equal false
    @table.valid?(1, 5).must_equal false
    @table.valid?(5, 1).must_equal false
    @table.valid?(5, 5).must_equal false
    @table.valid?(6, 1).must_equal false
  end
end
