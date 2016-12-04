class Bottles
  def verse(num)
    cur = num
    after = num - 1

    <<-VERSE
#{pluralize(cur).capitalize} of beer on the wall, #{pluralize(cur)} of beer.
Take #{quantity(cur)} down and pass it around, #{pluralize(after)} of beer on the wall.
    VERSE
  end

  def quantity(num)
    num == 1 ? "it" : "one"
  end

  def pluralize(num)
    case num
    when 0
      "no more bottles"
    when 1
      "1 bottle"
    else
      "#{num} bottles"
    end
  end
end
