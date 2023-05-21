defmodule FileIO do
  def char_shift(char, offset) do
    # Shifts a character by a given offset
    cond do
      # Check if the letter is uppercase
      65 <= char and char <= 90 -> Integer.mod(char - 65 + offset, 26) + 65
      # If the letter is lowecase
      97 <= char and char <= 122 -> Integer.mod(char - 97 + offset, 26) + 97
      # If the char is not a letter
      true -> char
    end
  end

  def line_shift(line, offset) do
    # Shifts a list of characters by a given offset Map uses the function and its arrity (number of
    # args it recieves), it takes each item of a list to use it as the argument of another function.
    # Example of map Enum.map([1,2,3], &:math.sqrt/1)
    to_string(Enum.map(to_charlist(line), fn char -> char_shift(&1, offset) end))
  end
end

IO.puts(FileIO.char_shift(90, 5))
IO.puts(FileIO.char_shift(100, 5))
IO.puts(FileIO.char_shift(89, 5))
IO.puts(FileIO.char_shift(70, 5))
IO.puts(FileIO.line_shift("HelloWorld", 15))
