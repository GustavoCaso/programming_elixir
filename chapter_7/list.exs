defmodule MyList do
  def sum([]), do: 0
  def sum([ head | tail ]), do: head + sum(tail)

  def mapsum(list, func),  do: _mapsum(list, func, 0)
  defp _mapsum([], _func, total), do: total
  defp _mapsum([ head | tail ], func, total) do
    _mapsum(tail, func, func.(head) + total)
  end

  def max([x]), do: x
  def max([ head | tail ]), do: Kernel.max(head , max(tail))


  def caesar([], _n), do: []
  def caesar([head | tail], n) when head + n >= ?z,
    do: [head+n-26 | caesar(tail, n)]

  def caesar([ head | tail ], n),
      do: [ head+n | caesar(tail, n) ]

  def span2(from, to), do: Enum.to_list(from..to)
  def span(from, to) when from > to, do: []
  def span(from, to),
    do: [from | span(from+1, to)]
end
