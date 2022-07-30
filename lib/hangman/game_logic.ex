defmodule Hangman.GameLogic do
  @moduledoc """
  Logic Hangman game
  """

  @doc """
  Main logic game
  """
  def guess(letter, state) do
    %{word: word, matches: matches, misses: misses, limit: limit} = state

    if String.contains?(word, letter) do
      matches = [letter | matches]
      completed? = word |> String.codepoints() |> Enum.all?(&(&1 in matches))
      %{state | matches: matches, completed?: completed?}
    else
      %{state | misses: [letter | misses], limit: limit - 1}
    end
  end
end
