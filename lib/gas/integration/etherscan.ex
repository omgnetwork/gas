defmodule Gas.Integration.Etherscan do
  def url(), do: "https://api.etherscan.io/api?module=gastracker&action=gasoracle&apikey="

  def map2struct(body) do
    standard = String.to_integer(body["result"]["SafeGasPrice"]) * 1.0

    %Gas{
      fast: String.to_integer(body["result"]["ProposeGasPrice"]) * 1.0,
      fastest: String.to_integer(body["result"]["FastGasPrice"]) * 1.0,
      standard: standard,
      low: standard * 60 / 100,
      name: "Etherscan"
    }
  end

  def get(url, options) do
    api_key = Keyword.get(options, :api_key)

    case api_key do
      nil ->
        HTTPoison.get!(url, [], options)

      _ ->
        HTTPoison.get!(url <> api_key, [], options)
    end
  end
end
