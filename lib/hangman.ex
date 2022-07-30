defmodule Hangman do
  @moduledoc """
  The famous Hangman game
  """

  alias Hangman.GameLogic
  alias Hangman.View
  alias Hangman.State

  @doc """
  Starts the game
  """
  def start_game do
    word = "hangman"

    word
    |> State.new()
    |> View.format_response()
  end

  @doc """
  Lets the user to take a guess
  """
  def take_a_guess(letter, %State{limit: limit, completed?: false} = state) when limit > 0 do
    letter
    |> String.downcase()
    |> GameLogic.guess(state)
    |> View.format_response()
  end

  def take_a_guess(_letter, state), do: View.format_response(state)

  ## Helpers
end
