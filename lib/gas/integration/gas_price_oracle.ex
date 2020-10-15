defmodule Gas.Integration.GasPriceOracle do
  def url(), do: "https://www.etherchain.org/api/gasPriceOracle"

  def map2struct(body) do
    %Gas{
      fast: body["fast"] * 1.0,
      fastest: body["fastest"] * 1.0,
      standard: body["standard"] * 1.0,
      low: body["safeLow"] * 1.0,
      name: "GasPriceOracle"
    }
  end

  def get(url, options) do
    HTTPoison.get!(url, [{"Accept", "application/json"}], options)
  end
end
