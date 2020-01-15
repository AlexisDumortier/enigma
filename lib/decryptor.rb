require_relative './cryptor'
require_relative './key'
require_relative './offset'

class Decryptor < Cryptor

  attr_reader :decrypt_key, :decrypt_offset, :decrypt_shift

  def initialize(message, key, date = '')
    super(message)
    @decrypt_key = Key.new(key)
    @decrypt_offset = Offset.new(date)
    @shift = [@decrypt_key.make_keys, @decrypt_offset.make_offsets].transpose.map{|a| a.sum} 
  end

  def unshifted_alphabet_positions
    result = []
    message_in_alphabet_positions.each_with_index do |position, index|
      position.nil? ? result << position : result << (position - message_shifts[index]) % 27 
    end
    result
  end

  def decrypt
    result = []
    alphabet = ("a".."z").to_a << " "
    unshifted_alphabet_positions.each_with_index do |position, index|
      position.nil? ? result << @message[index] : result << alphabet[position]
    end
    { decryption: result.join, key: @decrypt_key.digits, date: @decrypt_offset.date }
  end

end