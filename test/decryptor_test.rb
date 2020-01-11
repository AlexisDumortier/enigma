require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/decryptor'

class DecryptorTest < Minitest::Test 

  def test_it_exists 
    decryptor = Decryptor.new('message', '01392', '100120')
    assert_instance_of  Decryptor, decryptor
  end 
  

end
