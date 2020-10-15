defmodule Gas.Integration.Web3Api do
  def url(), do: "https://web3api.io/api/v2/transactions/gas/predictions"

  def map2struct(body) do
    %Gas{
      fast: div(body["payload"]["fast"]["gasPrice"], 1_000_000_000) * 1.0,
      fastest: div(body["payload"]["fastest"]["gasPrice"], 1_000_000_000) * 1.0,
      standard: div(body["payload"]["average"]["gasPrice"], 1_000_000_000) * 1.0,
      low: div(body["payload"]["safeLow"]["gasPrice"], 1_000_000_000) * 1.0,
      name: "Web3Api"
    }
  end

  def get(url, options) do
    blockchain_id = Keyword.fetch!(options, :blockchain_id)
    api_key = Keyword.fetch!(options, :api_key)

    HTTPoison.get!(
      url,
      [
        {"Accept", "application/json"},
        {"x-amberdata-blockchain-id", blockchain_id},
        {"x-api-key", api_key}
      ],
      options
    )
  end
end
