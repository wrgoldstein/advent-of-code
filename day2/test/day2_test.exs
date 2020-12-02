defmodule Day2Test do
  use ExUnit.Case
  doctest Day2

  test "part 1" do
    val = File.stream!("test/test_input")
      |> Enum.map(&Day2.parse_line/1)
      |> Enum.map(&Day2.is_valid1?/1)
      |> Enum.count(fn x -> x == true end)
    assert val == 2
  end

  test "part 2" do
    val = File.stream!("test/test_input")
      |> Enum.map(&Day2.parse_line/1)
      |> Enum.map(&Day2.is_valid2?/1)
      |> Enum.count(fn x -> x == true end)
    assert val == 1
  end
end
