defmodule Gas.Request do
  alias Gas.Common

  def request(opts) do
    module = Process.get(:integration)
    url = Keyword.get(opts, :url, apply(module, :url, []))
    options = Keyword.get(opts, :options, [])
    apply(module, :get, [url, options])
  end
end
