defmodule Gas.Response do
  def response([], acc) do
    acc
  end

  def response([response | responses], acc) do
    {_, type} = List.keyfind(response.headers, "Content-Type", 0)
    response(responses, [{type, response.body} | acc])
  end

  def response(responses) when is_list(responses) do
    acc = []
    response(responses, acc)
  end

  def response(response) do
    {_, type} = List.keyfind(response.headers, "Content-Type", 0)
    {type, response.body}
  end
end
