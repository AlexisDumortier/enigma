require_relative '../test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/decryptor'

class DecryptorTest < Minitest::Test 

  def test_it_exists 
    decryptor = Decryptor.new('message', '01392', '100120')
    assert_instance_of  Decryptor, decryptor
  end 

  def test_it_has_attributes 
    decryptor = Decryptor.new('message', '01392', '100120')
    assert_instance_of Key, decryptor.decrypt_key
    assert_instance_of Offset, decryptor.decrypt_offset
  end

  def test_it_can_return_an_array_of_alphabet_positions_for_a_message
    decryptor = Decryptor.new('keder ohulw!!', '01392', '100120')
    assert_equal [10, 4, 3, 4, 17, 26, 14, 7, 20, 11, 22, nil, nil], decryptor.message_in_alphabet_positions
  end
  
  def test_it_can_return_an_array_of_unshifted_alphabet_positions
    decryptor = Decryptor.new('keder ohulw!!', '01392', '100120')
    assert_equal [5, 14, 18, 20, 12, 9, 2, 23, 15, 21, 10, nil, nil], decryptor.unshifted_alphabet_positions
  end

  def test_it_can_decrypt_a_given_message
    decryptor = Decryptor.new("keder ohulw!!", '02715', '040895')
    expected = { decryption: 'hello world!!' , key: '02715', date: '040895'}
    assert_equal expected, decryptor.decrypt
  end
  
end
