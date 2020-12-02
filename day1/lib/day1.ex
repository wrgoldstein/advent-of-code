defmodule Day1 do
  @moduledoc """
  Solution to advent of code day 1.

  At the command line: "mix solve"
  """

  def answer(file, n) do
    {:ok, input} = File.read(file)
    input
      |> String.split("\n")
      |> Enum.map(fn x -> String.to_integer(x) end)
      |> find_pair(n)
      |> Enum.reduce(1, fn x, acc -> x * acc end)
  end

  @spec find_pair(list(), integer()) :: list()
  def find_pair(input, n) do
    comb(n, input)
      |> Enum.find(fn x -> Enum.sum(x) == 2020 end)
  end

  # https://rosettacode.org/wiki/Combinations#Elixir is this cheating?
  def comb(0, _), do: [[]]
  def comb(_, []), do: []
  def comb(m, [h|t]) do
    (for l <- comb(m-1, t), do: [h|l]) ++ comb(m, t)
  end
end


defmodule Mix.Tasks.Solve do
  use Mix.Task

  @impl Mix.Task
  def run(file) do
    IO.puts("Part 1: #{Day1.answer(file, 2)}")
    IO.puts("Part 2: #{Day1.answer(file, 3)}")
  end
end
