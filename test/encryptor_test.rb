require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/encryptor'

class EncryptorTest < Minitest::Test 

  def test_it_exists
    encryptor = Encryptor.new('message', '01392', '100120')
    assert_instance_of Encryptor, encryptor 
  end

  def test_it_has_attributes
    encryptor = Encryptor.new('message', '01392', '100120')
    key = Key.new('01392')
    offset = Offset.new('100120')
    assert_equal 'message', encryptor.message 
    assert_equal '01392', encryptor.key 
    assert_equal '100120', encryptor.date 
    assert_equal key.digits, encryptor.encrypt_key.digits
    assert_equal offset.date, encryptor.encrypt_offset.date
  end

end
