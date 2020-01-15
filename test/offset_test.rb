require_relative '../test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require_relative '../lib/offset'

class OffsetTest < Minitest::Test 

  def test_it_exists 
    offset = Offset.new('02715')
    assert_instance_of Offset, offset

    offset = Offset.new
    assert_instance_of Offset, offset
  end 

  def test_it_has_attributes
    offset1 = Offset.new('040895')
    assert_equal '040895', offset1.date

    offset2 = Offset.new
    offset2.stubs(:date).returns('150120')
    assert_equal '150120', offset2.date
  end

  def test_it_can_return_the_square_date
    offset = Offset.new('040895')
    assert_equal 1672401025, offset.square_date
  end

  def test_it_can_return_the_offset_values
    offset1 = Offset.new('040895') 
    assert_equal [1, 0, 2, 5] , offset1.make_offsets
    offset2 = Offset.new
    offset2.stubs(:date).returns('140120')
    assert_equal [4, 4, 0, 0] , offset2.make_offsets
  end

end