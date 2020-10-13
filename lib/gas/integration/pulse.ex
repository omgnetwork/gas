defmodule Gas.Integration.Pulse do
  def url() do
    "https://data-api.defipulse.com/api/v1/egs/api/ethgasAPI.json?api-key="
  end

  def map2struct(body) do
    %Gas{
      fast: div(body["fast"], 10) * 1.0,
      fastest: div(body["fastest"], 10) * 1.0,
      standard: div(body["average"], 10) * 1.0,
      low: div(body["safeLow"], 10) * 1.0,
      name: __MODULE__ |> Module.split() |> Enum.reverse() |> hd()
    }
  end

  def get(url, options) do
    api_key = Keyword.fetch!(options, :api_key)
    HTTPoison.get!(url <> api_key, [{"Accept", "application/json"}], options)
  end
end
