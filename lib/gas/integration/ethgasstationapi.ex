defmodule Gas.Integration.EthGasStationApi do
  def url(), do: "https://www.ethgasstationapi.com/api/"

  def map2struct(body) do
    [standard, fast, fastest] = body |> Enum.map(&String.to_float/1) |> Enum.sort()

    %Gas{
      fast: fastest,
      fastest: fast,
      standard: standard,
      # we don't want to leave it blank so we assume low is 60% of standard
      low: standard * 60 / 100,
      name: "EthGasStationApi"
    }
  end

  def get(url, options) do
    [url <> "low", url <> "standard", url <> "fast"]
    |> Task.async_stream(fn url -> HTTPoison.get!(url, [], options) end)
    |> Enum.into([], fn {:ok, res} -> res end)
  end
end
