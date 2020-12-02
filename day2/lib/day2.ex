defmodule Day2 do

  def parse_line(line) do
    regex = ~r/(?<min>\d+)-(?<max>\d+) (?<char>\w)\: (?<pass>\w+)/
    captures = Regex.named_captures(regex, line)
    %{
      captures |
      "min" => String.to_integer(captures["min"]),
      "max" => String.to_integer(captures["max"])
    }
  end

  def is_valid1?(%{"min" => min, "max" => max, "char" => char, "pass" => pass}) do
    pass
    |> String.split("")
    |> Enum.count(fn x -> x == char end)
    |> Kernel.in(min..max)
  end

  def is_valid2?(%{"min" => min, "max" => max, "char" => char, "pass" => pass}) do
    split = pass |> String.split("")
    chars = [Enum.at(split, min), Enum.at(split, max)]
    chars |> Enum.count(fn x -> x == char end) == 1
  end
end

defmodule Mix.Tasks.Solve do
  use Mix.Task

  @impl Mix.Task
  def run(file) do
    File.stream!(file)
      |> Enum.map(&Day2.parse_line/1)
      |> Enum.map(&Day2.is_valid2?/1)
      |> Enum.count(fn x -> x == true end)
      |> IO.inspect
  end
end