class Bottles
  def song
    verses(99, 0)
  end

  def verses(*verses)
    output = (verses[1]..verses[0]).to_a.reverse.map { |n| verse(n) }
    output.join("\n")
  end

  def verse(number)
    case number
    when 0
      <<-VERSE_0
#{quantity(number).capitalize} #{container(number)} of beer on the wall, #{quantity(number)} #{container(number)} of beer.
#{action(number)}, #{quantity(99)} #{container(number - 1)} of beer on the wall.
      VERSE_0
    else
      <<-VERSE_X
#{quantity(number).capitalize} #{container(number)} of beer on the wall, #{quantity(number)} #{container(number)} of beer.
#{action(number)}, #{quantity(number - 1)} #{container(number - 1)} of beer on the wall.
      VERSE_X
    end
  end

  def action(number)
    if number == 0
      "Go to the store and buy some more"
    else
      "Take #{pronoun(number)} down and pass it around"
    end
  end

  def quantity(number)
    if number == 0
      "no more"
    else
      number.to_s
    end
  end

  def pronoun(number)
    if number == 1
      "it"
    else
      "one"
    end
  end

  def container(number)
    if number == 1
      "bottle"
    else
      "bottles"
    end
  end
end
