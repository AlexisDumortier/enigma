require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/crack'

class CrackTest < Minitest::Test 

  def test_it_exists
    crack = Crack.new('vjqtbeaweqihssi', '291018')
    assert_instance_of Crack, crack 
  end

  def test_it_can_make_a_key_string_from_a_number
    crack = Crack.new('vjqtbeaweqihssi', '291018')
    assert_equal '00231', crack.make_key_string(231)
  end

end
