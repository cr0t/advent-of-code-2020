defmodule Solution do
  def find(input) do
    lines = String.split(input, "\n", trim: true)

    pattern_width = lines |> List.first() |> String.length()

    lines
    |> Enum.with_index()
    |> Enum.count(fn
      {_line, 0} -> false
      {line, idx} -> char_at_infinite(line, idx * 3, pattern_width) == "#"
    end)
    |> IO.puts()
  end

  defp char_at_infinite(line, position, pattern_width) do
    position = Integer.mod(position, pattern_width)
    String.at(line, position)
  end
end

input = """
..##.......
#...#...#..
.#....#..#.
..#.#...#.#
.#...##..#.
..#.##.....
.#.#.#....#
.#........#
#.##...#...
#...##....#
.#..#...#.#
"""

Solution.find(input)
