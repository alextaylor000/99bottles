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
    when 1
      <<-VERSE_1
#{number} #{container(number)} of beer on the wall, #{number} #{container(number)} of beer.
Take it down and pass it around, no more #{container(number - 1)} of beer on the wall.
      VERSE_1
    else
      <<-VERSE_X
#{number} #{container(number)} of beer on the wall, #{number} #{container(number)} of beer.
Take one down and pass it around, #{number - 1} #{container(number - 1)} of beer on the wall.
      VERSE_X
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
