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

end
