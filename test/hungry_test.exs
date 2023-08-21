defmodule HungryTest do
  use ExUnit.Case
  doctest Hungry

  test "greets the world" do
    assert Hungry.hello() == :world
  end
end
