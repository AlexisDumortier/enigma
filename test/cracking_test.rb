require_relative '../test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require_relative '../lib/cracking'
require_relative '../lib/encryptor'

class CrackingTest < Minitest::Test 

  def test_it_exists
    crack = Cracking.new('vjqtbeaweqihssi', '291018')
    assert_instance_of Cracking, crack 
  end

  def test_it_has_attributes
    crack = Cracking.new('vjqtbeaweqihssi', '291018')
    assert_equal 'vjqtbeaweqihssi', crack.message
    assert_equal '291018', crack.date
  end

  def test_it_can_make_a_key_string_from_a_number
    crack = Cracking.new('vjqtbeaweqihssi', '291018')
    assert_equal '00231', crack.make_key_string(231)
  end

  def test_it_can_find_the_key_used_to_encrypt_a_message
    crack = Cracking.new('vjqtbeaweqihssi', '291018')
    assert_equal '08304', crack.find_key_from_date
  end

  def test_it_can_crack_the_message_with_a_date
    crack = Cracking.new('vjqtbeaweqihssi', '291018')
    expected = { decryption: 'hello world end', date: '291018', key: '08304' }
    assert_equal expected, crack.crack

    encryptor = Encryptor.new('message is that it is hard to decrypt end', '08304')
    output = encryptor.encrypt 
    crack = Cracking.new(output[:encryption])
    crack.stubs(:find_key_from_date).returns('08304')
    expected = { 
                decryption: 'message is that it is hard to decrypt end', 
                date: Time.now.strftime('%d%m%y'), 
                key: output[:key] 
                }
    assert_equal expected, crack.crack 
  end

end
