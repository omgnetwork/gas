defmodule Gas.Response do
  def response(response) do
    {_, type} = List.keyfind(response.headers, "Content-Type", 0)
    {type, response.request_url, response.body}
  end
end
