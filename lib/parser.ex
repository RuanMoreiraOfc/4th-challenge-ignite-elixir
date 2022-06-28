defmodule GenReport.Parser do
  def parse_file(file_name) do
    file_name
    |> File.stream!()
    |> Stream.map(&parse_line/1)
  end

  defp parse_line(line) do
    line
    |> String.trim()
    |> String.downcase()
    |> String.split(",")
    |> Enum.map(&parse_line_data/1)
    |> List.update_at(3, &parse_month/1)
  end

  defp parse_line_data(element) do
    element
    |> try_parse_to_integer()
    |> resolve_integer_parse(element)
  end

  defp try_parse_to_integer(element), do: Integer.parse("#{element}")

  defp resolve_integer_parse({value, _}, _), do: value

  defp resolve_integer_parse(:error, element), do: element

  defp parse_month(month_index) do
    month_list = [
      "janeiro",
      "fevereiro",
      "março",
      "abril",
      "maio",
      "junho",
      "julho",
      "agosto",
      "setembro",
      "outubro",
      "novembro",
      "dezembro"
    ]

    Enum.at(month_list, month_index - 1)
  end
end
