defmodule MyEnum do
  def all?([], _func), do: true
  def all?([head|tail], func) do
    if func.(head) do
      all?(tail, func)
    else
      false
    end
  end

  def each([], _func), do: []
  def each([head|tail], func) do
    [func.(head)| each(tail, func)]
  end

  def filter([head|tail], func), do: _filter([head|tail], func, [])
  defp _filter([], _func, acc), do: acc
  defp _filter([head|tail], func, acc) do
    if func.(head) do
      acc = acc ++ [head]
    end
    _filter(tail, func, acc)
  end
end
