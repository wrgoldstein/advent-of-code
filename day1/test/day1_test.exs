defmodule Day1Test do
  use ExUnit.Case
  doctest Day1

  test "part 1" do
    assert Day1.answer("test/test_input", 2) == 514579
  end

  test "part 2" do
    assert Day1.answer("test/test_input", 3) == 241861950
  end
end
