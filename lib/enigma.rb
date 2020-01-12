require_relative './encryptor'

class Enigma


  def encrypt(message, key, date)
    encryptor = Encryptor.new(message, key, date)
    encryptor.encrypt
  end

end