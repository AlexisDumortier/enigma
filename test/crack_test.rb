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

  def test_it_can_find_the_key_used_to_encrypt_a_message
    crack = Crack.new('vjqtbeaweqihssi', '291018')
    assert_equal '08304', crack.find_key_from_date
  end

  def test_it_can_crack_the_message_with_a_date
    crack = Crack.new('vjqtbeaweqihssi', '291018')
    expected = { decryption: 'hello world end', date: '291018', key: '08304' }
    assert_equal expected, crack.crack 
  end

end
