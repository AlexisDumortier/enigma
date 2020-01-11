require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require_relative '../lib/key'


class KeyTest < Minitest::Test 

  def test_it_exists
    key = Key.new('03210')
    assert_instance_of Key, key
  end 

  def test_it_can_be_initialized_with_a_serie_of_digits
    key = Key.new('03210')
    assert_equal '03210', key.digits
  end

end