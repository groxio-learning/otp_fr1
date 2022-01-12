defmodule Puzzler.Server do
  alias Puzzler.Game.Board
  use GenServer

  @impl true
  def init(name) do
    IO.puts "starting #{name}"
    answer = (1..8 |> Enum.shuffle() |> Enum.take(4))
    {:ok, Board.new(answer)}
  end

  @impl true
  def handle_call({:guess, guess}, _from, board) do
    next_board = Board.add(board, guess)
    {:reply, Board.render(next_board), next_board}
  end

  ## client APIs

  def start_link(name) do
    GenServer.start_link(__MODULE__, name, name: name)
  end

  def guess(server \\ __MODULE__, guess) do
    GenServer.call(server, {:guess, guess}) |> IO.puts()
  end

  def child_spec(name) do
    %{id: name, start: {Puzzler.Server, :start_link, [name]}}
  end
end
