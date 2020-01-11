require_relative './cryptor'
require_relative './key'
require_relative './offset'

class Encryptor < Cryptor

  attr_reader :encrypt_key, :encrypt_offset, :encrypt_shift

  def initialize(message, key = '', date = '') 
    super(message, key, date) 
    @encrypt_key = Key.new(key)
    @encrypt_offset = (date == '' ? Offset.new : Offset.new(date))
    @encrypt_shift = [@encrypt_key.make_keys, @encrypt_offset.make_offsets].transpose.map{|a| a.sum} 
  end

  def message_in_alphabet_positions
    alphabet = ("a".."z").to_a << " "
    @message.split('').map {|letter| alphabet.find_index(letter)}
  end
 
  def message_shifts
    shifts = []
    (@message.length / @encrypt_shift.length).times {shifts << @encrypt_shift} 
    shifts << @encrypt_shift[0..(@message.length % @encrypt_shift.length)-1]
    shifts = shifts.flatten
    message_in_alphabet_positions.each_with_index do |position, index| 
      shifts[index] = 0  if position.nil?
    end
    shifts
  end

  def shifted_alphabet_positions
    result = []
    message_in_alphabet_positions.each_with_index do |position, index|
      position.nil? ? result << position : result << (position + message_shifts[index]) % 27 
    end
    result
  end

  def encrypt
    result = []
    alphabet = ("a".."z").to_a << " "
    shifted_alphabet_positions.each_with_index do |position, index|
      position.nil? ? result << @message[index] : result << alphabet[position]
    end
    { encryption: result.join, key: @encrypt_key.digits, date: @encrypt_offset.date }
  end


end