require_relative './cryptor'

class Crack < Cryptor

  def initialize(message, date = '') 
    @message = message 
    @date = date
  end 
  
end