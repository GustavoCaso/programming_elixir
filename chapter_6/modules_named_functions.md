## Modules and Names Functions

Once a program growss beyond a couple of lines, you'll want to structure it.

*Elixir* makes it easy by using *named functions* and organizing them into *Modules*. In *elixir* named functions must be written inside a module.

```elixir
defmodule Times do
  def doouble(n) do
    n * 2
  end
end

Times.double(2) # 4
```

## Functions Calls and Pattern Matching

In previous chapters we covered how anonymouus functios use pattern matching.

The difference between named functions, is that we write the function multiple times, each times with it's own parameters.

```elixir
defmodule Factorial do
  def of(0) do
    1
  end

  def of(n) do
     n * of(n-1)
  end
end
```

One point worth stressing: the order of these clauses can make a difference when you translate them into code. Elixir tries functions from the top down, executing the first match. So the following code will not work:

```elixir
defmodule Factorial do
  def of(n) do
     n * of(n-1)
  end

  def of(0) do
    1
  end
end
```

## Guard Clauses

We've seen what pattern matching allows *Elixir* to decide which function to invoke based on the arguments passed. But what if we need to distinguish based on their types. For this we use *guard clauses*

```elixir
defmodule Guard do
  def what_is(x) when is_number(x) do
    IO.puts "#{x} is a number"
  end        
  def what_is(x) when is_list(x) do
    IO.puts "#{inspect(x)} is a list"
  end        
  def what_is(x) when is_atom(x) do
    IO.puts "#{x} is an atom"
  end        
end  
```

## Default Parameters

When defining a function you can give a default value to any of its parameters by using the syntax `param \\ value`.
When you call a function that is defined with default parameters, *Elixir* compares the number of arguments you are passing with the number of required parameters for the function.

```elixir
defmodule Example do
  def func(p1, p2 \\ 2, p3 \\ 3, p4) do
    IO.inspect [p1, p2, p3, p4]
  end        
end     
     
Example.func("a", "b")             # => ["a",2,3,"b"]
Example.func("a", "b", "c")        # => ["a","b",3,"c"]
Example.func("a", "b", "c", "d")   # => ["a","b","c","d"]

```

There is one thing with default values:

```elixir
defmodule DefaultParams1 do
  def func(p1, p2 \\ 123) do
    IO.inspect [p1, p2]
  end        
  def func(p1, 99) do
    IO.puts "you said 99"
  end        
end  
```

If you compile, you will get an error.

```
** (CompileError) default_params1.exs.exs:8: def func/2 has default
                  values and multiple clauses, define a function head
                  with the defaults

```

The intent is to reduce the confusion that can arise with defaults. Simply add a function head with no body that contains the default parameters, and use regular parameters for the rest. The defaults will apply to all calls to the functions.

```elixir
defmodule Params do
  def func(p1, p2 \\ 123)

  def func(p1, p2) when is_list(p1) do
    "You said #{p2} witha list"
  end

  def func(p1, p2) do
    "You passed in #{p1} and #{p2}"
  end
end

Params.func(99)  # You passed in 99 and 123

Params.func(99, "cat")  # You passed in 99 and cat

Params.func([99])  # You sid 123 with a list

```

## Private Functions

The `defp` defines a private function one that can be called only with in the module that declares it.

## |> The Amazing Pipe Operator

The `|>` operator takes the result of the expression to its left and inserts is as the first parameter of the function invocation to its right.

```elixir
list
|> sales_taxes(2013)
|> prepare_filling
```

Is the same as `prepare(sales_tax(list, 2013))`

Note that using `|>` and the function shortcut `&` you need to use parenthesis.


