defmodule CKEXTest do
  use ExUnit.Case
  doctest CKEX

  test "greets the world" do
    assert CKEX.hello() == :world
  end
end
