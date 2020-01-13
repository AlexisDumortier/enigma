require_relative './cryptor'

class Crack < Cryptor

  def initialize(message, date = '') 
    @message = message 
    @date = date
  end
  
  def make_key_string(number)
    key_string = number.to_s
    (5 - number.to_s.length).times {key_string = '0' + key_string} 
    key_string
  end

end