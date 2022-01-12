defmodule Puzzler do
  alias Puzzler.Server

  def add(name) do
    DynamicSupervisor.start_child(:sup, {Server, name})
  end

  def guess(name, guess) do
    Server.guess(name, guess)
  end
end
