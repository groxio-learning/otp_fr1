defmodule Puzzler.Score do
  defstruct [:reds, :whites]

  def new(correct_solution, guess) do
    red_count = count_reds(correct_solution, guess)

    %__MODULE__{
      reds: red_count,
      whites: count_whites(correct_solution, guess, red_count)
    }
  end

  def render(score) do
    score
    |> Enum.map(fn {color, color_count} ->
      case color do
        :reds -> String.duplicate("r", color_count)
        :whites -> String.duplicate("w", color_count)
      end
    end)
    |> Enum.join()
  end

  def count_reds(correct_solution, guess) do
    correct_solution
    |> Enum.zip(guess)
    |> Enum.filter(fn {correct, guess} -> correct == guess end)
    |> Enum.count()
  end

  def count_whites(correct_solution, guess, red_count) do
    miss_count = Enum.count(guess -- correct_solution)
    total_columns = Enum.count(correct_solution)
    total_columns - red_count - miss_count
  end
end
