# Solution: `for` Comprehension

defmodule ComprehensionChallenge do

  def get_squared_lengths_of_odd_words(words) do
    words
    |> Enum.filter(fn word -> rem(String.length(word), 2) != 0 end)
    |> Enum.map(fn word -> String.length(word) * String.length(word) end)
  end

  def get_squared_lengths_with_comprehension(words) do
    for word <- words, rem(String.length(word), 2) != 0 do
      len = String.length(word)
      len * len
    end
  end
end

# --- Tests ---
defmodule ComprehensionTest do
  def run do
    IO.puts("Running for comprehension tests...")

    word_list = ["elixir", "is", "a", "functional", "language"]

    expected = [1, 1, 121]
    result = ComprehensionChallenge.get_squared_lengths_with_comprehension(word_list)

    if result == expected do
      IO.puts("  [PASS] Comprehension produced the correct result.")
    else
      IO.puts("  [FAIL] Comprehension produced the wrong result.")
      IO.puts("    Expected: #{inspect(expected)}")
      IO.puts("    Got:      #{inspect(result)}")
      System.halt(1)
    end

    IO.puts("All tests passed!")
  end
end

ComprehensionTest.run()
