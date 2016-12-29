class Bottles
  def song
    verses(99, 0)
  end

  def verses(*verses)
    output = (verses[1]..verses[0]).to_a.reverse.map { |n| verse(n) }
    output.join("\n")
  end

  def verse(number)
    this_bottle = BottleNumber.new(number)
    next_bottle = BottleNumber.new(this_bottle.successor)
      <<-VERSE_X
#{this_bottle.quantity.capitalize} #{this_bottle.container} of beer on the wall, #{this_bottle.quantity} #{this_bottle.container} of beer.
#{this_bottle.action}, #{next_bottle.quantity} #{next_bottle.container} of beer on the wall.
      VERSE_X
  end
end

class BottleNumber
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def successor
    if number == 0
      99
    else
      number - 1
    end
  end

  def action
    if number == 0
      "Go to the store and buy some more"
    else
      "Take #{pronoun} down and pass it around"
    end
  end

  def quantity
    if number == 0
      "no more"
    else
      number.to_s
    end
  end

  def pronoun
    if number == 1
      "it"
    else
      "one"
    end
  end

  def container
    if number == 1
      "bottle"
    else
      "bottles"
    end
  end
end
