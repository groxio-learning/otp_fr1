defmodule Dracula.Server do
  alias Dracula.Counter
  use GenServer

  @impl true
  def init(string_number) do
    {:ok, Counter.new(string_number)}
  end

  @impl true
  def handle_call(:read, _from, counter) do
    {:reply, Counter.message(counter), counter}
  end

  @impl true
  def handle_cast(:inc, counter) do
    {:noreply, Counter.add(counter, 1)}
  end

  ## client APIs

  def start_link(string_number) do
    GenServer.start_link(__MODULE__, string_number, name: __MODULE__)
  end

  def inc(server \\ __MODULE__) do
    GenServer.cast(server, :inc)
  end

  def read(server \\ __MODULE__) do
    GenServer.call(server, :read)
  end
end
