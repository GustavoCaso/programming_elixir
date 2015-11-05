###Dictionaries: Maps, HashDicts, Keywords, Sets and Structs

A dictionary is a data type that associates keys with values.

How to use the appropriate dictionary for a particulat need?

*Keyword* If you are going to have same key
*Keyword* If you want to garantee ordered elements
*Map* If you want to do pattern matching againts the content
*HashDict* If you are going to store hundreds of entries

**Maps** and **hashdicts** implement the Dict behaviour, the **keyword** too but with some differences.
Usually you want to access **Dict** module methods to access this functionality, this allow tyou to change the implementation between a map and a hashdict

####Example
```elixir
defmodule Sum do
  def values(dict) do
    dict |> Dict.values |> Enum.sum
  end
end

hd = [one: 1, two: 2, thre: 3] |> Enum.into HashDict.new
IO.puts Sum.values(dict) => 6

map = %{ four: 4, five: 5, six: 6}
IO.puts Sum.values(map) => 15
```

Here are some methods of the `Dict` API:
`Dict.drop(dict, keys)`
`Dict.merge(dict, dict)`

We said the **keywords** can have multiple keys with the same name, but we have to use the **Keyword** module to access them.

```elixir
kw_list = [name: "Dave", likes: "Programming", likes: "Elixir"]
kw_list[:likes] => "Programming"
Dict.get(kw_list, :likes) => Programming
Keyword.get_values(kw_list, :likes) => ["Programming", "Elixir"]
```

####Pattern Matching and Upadting Maps

The question we ask the most is thoes our map have the following keys?

How we do that:

```elixir
person = %{name: "Dave", height: 1.99}

%{name: a_name} = person
a_name = "Dave"

%{name: _, height: _} = person

%{name: "Dave"} = person

%{name: _, weight: _} = person => (MatchError)
```

More example in the `exs` file.

While pattern matching maps do not allow to bind a value to a key during pattern matching

```elixir
%{ item => :ok } = %{ 1 => :ok, 2 => :error } #=> (CompileError)
```

####Upadting a Map

We can add and update existing entries without traversing the whole structure. But as all values in Elixir map is inmutable, so the result of the update is a new map

`new_map = %{ old_map | key => value, … }`

```elixir
m = %{a: 1, b: 2, c: 3}
m1 = %{ m | b: "two, c: "three" } #=> %{a: 1, b: "two", c: "three"}
```

To add a new key to the map you will have to use the syntax
`Dict.put_new/3`


####Struct

**Struct** are like maps but with fixed keys, they are created inside a module with `defstruct` and the name of the struct is the name of the module, they can have default values for their keys.

```elixir
defmodule Subscriber do
  defstruct name: "", paid: false, over_18: true
end

s1 = %Subcriber{} #=> %Subscriber{name: "", paid: false, over_18: true}
```

You can access the struct using the dot notation.

`s1.name #=> ""`

You can update the same way as with maps

`s2 = %Subcriber{s1 | name: "Cera"}`

Struct are wrapped in a module to add struct-specific behaviour, see `exs` file.
In the previous example we access the struct with the dot notation, but map you can access with the bracket notation `[]`
Thats because maps implement the *Access protocol* and struct do not
However you can easily add this to **Structs**

```elixir
defmodule Ateendee do
  @derive Access
  defstruct name: "", over_18: true
end
```

####Nested Dictionary Structures

The various dictionaries types let us associate keys with values, but those values can be themselves dictionaries
see `exs` file for examples.

There are a lot of information about `get_in`, `update_in`, `put_in`, `get_and_update_in`, they are macros and they have their limitaions but, if you pass the keys as a separate argument, they will transform into function they become dynamic
[get_in](http://elixir-lang.org/docs/stable/elixir/Kernel.html#get_in/2), [put_in](http://elixir-lang.org/docs/stable/elixir/Kernel.html#put_in/3), [update_in](http://elixir-lang.org/docs/stable/elixir/Kernel.html#update_in/2), [get_and_update_in](http://elixir-lang.org/docs/stable/elixir/Kernel.html#get_and_update_in/3)
