defmodule GenReport do
  alias GenReport.Parser

  def build(), do: {:error, "Insira o nome de um arquivo"}

  def build(file_name) do
    parsed_list = Parser.parse_file(file_name)

    all_hours = Enum.reduce(parsed_list, %{}, &get_all_hours/2)
    hours_per_month = Enum.reduce(parsed_list, %{}, &get_hours_per_month/2)
    hours_per_year = Enum.reduce(parsed_list, %{}, &get_hours_per_year/2)

    %{
      "all_hours" => all_hours,
      "hours_per_month" => hours_per_month,
      "hours_per_year" => hours_per_year
    }
  end

  def build_many() do
    {:error, "Insira um lista contendo os nomes dos arquivos"}
  end

  def build_many(files) when is_list(files) do
    files
    |> Task.async_stream(&build/1)
    |> Enum.reduce(nil, &sum_reports/2)
  end

  defp get_all_hours(list, acc) do
    name_key = Enum.at(list, 0)
    hours = Enum.at(list, 1)

    all_hours =
      acc
      |> Map.put_new(name_key, 0)
      |> Map.update!(name_key, fn old_value ->
        old_value + hours
      end)

    all_hours
  end

  defp get_hours_per_month(list, acc) do
    name_key = Enum.at(list, 0)
    month_key = Enum.at(list, 3)
    hours = Enum.at(list, 1)

    hours_per_month =
      acc
      |> Map.put_new(name_key, %{})
      |> Map.update!(name_key, fn old_map_by_name ->
        old_map_by_name
        |> Map.put_new(month_key, 0)
        |> Map.update!(month_key, fn old_value_by_month ->
          old_value_by_month + hours
        end)
      end)

    hours_per_month
  end

  defp get_hours_per_year(list, acc) do
    name_key = Enum.at(list, 0)
    year_key = Enum.at(list, 4)
    hours = Enum.at(list, 1)

    hours_per_year =
      acc
      |> Map.put_new(name_key, %{})
      |> Map.update!(name_key, fn old_map_by_name ->
        old_map_by_name
        |> Map.put_new(year_key, 0)
        |> Map.update!(year_key, fn old_value_by_year ->
          old_value_by_year + hours
        end)
      end)

    hours_per_year
  end

  defp sum_reports({:ok, value}, acc) when is_nil(acc) do
    value
  end

  defp sum_reports({:ok, value}, acc) do
    Map.merge(acc, value, &sum_maps/3)
  end

  defp sum_maps(_key, cur_value, new_value) when is_map(cur_value) do
    Map.merge(cur_value, new_value, &sum_maps/3)
  end

  defp sum_maps(_key, cur_value, new_value) do
    cur_value + new_value
  end
end
