# Solution for: Re-implement Enum.map/2 using Recursion

defmodule MyEnum do
  @doc """
  Applies the given function to each element in the list and returns a new list.
  This is done using recursion.
  """

  # Base Case: If the list is empty, return an empty list.
  # This stops the recursion.
  def map([], _func), do: []

  # Recursive Step: For a non-empty list, we pattern match to get the head and tail.
  # 1. Apply the function `func` to the `head` of the list.
  # 2. Recursively call `map` on the `tail` of the list.
  # 3. Prepend the result of step 1 to the result of step 2.
  def map([head | tail], func) do
    [func.(head) | map(tail, func)]
  end
end

# --- Tests ---
defmodule MyEnumTest do
  def run do
    IO.puts("Running MyEnum.map/2 tests...")

    # Test Case 1: Doubling numbers
    list1 = [1, 2, 3, 4]
    func1 = fn x -> x * 2 end
    expected1 = [2, 4, 6, 8]
    result1 = MyEnum.map(list1, func1)
    assert(result1, expected1, "Test Case 1: Doubling numbers")

    # Test Case 2: Converting numbers to strings
    list2 = [10, 20, 30]
    func2 = &Integer.to_string/1
    expected2 = ["10", "20", "30"]
    result2 = MyEnum.map(list2, func2)
    assert(result2, expected2, "Test Case 2: Converting to strings")

    # Test Case 3: Empty list
    list3 = []
    func3 = fn x -> x + 1 end
    expected3 = []
    result3 = MyEnum.map(list3, func3)
    assert(result3, expected3, "Test Case 3: Empty list")

    IO.puts("All tests passed!")
  end

  defp assert(result, expected, test_name) do
    if result == expected do
      IO.puts("  [PASS] #{test_name}")
    else
      IO.puts("  [FAIL] #{test_name}")
      IO.puts("    Expected: #{inspect(expected)}")
      IO.puts("    Got:      #{inspect(result)}")
      System.halt(1)
    end
  end
end

MyEnumTest.run()