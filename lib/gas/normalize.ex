defmodule Gas.Normalize do
  def normalize({request_url, body}) do
    integrations = get_integrations()

    {module, _} =
      Enum.find(integrations, fn {module, integration} ->
        String.starts_with?(request_url, integration)
      end)

    apply(module, :map2struct, [body])
  end

  defp get_integrations() do
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
