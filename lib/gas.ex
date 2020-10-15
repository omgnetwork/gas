defmodule Gas do
  defstruct [:fastest, :fast, :standard, :low, :name]
  alias Gas.Request
  alias Gas.Response
  alias Gas.Decode
  alias Gas.Normalize

  def get(integration) when is_atom(integration) do
    result =
      case Application.get_env(:gas, integration) do
        nil -> []
        result -> [options: result]
      end

    Process.put(:integration, integration)
    get(result)
  end

  def get(opts) do
    opts
    |> Request.request()
    |> Response.response()
    |> Decode.decode()
    |> Normalize.normalize()
  end

  def integrations() do
    [
      # Gas.Integration.EthGasStationApi,
      Gas.Integration.GasPriceOracle,
      Gas.Integration.Pulse,
      Gas.Integration.Web3Api
    ]
  end
end
