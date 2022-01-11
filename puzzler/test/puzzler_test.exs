defmodule PuzzlerTest do

  import Puzzler.Game.Board

  use ExUnit.Case

  test "greets the world" do
    assert new([1, 2, 3, 4]) ==
      %Puzzler.Game.Board{answer: [1, 2, 3, 4], guesses: []}
  end

  test "renders a row" do
    answer = [1, 2, 3, 4]
    guess = [1, 2, 3, 4]
    assert render_row(answer, guess) == "1 2 3 4 | rrw"
  end

  test "renders multiple incorrect guesses" do
    actual =
      [10, 11, 12, 13]
      |> new()
      |> add([1, 2, 3, 4])
      |> add([3, 4, 5, 6])
      |> render()

    assert actual ==
    """
    3 4 5 6 | rrw
    1 2 3 4 | rrw

    guess again!
    """
  end

  test "renders a winning game.Board" do
    rendered_board =
      new([3, 4, 5, 6])
      |> add([1, 2, 3, 4])
      |> add([3, 4, 5, 6])
      |> render()

    assert rendered_board ==
    """
    3 4 5 6 | rrw
    1 2 3 4 | rrw

    you've won!
    """
  end

  test "renders a losing game.Board" do

    rendered_board =
      new([3, 4, 5, 6])
      |> add([1, 2, 3, 4])
      |> assert_key(:answer, [3, 4, 5, 6])
      |> assert_key(:guesses, [[1, 2, 3, 4]])
      |> add([1, 2, 3, 4])
      |> assert_key(:guesses, [[1, 2, 3, 4], [1, 2, 3, 4]])
      |> add([1, 2, 3, 4])
      |> add([1, 2, 3, 4])
      |> add([1, 2, 3, 4])
      |> add([1, 2, 3, 4])
      |> add([1, 2, 3, 4])
      |> add([1, 2, 3, 4])
      |> add([1, 2, 3, 4])
      |> add([1, 2, 3, 4])
      |> render()

    assert rendered_board ==
    """
    1 2 3 4 | rrw
    1 2 3 4 | rrw
    1 2 3 4 | rrw
    1 2 3 4 | rrw
    1 2 3 4 | rrw
    1 2 3 4 | rrw
    1 2 3 4 | rrw
    1 2 3 4 | rrw
    1 2 3 4 | rrw
    1 2 3 4 | rrw

    sorry, you've lost!
    """
  end


  test "renders a losing game, but now bruce is involved" do

    rendered_board =
      new([3, 4, 5, 6])
      |> add([1, 2, 3, 4])
      |> assert_key(:answer, [3, 4, 5, 6])
      |> assert_key(:guesses, [[1, 2, 3, 4]])
      |> add([1, 2, 3, 4])
      |> assert_key(:guesses, [[1, 2, 3, 4], [1, 2, 3, 4]])
      |> add([1, 2, 3, 4])
      |> add([1, 2, 3, 4])
      |> add([1, 2, 3, 4])
      |> add([1, 2, 3, 4])
      |> add([1, 2, 3, 4])
      |> add([1, 2, 3, 4])
      |> add([1, 2, 3, 4])
      |> add([1, 2, 3, 4])
      |> render()

    assert rendered_board ==
    """
    1 2 3 4 | rrw
    1 2 3 4 | rrw
    1 2 3 4 | rrw
    1 2 3 4 | rrw
    1 2 3 4 | rrw
    1 2 3 4 | rrw
    1 2 3 4 | rrw
    1 2 3 4 | rrw
    1 2 3 4 | rrw
    1 2 3 4 | rrw

    sorry, you've lost!
    """
  end

  test "losing board" do
    board = losing_board()
    assert render(board) =~ ~r/sorry/
  end

  def assert_key(board, key, expected) do
    actual = Map.get(board, key)
    assert actual == expected

    board
  end

  def losing_board() do
    Stream.repeatedly(fn -> [1, 2, 3, 4] end)
    |> Enum.take(10)
    |> Enum.reduce(new([3, 4, 5, 6]), &add(&2, &1))
  end

end
