defmodule ScoreTest do
  use ExUnit.Case

  describe "Score.new" do
    test "returns 0 white and 0 red if no matching guesses" do
      solution = [1, 2, 3, 4]
      guess = [5, 6, 7, 8]

      assert Puzzler.Score.new(solution, guess) == %Puzzler.Score{reds: 0, whites: 0}
    end

    test "returns white if guess is in solution but in wrong column" do
      solution = [1, 2, 3, 4]
      guess = [5, 1, 7, 8]

      assert Puzzler.Score.new(solution, guess) == %Puzzler.Score{reds: 0, whites: 1}
    end

    test "returns red if guess is in correct column in solution" do
      solution = [1, 2, 3, 4]
      guess = [5, 6, 7, 4]

      assert Puzzler.Score.new(solution, guess) == %Puzzler.Score{reds: 1, whites: 0}
    end
  end

  describe "Score.render" do
    test "returns an empty string if there are 0 white and 0 red matches" do
      score = %Puzzler.Score{reds: 0, whites: 0}

      assert Puzzler.Score.render(score) == ""
    end

    test "returns string with 'r' and 'w' corresponding to number of white and red matches" do
      score = %Puzzler.Score{reds: 2, whites: 2}

      assert Puzzler.Score.render(score) == "rrww"
    end
  end
end
