defmodule Prime do
  def nth(n) do
    Stream.iterate(2, &next_prime/1)
    |> Enum.take(n)
    |> List.last
  end

  def next_prime(n) do
    num = n + 1
    if is_prime(num) == [1] do
      num
    else
      next_prime(num)
    end
  end

  def is_prime(num) do
    require Integer
    if Integer.is_odd(num) do
      sqrt = Kernel.round(Float.ceil(:math.sqrt(num)))
      Enum.to_list(1..sqrt)
      |> Enum.filter(&(rem(num,&1) == 0))
    else
      false
    end
  end

  def nth_compression(n) do
    for x <- span(2,n), is_prime(x) == [1] || x == 2,  do: x
  end

  def span(from, to) when from > to, do: []
  def span(from, to),
    do: [from | span(from+1, to)]
end
