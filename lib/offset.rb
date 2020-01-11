require 'date'

class Offset

  attr_reader :date

  def initialize(date = Time.now.strftime('%d%m%y')) 
    @date = date
  end

end