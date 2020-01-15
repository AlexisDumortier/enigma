require_relative './cryptor'
require_relative './key'
require_relative './offset'

class Encryptor < Cryptor

  attr_reader :encrypt_key, :encrypt_offset, :shift

  def initialize(message, key = '', date = '') 
    super(message)
    @encrypt_key = Key.new(key)
    @encrypt_offset = Offset.new(date)
    @shift = [encrypt_key.make_keys, encrypt_offset.make_offsets].transpose.map{|a| a.sum} 
  end

  def shifted_alphabet_positions
    result = []
    message_in_alphabet_positions.each_with_index do |position, index|
      if position.nil? 
        result << position 
      else 
        result << (position + message_shifts[index]) % 27 
      end
    end
    result
  end

  def encrypt
    result = []
    alphabet = ('a'..'z').to_a << ' '
    shifted_alphabet_positions.each_with_index do |position, index|
      position.nil? ? result << @message[index] : result << alphabet[position]
    end
    { encryption: result.join, key: encrypt_key.digits, date: encrypt_offset.date }
  end

end