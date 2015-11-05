##Lists in Eixir

*Before getting into material a quick reminder*
```
------------------------------------------------------------
| to get the numeric representation of a letter we use the |
| ? symbol before the letter.                              |
------------------------------------------------------------
```

Working with Elixir usually involve orking with list, they are the main point in the
Elixir language.
Usually working with them we use for multiple functionality.
There is a common technique to work with the first element of the list, and leave the rest or the tail.

We can represent the head and the tail with the pipe operator.

`[3 | []] => [3]`

**We can use pattern matching for assigning to multiple variables**

```elixir
[a,b,c] = [1,2,3]

a => 1
b => 2
c => 3
```

**Getting the head and the tail from a list**

```elixir
[head | tail] = [1,2,3]

head => 1
tail => [2,3]
```

Usually we will use the head and the tail for processing the list recursevly.
We can use this technique for calculating the length of a list

```elixir
defmodule MyList do
  def len([]), do: 0
  def len([head|tail]), do: 1 + len(tail)
end
```

We can even create a function that will square all the elements from our list

```elixir
defmodule MyList do
  def square([]), do: []
  def square[head|tail], do: [head*head square(tail)]
end

Mylist.square([4,5,6]) => [16, 25, 36]
```

####Creating a Map function
We can pass functions as arguments, and use for our advantage

```elixir
defmodule MyList do
  def map([], _fun), do: []
  def map([head, tail], fun), do: [fun.(head) | square(tail, fun)]
end

MyList.map [1,2,3,4], fn (n) -> n*n end => [1,4,9,16]
# Or using the shortcut notation
# MyList.map [1,2,3,4], &(&1*&1)
```

####Keeping track of values during recursion

We will need an extra argument for keeping track of the actual value, when dealing with recursion

```elixir
defmodule MyList do
  def sum([], total), do: total
  def sum([head|tail], total), do: sum(tail, head+total)
end

MyList.sum [1,2,3,4,5,6], 0 => 21
```

Having to remenber to pass the extra 0 is a little tacky, so we could write our sum function this way instead

```elixir
defmodule MyList do
  def sum(list), do: _sum(list, 0)
  defp _sum([], total), do: total
  defp _sum([head|tail], total), do: _sum(tail, head+total)
end
```
**We use de `defp`** is the way of defining a private function in elixir, we won't be able to call this functions outside the module

Not all the operation can be solve manipulating one by one the elements of the list, Thank we have the join operator `|`

`[1,2,3,4 | [5,6,7,8]] => [1,2,3,4,5,6,7,8]`

The same happens with patterns you can match multiple elements as the head

```elixir
defmodule Swapper do
  def swap([]), do: []
  def swap([a,b | tail]), do: [b, a | swap(tail)]
  def swap(_), do: raise "Can't swap list with an odd number of elements"
end

Swapper.swap [1,2,3,4,5,6] => [2,1,4,3,6,5]
```

**Elixir allow us to pattern match inside pattern matching**, what does this mean well you can create a pattern, inside the pattern matching like this:

```elixir
def get_first_values([]), do: []
def get_first_values([head = [1,2,3,_] | tail]) do
  [head | first_values(tail)]
end
```

For me it will take some time to grab this concept to my mind, but trying is best way for learnig.

**List Module**

The List module provides with a set of functions to operate on lists

`[1,2,3] ++ [4,5,6] => [1,2,3,4,5,6]`

`List.flatten([[[1], 2], [[[3]]]]) => [1,2,3]`

*Folding but you can choose direction*

`List.foldl([1,2,3], "", fn values, acc -> "#{value}(#{acc})" end) => "3(2(1()))"`

`List.foldlr([1,2,3], "", fn values, acc -> "#{value}(#{acc})" end) => "1(2(3()))"`

*Merging list and splitting*

```elixir
1 = List.zip([1,2,3], [:a, :b, :c], ["cat", "dog"])
[{1,:a,"cat"}, {2, :b, "dog"}]

List.unzip(1)
[[1,2],[:a, :b],["cat", "dog"]]
```

*Accessing tuple*
`keyfind(tuple, key, position, deafult\\nil)`

```elixir
kw = [{:name, "Dave"}, {:likes, "Programming"}, {:where, "Dallas", "TX"}]

List.keyfind(kw, "Dallas", 1) => {:where, "Dallas", "TX"}
List.keyfind(kw, "TX", 2) => {:where, "Dallas", "TX"}
List.keyfind(kw, "TX", 1) => nil
List.keyfind(kw, "TX", 1, "No match") => "No match"

```



