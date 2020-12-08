defmodule Solution do
  def find(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.count(fn record ->
      record
      |> String.split(":", trim: true)
      |> satisfy?()
    end)
    |> IO.inspect()
  end

  def satisfy?([rule, password]) do
    password = String.trim(password)
    [times, character] = String.split(rule)
    [times_s, times_f] = String.split(times, "-")

    Regex.match?(~r/#{character}{#{times_s},#{times_f}}/, password)
  end
end

input = """
1-3 a: abcde
1-3 b: cdefg
2-9 c: ccccccccc
"""

Solution.find(input)
