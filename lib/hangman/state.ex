defmodule Hangman.State do
  def new(word) do
    word = String.downcase(word)
    %{word: word, misses: [], matches: [], limit: 5, mask: "_", completed?: false}
  end
end
