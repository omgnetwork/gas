defmodule GasTest do
  use ExUnit.Case
  doctest Gas

  test "greets the world" do
    assert Gas.hello() == :world
  end
end
