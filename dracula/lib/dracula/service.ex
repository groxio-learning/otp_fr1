defmodule Dracula.Service do

  alias Dracula.Counter

  # Client APIs
  def start(string) do
    spawn(fn ->
      counter = Counter.new(string)
      run(counter)
    end)
  end

  def inc(service) do
    send(service, :inc)
  end

  def read(service) do
    send(service, {:read, self()})
    receive do
      message -> message
    end
  end

  # Server APIs
  def run(counter) do
    counter
    |> listen()
    |> run()
  end

  def listen(counter) do
    receive do
      :inc ->
        new_counter = Counter.add(counter, 1)
        new_counter
      {:read, from} ->
        server_counter = counter
        client_message = Counter.message(server_counter)
        send(from, client_message)
        server_counter
    end

  end
end
