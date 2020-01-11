require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/encryptor'

class EncryptorTest < Minitest::Test 

  def test_it_exists
    encryptor = Encryptor.new('message', '01392', '100120')
    assert_instance_of Encryptor, encryptor 
  end

end
