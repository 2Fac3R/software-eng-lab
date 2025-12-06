# Challenge: `for` Comprehension

# Instructions:
# The function `get_squared_lengths_of_odd_words` below uses a combination
# of `Enum.filter/2` and `Enum.map/2`. 
#
# Your task is to refactor this function into a new function, 
# `get_squared_lengths_with_comprehension/1`, that produces the exact same
# result but uses a single `for` comprehension instead.

defmodule ComprehensionChallenge do

  def get_squared_lengths_of_odd_words(words) do
    words
    |> Enum.filter(fn word -> rem(String.length(word), 2) != 0 end)
    |> Enum.map(fn word -> String.length(word) * String.length(word) end)
  end

  def get_squared_lengths_with_comprehension(words) do
    # TODO: Your implementation here using a `for` comprehension
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

# To run tests, you would need to have the solution implemented.
# ComprehensionTest.run()
