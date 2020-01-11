require 'date'

class Offset

  attr_reader :date

  def initialize(date = Time.now.strftime('%d%m%y')) 
    @date = date
  end

  def square_date
    @date.to_i ** 2 
  end

end