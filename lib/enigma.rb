require_relative './encryptor'
require_relative './decryptor'

class Enigma

  def encrypt(message, key ='', date='')
    encryptor = Encryptor.new(message, key, date)
    encryptor.encrypt
  end

  def decrypt(message, key, date='')
    decryptor = Decryptor.new(message, key, date)
    decryptor.decrypt
  end

end