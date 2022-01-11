defmodule PuzzlerTest do
  use ExUnit.Case
  doctest Puzzler

  test "greets the world" do
    assert Puzzler.hello() == :world
  end
end
