defmodule Gas.Decode do
  def decode({"text/plain", request_url, body}) do
    {request_url, body}
  end

  def decode({_, request_url, body}) do
    {request_url, Jason.decode!(body)}
  end
end
