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
No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.
      VERSE_0
    else
      <<-VERSE_X
#{number} #{container(number)} of beer on the wall, #{number} #{container(number)} of beer.
Take #{pronoun(number)} down and pass it around, #{result(number - 1)} #{container(number - 1)} of beer on the wall.
      VERSE_X
    end
  end

  def result(number)
    if number == 0
      "no more"
    else
      number
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
