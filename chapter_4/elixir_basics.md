## Elixir Built-in Types

- Values types:
  - Aribitrary-sized integers
  - Floating-point numbers
  - Atoms
  - Ranges
  - Regular Expressions

- System types:
  - PIDs and ports
  - References

- Collection types:
  - Tuples
  - Lists
  - Maps
  - Binaries

###Integres

Can be written as decimals (1234), hexadecimal (0xcafe), octal (0o765), and binary (0b1010).

They can contain underscore, ofetn to separate groups of three digits.

There is no fixed limit on the size of integres.

###Floating-point numbers

Are written using a decimal point. There must be at least one digit before and after the decimal point.

These are valid floating-points.

```
1.0  0.2456   0.3134567e1   345678.0e-5
```

###Atoms

Atoms are constants. We write them using a leading colon `:`, whicj¡h can be followed by atom word or an *Elixir* operator.

```elixir
:fred  :is_binary?  :var@2   :<>  :===
```

Two atoms with the same name will always compare as being equal, even if they were created in different computers.

###Ranges

Ranges are represented `start..end`, where `start` and `end` can be values of any type.
But if you want to iterate ob¡ver the vaues, the two extremes must be integers.

##Regular Expressions

*Elixir* has regular-expression literals, written as `~r{regexp}` or `~r{regexp}opts`.

For manipulating Regular expressions we use the `Regex` module.

```elixir
Regex.run ~r{[aeiou]}, "caterpillar"
# ["a"]
```

```elixir
Regex.sacn ~r{[aeiou]}, "caterpillar"
# [["a"],["e"],["i"],["a"]]
```

### PIDs and Ports

A PID is references to a local or remote process, and port is a reference t a resource (typical external to the application) that you'll be reading or writting.

### References

The function `make_ref` creates a globally unique refernce; no other references will be equal to it.

### Tuples

A tuple is an ordered collection of values.

You write it between braces, separating the elemnets with commas.

`{1,2}` `{:ok, 42}`  `{:error, :enoent}`

You can use tuples in pattern matching:

```elixir
{status, count, action} = {:ok, 42, "next"}
```


###Lists

`[1,2,3]` This might lead you to think are like arrys, but they are not (in fact, tuples are the closest Elixir gets to a conventional array). A list is a linked data .

Because of their implementation, lists are easy to traverse linearly, but they are expensive to access in random order. It always cheaper to get the `head` of a list and to extract the tail`

*Keyword lists*
Because we often need simple lists of key/value pairs, we can write it.

`[name: "Dave", city: "Barcelona"]`

Elixir converts it into a list of two-value tuples

`[{:name, "Dave"}, {:city, "Barcelona"}]`


###Maps
Is a collection of key/value pairs.
`%{ key => value, key => value}`

The keys can be strings, tuples, atoms etc.. Although typically all the keys in a map are the same type, that isn't required.

If the key is an atom, you can use the same shortcut you use with *keyowrd lists*

`colors = %{red: 0xff0000, green: 0x00ff00, blue: 0x0000ff}`

Maps allow only one entry for a particular key, whereas keyword lists allow the key to be repeated.

In general, use *keyword list* for command-line parameters and for passing around options, and use maps when you need an associative array.

#### Accessing a map

The square-bracket syntax works with all maps.

```elixir
states = %{ "AL" => "Alabama", "WI" => Wisconsin }

states["AL"] # "Alabama"

states["TX"] # nil
```

If the keys are `atoms` you can use the dot notation.

```elixir
colors = %{red: 0xff0000, green: 0x00ff00}

colors[:red] # 0xff0000

colors.red # 0xff0000
```
