require_relative '../test_helper'
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

  def test_it_can_generate_its_own_serie_of_digits
    key = mock('key')
    key.stubs(:digits).returns('02132')
    assert_equal '02132', key.digits
  end

  def test_it_can_return_the_keys_produced_from_the_digits
    key1 = Key.new('03210')
    assert_equal [3, 32, 21, 10], key1.make_keys
    key2 = mock('key')
    key2.stubs(:digits).returns('02132')
    key2.stubs(:make_keys).returns([2, 21, 13, 32])
    assert_equal [2, 21, 13, 32], key2.make_keys
  end

end