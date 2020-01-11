require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
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
    expected = [key.make_keys, offset.make_offsets].transpose.map{|a| a.sum} 
    assert_equal expected, encryptor.encrypt_shift
  end

  def test_it_can_return_an_array_of_alphabet_positions_for_a_message
    encryptor = Encryptor.new('message!!!', '01392', '100120')
    assert_equal [12, 4, 18, 18, 0, 6, 4, nil, nil, nil], encryptor.message_in_alphabet_positions
  end


  def test_it_can_return_an_array_of_shifts_for_a_message
    encryptor = Encryptor.new('message!!!', '01392', '100120')
    assert_equal [5, 17, 39, 92, 5, 17, 39, 0, 0, 0], encryptor.message_shifts
  end

  def test_it_can_return_an_array_of_shifted_alphabet_positions
    encryptor = Encryptor.new('message!!!', '01392', '100120')
    assert_equal [17, 21, 3, 2, 5, 23, 16, nil, nil, nil], encryptor.shifted_alphabet_positions
  end

  def test_it_can_encrypt_a_given_message

    encryptor1 = Encryptor.new('hello world!!', '02715', '040895')
    expected1 = {encryption: 'keder ohulw!!', key: encryptor1.encrypt_key.digits, date: encryptor1.encrypt_offset.date }
    assert_equal expected1, encryptor1.encrypt

    # encryptor2 = Encryptor.new('hello world!!')
    # key = mock('key')
    # key.stubs(:digits).returns('28563')
    # offset = mock('offset')
    # offset.stubs(:date).returns('110120')
    # encryptor2.stubs(:encrypt_key).returns(key)
    # encryptor2.stubs(:encrypt_shift).returns([32, 89, 56, 63])
    # encryptor2.stubs(:encrypt_offset).returns(offset)
    # expected2 = {encryption: 'mmnuthyxwtf!!', key: encryptor2.encrypt_key.digits, date: encryptor2.encrypt_offset.date }
    # assert_equal expected2, encryptor2.encrypt
  end

end
