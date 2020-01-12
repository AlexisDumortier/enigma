require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/crack'

class CrackTest < Minitest::Test 

  def test_it_exists
    crack = Crack.new('vjqtbeaweqihssi', '291018')
    assert_instance_of Crack, crack 
  end

end
