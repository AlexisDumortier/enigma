class Cryptor

  attr_reader :message

  def initialize(message)
    @message = message.downcase
  end

  def message_in_alphabet_positions
    alphabet = ('a'..'z').to_a << ' '
    message.split('').map {|letter| alphabet.find_index(letter)}
  end

  def message_shifts
    shifts = []
    (message.length / shift.length).times {shifts << shift} 
    shifts << shift[0..(message.length % shift.length)-1]
    shifts = shifts.flatten
    message_in_alphabet_positions.each_with_index do |position, index| 
      shifts[index] = 0  if position.nil?
    end
    shifts
  end

end