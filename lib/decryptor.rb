require_relative './cryptor'
require_relative './key'
require_relative './offset'

class Decryptor < Cryptor

  def initialize(message, key = '', date = '') 
    super(message, key, date) 
    @decrypt_key = Key.new(key)
    @decrypt_offset = (date == '' ? Offset.new : Offset.new(date))
    @decrypt_shift = [@decrypt_key.make_keys, @decrypt_offset.make_offsets].transpose.map{|a| a.sum} 
  end
  
end