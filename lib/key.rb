class Key

  attr_reader :digits

  def initialize(key = '')
    @digits = (key == '' ? (Array.new(5) { rand(1...9) }).join : key)
  end 
  

end