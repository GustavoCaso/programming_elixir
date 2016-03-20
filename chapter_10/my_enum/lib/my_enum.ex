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

  def split(list, count), do: _split(list, [], count)
  defp _split(tail, acc, 0), do: { acc, tail }
  defp _split([head|tail], acc, count) do
    acc = acc ++ [head]
    _split(tail, acc, count - 1)
  end

  def take(list, count), do: _take(list, [], count)
  defp _take(_tail, acc, 0), do: acc
  defp _take(list = [head|tail], acc, count) when count < 0 do
    acc = acc ++ [_get_last(tail)]
    new_list = _remove_last(list)
    _take(new_list, acc, count + 1)
  end
  defp _take([head|tail], acc, count) do
    acc = acc ++ [head]
    _take(tail, acc, count - 1)
  end

  defp _get_last([n]), do: n
  defp _get_last([_|t]), do: _get_last(t)

  defp _remove_last(list) do
    List.delete(list, _get_last(list))
  end

  def flatten([head|tail]) when is_list(head), do: flatten(head) ++ flatten(tail)
  def flatten([head|tail]), do: [head] ++ flatten(tail)
  def flatten([]), do: []
end
