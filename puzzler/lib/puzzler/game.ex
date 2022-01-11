defmodule Puzzler.Game do

  def new(answer) do
    %{
      answer: answer,
      guesses: [],
    }
  end

  def add(board, guess) do
    %{board | guesses: [guess | board.guesses]}
  end

  defp lost?(board) when length(board.guesses) > 7 do
    true
  end
  defp lost?(_), do: false

  defp won?(%{guesses: [head | _rest], answer: head}), do: true
  defp won?(_), do: false

  # i just like this one
  # defp playing?(board) do
  #   !lost?(board) && !won?(board)
  # end


  @doc """
  1 2 3 4 | rrw
  1 2 3 5 | rw
  1 2 3 6 | rww
  5 6 7 8 |

  guess again! | you've won! | sorry, you've lost!
  """
  def render(board) do
    rendered_board =
      Enum.map(board.guesses, fn guess -> render_row(board.answer, guess) end)
      |> Enum.join("\n")

    rendered_game_state = rendered_game_state(board)

    rendered_board <> "\n\n" <> "#{rendered_game_state}\n"
  end

  def rendered_game_state(board) do
    cond do
      won?(board) -> "you've won!"
      lost?(board) -> "sorry, you've lost!"
      true -> "guess again!"
    end
  end

  # public for testing
  def render_row(_answer, guess) do
    # score function
    score =
      "rrw"
      # Score.new(answer, guess)
      # |> Score.render
    formatted_guess =
      Enum.join(guess, " ")

    "#{formatted_guess} | #{score}"
  end

end






# defmodule Puzzler.Server do

#   alias Puzzler.Game
#   use GenServer

#   @impl true
#   def init(answer) do
#     {:ok, Puzzler.Game.new(answer)}
#   end

#   @impl true
#   def handle_call(:add_guess, _from, board) do
#     board = Puzzler.Game.add(board, guess)
#     {:reply, show_guess(), board}
#   end

# end
