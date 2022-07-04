<h1 align='center'>
4th Challenge Elixir
</h1>

This repo includes the resolution for 4th Challenge in Elixir Journey with [Rafael Camarda][btn-tutor].

## GOAL

```elixir
# part_1.csv
Daniele,7,29,4,2018
Mayk,4,9,12,2019
Daniele,5,27,12,2016
Mayk,1,2,12,2017
Giuliano,3,13,2,2017
Cleiton,1,22,6,2020
```

```elixir
# part_2.csv
Diego,4,29,10,2020
Giuliano,2,25,2,2019
Joseph,7,15,3,2020
Giuliano,3,8,3,2017
Cleiton,2,12,8,2016
Danilo,6,11,8,2016
```

```elixir
# part_3.csv
Giuliano,6,3,10,2017
Joseph,7,2,4,2019
Joseph,5,3,3,2020
Danilo,6,24,2,2018
Danilo,2,30,8,2016
Cleiton,3,3,4,2019
```

```elixir
GenReport.build_many(["part_1.csv", "part_2.csv", "part_3.csv"])

# OUTPUT:
# %{
#   "all_hours" => %{
#     "cleiton" => 6,
#     "daniele" => 12,
#     "danilo" => 14,
#     "diego" => 4,
#     "giuliano" => 14,
#     "joseph" => 19,
#     "mayk" => 5
#   },
#   "hours_per_month" => %{
#     "cleiton" => %{"abril" => 3, "agosto" => 2, "junho" => 1},
#     "daniele" => %{"abril" => 7, "dezembro" => 5},
#     "danilo" => %{"agosto" => 8, "fevereiro" => 6},
#     "diego" => %{"outubro" => 4},
#     "giuliano" => %{"fevereiro" => 5, "março" => 3, "outubro" => 6},
#     "joseph" => %{"abril" => 7, "março" => 12},
#     "mayk" => %{"dezembro" => 5}
#   },
#   "hours_per_year" => %{
#     "cleiton" => %{2016 => 2, 2019 => 3, 2020 => 1},
#     "daniele" => %{2016 => 5, 2018 => 7},
#     "danilo" => %{2016 => 8, 2018 => 6},
#     "diego" => %{2020 => 4},
#     "giuliano" => %{2017 => 12, 2019 => 2},
#     "joseph" => %{2019 => 7, 2020 => 12},
#     "mayk" => %{2017 => 1, 2019 => 4}
#   }
# }

```

<!-- VARIABLES -->

[btn-tutor]: https://github.com/rafaelcamarda
