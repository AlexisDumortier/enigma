require_relative './cryptor'
require_relative './key'
require_relative './offset'

class Encryptor < Cryptor

  attr_reader :encrypt_key, :encrypt_offset, :encrypt_shift

  def initialize(message, key, date) 
    super(message, key, date) 
    @encrypt_key = Key.new(key)
    @encrypt_offset = Offset.new(date)
    @encrypt_shift = [@encrypt_key.make_keys, @encrypt_offset.make_offsets].transpose.map{|a| a.sum} 
  end
 
  def message_shifts
    shifts = []
    (@message.length / @encrypt_shift.length).times {shifts << @encrypt_shift} 
    shifts << @encrypt_shift[0..(@message.length % @encrypt_shift.length)-1]
    shifts = shifts.flatten
    message_ord = message.split('').map {|letter| letter.ord}
    message_ord.each_with_index do |ord, index| 
       shifts[index] = 0  if !(((ord >= 'a'.ord) && (ord <= 'z'.ord)) || (ord == ' '.ord))
    end
    shifts
  end

end