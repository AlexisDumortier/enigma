require_relative './cryptor'
require_relative './key'
require_relative './offset'

class Encryptor < Cryptor

  attr_reader :encrypt_key, :encrypt_offset, :encrypt_shift

  def initialize(message, key, date) 
    super(message, key, date) 
    @encrypt_key = Key.new(key)
    @encrypt_offset = Offset.new(date)
    @encrypt_shift = @encrypt_key.make_keys + @encrypt_offset.make_offsets
  end

  

end