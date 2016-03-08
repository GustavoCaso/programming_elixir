## Anonymous Functions

An anonymous functions is creted using the `fn` keyword.

```elixir
fn
  parameter-list -> body
  parameter-list -> body
end
```
This code will return a function, which also we can invoke.

Or in one line.

```elixir
sum = fn(a,b) -> a+b end

sum.(2,3) # 5
```

To invoke we use the dot, and pass the arguments if it needs them, even without parameters we need to use the parenthesis.

## Functions and Pattern Matching

Remenber that in *Elixir* there is no thing call assigment, so it is easy to think that in the example above with the `sum` function, we have assign the first value to `a` and the second to `b`. But it tries to match the values to patterns.

This means we can *Elixir* with more complex pattern matching.

```elixir
swap = fn({a,b}) -> {b,a} end

swap.({2,3}) # {3,2}
```

## One Function, Multiple Bodies

A single function definition lets you define different implementation, depending on the type and contents of the arguments.

At its simplest, we can use pattern matching to select which clause to run.

```elixir
handle_open = fn
  {:ok, file} -> "First line: #{IO.read(file, :line)}"
  {_, error} -> "Error: #{:file.format_error(error)}"
end

IO.puts handle_open.(File.open('./anonymous_functions.md'))

IO.puts handle_open.(File.open('non_existent'))
```

## Functions can Return Functions

```elixir
fun1 = fn ->
  fn ->
    "Hello"
  end
end
```

At first is a little strange but what is actually happening is that the initial function is returning a function, as the result of invoking it the first time.

So we could execute the code:
`fun1.().()  # "Hello"`

We normally wouldn't do that, we could bind the result of the first invoke to a variable, and then invoke that returned function.

```elixir
other = fun1.()

other.() # "Hello"
```

### Functions remenber Their Original Enviroment

While returning the a function from another function, the inner function remenbre the parameter passed to the first function.

This is possible because in *Elixir* function carry with them the binding of the variables in the scope in which they are defined.

```elixir
add_n = fn n -> (fn other -> n + other end) end

add_two = add_n.(2)

add_twoo.(5) # 7
```

## Passing Functions As Arguments

Functions are just values, so you can pass them to other functions.

```elixir
times_2 = fn n -> n * 2 end

apply = fn (fun, value) -> fun.(value) end

apply.(times_2, 6)
# 12           

```

In this example, `apply` is a function that takes a second function and a value. It return the result of invoking that second function with the values as an argument.

#### The & Notation

The strategy of creating short helper function is so common that *Elixir* provides a shortcut.

The `&` operator converts the expression that follows into a function. Inside that expresion the placeholders `&1`, `&2` and so on correspond to the first, second and subsequent parameters of the function.

```elixir
&(&1 + &2) # fn(a,b) -> a+b end
```
