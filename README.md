<h1 align='center'>
3rd Challenge Elixir
</h1>

This repo includes the resolution for 3rd Challenge in Elixir Journey with [Rafael Camada][btn-tutor].

## GOAL

```elixir
# file.csv
Daniele,7,29,4,2018
Mayk,4,9,12,2019
Daniele,5,27,12,2016
Mayk,1,2,12,2017
Giuliano,3,13,2,2017
Cleiton,1,22,6,2020
Giuliano,6,18,2,2019
Jakeliny,8,18,7,2017
Joseph,3,17,3,2017
```

```elixir
GenReport.build("file.csv")

# OUTPUT:
# %{
#   "all_hours" => %{
#     "cleiton" => 1,
#     "daniele" => 12,
#     "giuliano" => 9,
#     "jakeliny" => 8,
#     "joseph" => 3,
#     "mayk" => 5
#   },
#   "hours_per_month" => %{
#     "cleiton" => %{"junho" => 1},
#     "daniele" => %{"abril" => 7, "dezembro" => 5},
#     "giuliano" => %{"fevereiro" => 9},
#     "jakeliny" => %{"julho" => 8},
#     "joseph" => %{"março" => 3},
#     "mayk" => %{"dezembro" => 5}
#   },
#   "hours_per_year" => %{
#     "cleiton" => %{2020 => 1},
#     "daniele" => %{2016 => 5, 2018 => 7},
#     "giuliano" => %{2017 => 3, 2019 => 6},
#     "jakeliny" => %{2017 => 8},
#     "joseph" => %{2017 => 3},
#     "mayk" => %{2017 => 1, 2019 => 4}
#   }
# }
```

<!-- VARIABLES -->

[btn-tutor]: https://github.com/rafaelcamarda
