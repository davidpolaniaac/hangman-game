{word, state} = Hangman.start_game()

Enum.reduce(["h", "a", "n", "g", "m"], state, fn letter, state ->
  {word, state} = Hangman.take_a_guess(letter, state)
  IO.inspect(word)
  state
end)

IO.puts("\nLets start a new game...\n")

{word, state} = Hangman.start_game()

Enum.reduce(["z", "q", "r", "i", "w"], state, fn letter, state ->
  {word, state} = Hangman.take_a_guess(letter, state)
  IO.inspect(word)
  state
end)
