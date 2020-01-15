require 'date'

class Offset

  attr_reader :date

  def initialize(date)
    if date == ''
      @date = Time.now.strftime('%d%m%y')
    else
      @date = date
    end
  end

  def square_date
    date.to_i ** 2 
  end

  def make_offsets
    offset_digits = square_date.to_s.split('').map {|letter| letter.to_i}
    offset_digits[-4..-1]
  end

end