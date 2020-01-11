require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/key'

class KeyTest < Minitest::Test 

  def test_it_exists
    key = Key.new('03210')
    assert_instance_of Key, key
  end 
  
end