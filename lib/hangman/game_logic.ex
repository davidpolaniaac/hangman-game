defmodule Hangman.GameLogic do
  @moduledoc """
  Logic Hangman game
  """

  alias Hangman.State

  @doc """
  Main logic game
  """
  def guess(letter, %State{} = state) do
    %{goal: goal, matches: matches, misses: misses, limit: limit} = state

    if MapSet.member?(goal, letter) do
      matches = MapSet.put(matches, letter)
      completed? = MapSet.equal?(goal, matches)
      %{state | matches: matches, completed?: completed?}
    else
      %{state | misses: MapSet.put(misses, letter), limit: limit - 1}
    end
  end
end
