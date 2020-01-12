require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/cryptor'

class CryptorTest < Minitest::Test 

  def test_it_exists
    cryptor = Cryptor.new('message', '01392', '100120')
    assert_instance_of Cryptor, cryptor 
  end

  def test_it_has_attributes
    cryptor = Cryptor.new('message', '01392', '100120')
    assert_equal 'message', cryptor.message 
    assert_equal '01392', cryptor.key 
    assert_equal '100120', cryptor.date 
  end

  def test_it_can_return_an_array_of_alphabet_positions_for_a_message
    cryptor = Cryptor.new('message!!!', '01392', '100120')
    assert_equal [12, 4, 18, 18, 0, 6, 4, nil, nil, nil], cryptor.message_in_alphabet_positions
  end

end
