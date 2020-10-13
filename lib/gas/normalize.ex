defmodule Gas.Normalize do
  def normalize(all_data) when is_list(all_data) do
    module = Process.get(:integration)
    apply(module, :map2struct, [all_data])
  end

  def normalize(body) do
    module = Process.get(:integration)
    apply(module, :map2struct, [body])
  end
end
