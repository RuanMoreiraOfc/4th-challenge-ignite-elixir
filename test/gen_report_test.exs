defmodule GenReportTest do
  use ExUnit.Case

  alias GenReport
  alias GenReport.Support.ReportFixture

  @file_name "gen_report.csv"
  @file_name_list ["part_1.csv", "part_2.csv", "part_3.csv"]

  describe "build/1" do
    test "When passing file name return a report" do
      response = GenReport.build(@file_name)

      assert response == ReportFixture.build()
    end

    test "When no filename was given, returns an error" do
      response = GenReport.build()

      assert response == {:error, "Insira o nome de um arquivo"}
    end
  end

  describe "build_many/1" do
    test "When passing a list of files return a report" do
      response = GenReport.build_many(@file_name_list)

      assert response == ReportFixture.build()
    end

    test "When no list was given, returns an error" do
      response = GenReport.build_many()

      assert response == {:error, "Insira um lista contendo os nomes dos arquivos"}
    end
  end
end
