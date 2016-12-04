class Bottles
  def song
    verses(99, 0)
  end

  def verses(*verses)
    output = (verses[1]..verses[0]).to_a.reverse.map { |n| verse(n) }
    output.join("\n")
  end

  def verse(num)
    after_num = num - 1

    case num
    when 0
      <<-VERSE_0
No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.
      VERSE_0
    when 1
      <<-VERSE_1
1 bottle of beer on the wall, 1 bottle of beer.
Take it down and pass it around, no more bottles of beer on the wall.
      VERSE_1
    else
      <<-VERSE_X
#{num} bottles of beer on the wall, #{num} bottles of beer.
Take one down and pass it around, #{after_num} #{pluralize_bottle(after_num)} of beer on the wall.
      VERSE_X
    end
  end

  def pluralize_bottle(num)
    num == 1 ? "bottle" : "bottles"
  end
end


