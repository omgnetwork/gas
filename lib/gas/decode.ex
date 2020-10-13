defmodule Gas.Decode do
  def decode([], acc) do
    acc
  end

  def decode([response | data], acc) do
    decode(data, [decode(response) | acc])
  end

  def decode(data) when is_list(data) do
    acc = []
    decode(data, acc)
  end

  def decode({"text/plain", body}) do
    body
  end

  def decode({_, body}) do
    Jason.decode!(body)
  end
end
