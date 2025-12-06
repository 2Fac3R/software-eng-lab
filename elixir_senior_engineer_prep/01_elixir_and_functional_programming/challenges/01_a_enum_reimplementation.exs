# Challenge: Re-implement Enum.map/2 using Recursion

# Instructions:
# 1. Complete the `MyEnum.map/2` function below.
# 2. It should take a list and a function as arguments.
# 3. It should apply the function to every element in the list and return a new list with the results.
# 4. You MUST use recursion. Do not use any functions from the `Enum` or `Stream` modules.

defmodule MyEnum do
  @doc """
  Applies the given function to each element in the list and returns a new list.
  """
  def map(list, func) do
    # Your implementation here
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