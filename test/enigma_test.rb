require_relative '../test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/enigma'

class EnigmaTest < Minitest::Test 

  def test_it_exists 
    enigma = Enigma.new
    assert_instance_of Enigma, enigma
  end
  
  def test_it_can_encrypt_a_message
    enigma = Enigma.new
    expected = { encryption: 'keder ohulw', key: '02715', date: '040895' }
    assert_equal expected, enigma.encrypt('hello world', '02715', '040895')

    expected = { encryption: 'nib udmcxpu', key: '02715', date: Time.now.strftime('%d%m%y') }
    assert_equal expected, enigma.encrypt('hello world', '02715')
  end

  def test_it_can_decrypt_a_message
    enigma = Enigma.new
    expected = { decryption: 'hello world!!' , key: '02715', date: '040895'}
    assert_equal expected, enigma.decrypt("keder ohulw!!", '02715', '040895')

    expected = { decryption: 'hello world' , key: '02715', date: Time.now.strftime('%d%m%y')}
    assert_equal expected, enigma.decrypt('nib udmcxpu', '02715')
  end

  def test_it_can_crack_a_message
    enigma = Enigma.new
    expected = { decryption: 'hello world end', date: '291018', key: '08304' }
    assert_equal expected, enigma.crack('vjqtbeaweqihssi', '291018')
  end

end