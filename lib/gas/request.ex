defmodule Gas.Request do
  def get(opts) do
    url = Keyword.fetch!(opts, :url)
    options = Keyword.get(opts, :options, [])
    HTTPoison.get!(url, [{"Accept", "application/json"}], [])
  end
end
