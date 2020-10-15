defmodule GasTest do
  use ExUnit.Case
  doctest Gas
  require Logger

  test "greets the world (actuall integration test)" do
    Process.flag(:trap_exit, true)

    result =
      Gas.integrations()
      |> Enum.map(fn m ->
        try do
          Gas.get(m)
        rescue
          kind ->
            _ = Logger.error("#{m} error #{inspect(kind)}")
            %Gas{}
        end
      end)
      |> Enum.map(fn gas ->
        _ = Logger.info("Gas response #{inspect(gas)}")

        is_float(gas.fast) and is_float(gas.fastest) and is_float(gas.low) and
          is_float(gas.standard) and is_binary(gas.name)
      end)

    Gas.integrations()
    |> Enum.zip(result)
    |> Enum.map(fn
      {integration, false} -> Logger.warn("#{integration} failed.")
      {_, true} -> :ok
    end)

    assert Enum.all?(result)
  end
end
