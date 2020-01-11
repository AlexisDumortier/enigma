require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/cryptor'

class CryptorTest < Minitest::Test 

  def test_it_exists
    cryptor = Cryptor.new("message", "01392", "100120")
    assert_instance_of Cryptor, cryptor 
  end

end
