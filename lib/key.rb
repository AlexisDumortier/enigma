class Key

  attr_reader :digits

  def initialize(key = '')
    if key == ''
      @digits = (Array.new(5) { rand(0...9) }).join
    else
      @digits = key
    end
  end 

  def make_keys
    [digits[0..1].to_i, digits[1..2].to_i, digits[2..3].to_i, digits[3..4].to_i]
  end

end