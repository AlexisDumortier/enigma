require_relative './cryptor'

class Encryptor < Cryptor

  attr_reader :message, :key, :date

  def initialize(message, key, date) 
    super(message, key, date) 
  end

end