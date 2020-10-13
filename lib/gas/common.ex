defmodule Gas.Common do
  def get_integration_module(request_url) do
    integrations = get_all_integrations()

    {module, _} =
      Enum.find(integrations, fn {_module, integration} ->
        String.starts_with?(request_url, integration)
      end)

    module
  end

  defp get_all_integrations() do
    {:ok, list} = :application.get_key(:gas, :modules)

    list
    |> Enum.filter(fn module ->
      case Module.split(module) do
        ["Gas"] -> false
        ["Gas", "Integration", _] -> true
        _ -> false
      end
    end)
    |> Enum.map(fn module -> {module, apply(module, :url, [])} end)
  end
end
