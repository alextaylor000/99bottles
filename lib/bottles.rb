class Bottles
  def song
    verses(99, 0)
  end

  def verses(*verses)
    output = (verses[1]..verses[0]).to_a.reverse.map { |n| verse(n) }
    output.join("\n")
  end

  def verse(number)
    this_bottle = BottleNumberFactory.new(number)

      <<-VERSE_X
#{this_bottle.quantity.capitalize} #{this_bottle.container} of beer on the wall, #{this_bottle.quantity} #{this_bottle.container} of beer.
#{this_bottle.action}, #{this_bottle.successor.quantity} #{this_bottle.successor.container} of beer on the wall.
      VERSE_X
  end
end

class BottleNumberFactory
  def self.new(number)
    case number
    when 0
      BottleNumber0.new(number)
    when 1
      BottleNumber1.new(number)
    else
      BottleNumber.new(number)
    end
  end
end

class BottleNumber
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def successor
    BottleNumberFactory.new(number - 1)
  end

  def action
    "Take #{pronoun} down and pass it around"
  end

  def quantity
    number.to_s
  end

  def pronoun
    "one"
  end

  def container
    "bottles"
  end
end

class BottleNumber0 < BottleNumber
  def successor
    BottleNumber.new(99)
  end

  def action
    "Go to the store and buy some more"
  end

  def quantity
    "no more"
  end
end

class BottleNumber1 < BottleNumber
  def pronoun
    "it"
  end

  def container
    "bottle"
  end
end

