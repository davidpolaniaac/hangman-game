defmodule Hangman.View do
  @moduledoc """
  View Hangman game
  """

  alias Hangman.State

  @doc """
  format response state
  """
  def format_response(%State{limit: limit, completed?: false} = state) when limit > 0 do
    {mask_word(state), state}
  end

  def format_response(%State{limit: limit, word: word} = state) when limit > 0 do
    {"You won, word was: #{word}", state}
  end

  def format_response(%State{word: word} = state) do
    {"Game Over, word was: #{word}", state}
  end

  defp mask_word(%State{matches: matches, mask: mask, word: word}) do
    if MapSet.size(matches) > 0 do
      matches = Enum.join(matches)
      String.replace(word, ~r/[^#{matches}]/, mask)
    else
      String.replace(word, ~r/./, mask)
    end
  end
end
