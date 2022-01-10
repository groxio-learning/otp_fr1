defmodule Dracula.Counter do
  @moduledoc """
  Documentation for `Counter`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Dracula.hello()
      :world

  """
  def new(num_string) do
    %{count: String.to_integer(num_string)}
  end

  def add(%{count: count}, integer_to_add) do
    %{count: count + integer_to_add}
  end

  def message(%{count: count}) do
    "The treas-arrr is #{count}."
  end
end
