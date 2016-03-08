prefix = fn (string) ->
  fn (string_2) ->
    "#{string} #{string_2}"
  end
end

IO.puts prefix.("Elixir").("Rocks")
