defmodule GasTest do
  use ExUnit.Case
  doctest Gas

  test "greets the world (actuall integration test)" do
    Gas.integrations()
    |> Enum.map(fn m -> Gas.get(m) end)
    |> Enum.map(fn gas -> 
      assert is_float(gas.fast)
      assert is_float(gas.fastest)
      assert is_float(gas.low)
      assert is_float(gas.standard)
      assert is_binary(gas.name)
    end)
  end
end
