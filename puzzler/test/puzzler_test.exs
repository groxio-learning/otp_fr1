defmodule PuzzlerTest do
  use ExUnit.Case
  doctest Puzzler

  test "greets the world" do
    assert Puzzler.Game.new([1, 2, 3, 4]) ==
      %{answer: [1, 2, 3, 4], guesses: []}
  end

  test "renders a row" do
    answer = [1, 2, 3, 4]
    guess = [1, 2, 3, 4]
    assert Puzzler.Game.render_row(answer, guess) == "1 2 3 4 | rrw"
  end

  test "renders multiple incorrect guesses" do
    answer = [10, 11, 12, 13]
    board = Puzzler.Game.new(answer)
    board = Puzzler.Game.add(board, [1, 2, 3, 4])
    board = Puzzler.Game.add(board, [3, 4, 5, 6])

    rendered_board = Puzzler.Game.render(board)
    assert rendered_board ==
    """
    3 4 5 6 | rrw
    1 2 3 4 | rrw

    guess again!
    """
  end

  test "renders a winning game" do
    answer = [3, 4, 5, 6]
    board = Puzzler.Game.new(answer)
    board = Puzzler.Game.add(board, [1, 2, 3, 4])
    board = Puzzler.Game.add(board, [3, 4, 5, 6])

    rendered_board = Puzzler.Game.render(board)
    assert rendered_board ==
    """
    3 4 5 6 | rrw
    1 2 3 4 | rrw

    you've won!
    """
  end

  test "renders a losing game" do
    answer = [3, 4, 5, 6]
    board = Puzzler.Game.new(answer)
    board = Puzzler.Game.add(board, [1, 2, 3, 4])
    board = Puzzler.Game.add(board, [1, 2, 3, 4])
    board = Puzzler.Game.add(board, [1, 2, 3, 4])
    board = Puzzler.Game.add(board, [1, 2, 3, 4])
    board = Puzzler.Game.add(board, [1, 2, 3, 4])
    board = Puzzler.Game.add(board, [1, 2, 3, 4])
    board = Puzzler.Game.add(board, [1, 2, 3, 4])
    board = Puzzler.Game.add(board, [1, 2, 3, 4])

    rendered_board = Puzzler.Game.render(board)
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

    sorry, you've lost!
    """
  end
end
