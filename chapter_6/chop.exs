defmodule Chop do
  def is_it?(n, _min, _max, guess) when guess == n do
    IO.puts n
  end

  def is_it?(n, min, _max, guess) when guess > n do
    guess(n, min..guess-1)
  end

  def is_it?(n, _min, max, guess) when guess < n do
    guess(n, guess+1..max)
  end

  def guess(actual, range) do
    (min..max = range)
    guess = div((max - min), 2) + min
    IO.puts "Is it #{guess}"
    is_it?(actual, min, max, guess)
  end
end
