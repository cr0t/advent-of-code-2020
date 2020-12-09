defmodule Solution do
  def find(input) do
    input
    |> normalize()
    |> Enum.map(&get_fields/1)
    |> Enum.count(&valid?/1)
    |> IO.puts()
  end

  defp normalize(input) do
    input
    |> String.split("\n\n", trim: true)
    |> Enum.map(&String.replace(&1, "\n", " "))
    |> Enum.map(fn passport_record ->
      passport_record
      |> String.split()
      |> Enum.sort()
    end)
  end

  defp get_fields(record) do
    record
    |> Enum.map(fn passport_details ->
      [field, _value] =
        passport_details
        |> String.split(":")
      String.to_existing_atom(field)
    end)
  end

  defp valid?([:byr, :cid, :ecl, :eyr, :hcl, :hgt, :iyr, :pid]), do: true
  defp valid?([:byr, :ecl, :eyr, :hcl, :hgt, :iyr, :pid]), do: true
  defp valid?(_), do: false
end

input = """
ecl:gry pid:860033327 eyr:2020 hcl:#fffffd
byr:1937 iyr:2017 cid:147 hgt:183cm

iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884
hcl:#cfa07d byr:1929

hcl:#ae17e1 iyr:2013
eyr:2024
ecl:brn pid:760753108 byr:1931
hgt:179cm

hcl:#cfa07d eyr:2025 pid:166559648
iyr:2011 ecl:brn hgt:59in
"""

Solution.find(input)
