require 'minitest/autorun'
require 'minitest/pride'
require 'date'
require_relative '../lib/valid_input'

class ValidInputTest < Minitest::Test 

  def test_it_exists 
    valid_input = ValidInput.new('dummy.txt', 'output.txt', '130120', '19239')
    assert_instance_of ValidInput, valid_input
  end 

  def test_it_can_check_that_a_file_name_is_valid_and_read_it_if_it_is
    valid_input1 = ValidInput.new('dummy.txt', 'output.txt', '130120', '19239')
    assert_equal 'dummy text in the dummy file', valid_input1.check_valid_file 
    
    valid_input2 = ValidInput.new('dum.txt', 'output.txt', '130120', '19239')
    assert_equal 0, valid_input2.check_valid_file
  end

  def test_it_can_returns_the_date_if_it_is_valid
    valid_input1 = ValidInput.new('dummy.txt', 'output.txt', '130120', '19239')
    assert_equal '130120', valid_input1.check_valid_date

    valid_input2 = ValidInput.new('dummy.txt', 'output.txt', '131720', '19239')
    assert_equal 0, valid_input2.check_valid_date
  end

  def test_it_can_return_the_key_it_is_valid
    valid_input1 = ValidInput.new('dummy.txt', 'output.txt', '130120', '19239')
    assert_equal '19239', valid_input1.check_valid_key
    valid_input2 = ValidInput.new('dummy.txt', 'output.txt', '130120', 'sdfsdf')
    assert_equal 0, valid_input2.check_valid_key
  end

  def test_it_can_return_a_valid_file_name_as_input
    valid_input1 = ValidInput.new('dummy.txt', 'output.txt', '130120', '19239')
    assert_equal 'output.txt', valid_input1.check_valid_output_file_name
    valid_input2 = ValidInput.new('dummy.txt', 'output', '130120', '19239')
    assert_equal 0, valid_input2.check_valid_output_file_name
  end

end