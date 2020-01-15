require_relative './decryptor'


class Cracking

  attr_reader :message, :date

  def initialize(message, date = Time.now.strftime('%d%m%y')) 
    @message = message 
    @date = date
  end
  
  def make_key_string(number)
    key_string = number.to_s
    (5 - number.to_s.length).times {key_string = '0' + key_string} 
    key_string
  end

  def find_key_from_date
    count, key = 0, make_key_string(count)
    decryptor = Decryptor.new(@message, key, @date)
    output = decryptor.decrypt
    while (output[:decryption][-4..-1] != ' end') && (count < 100000)
      count += 1
      key = make_key_string(count)
      decryptor = Decryptor.new(@message, key, @date)
      output = decryptor.decrypt
    end
    key
  end

  def crack
    key = find_key_from_date
    decryptor = Decryptor.new(@message, key, @date)
    decryptor.decrypt
  end

end