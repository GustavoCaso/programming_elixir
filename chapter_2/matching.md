##Assigments

### Is not what it looks like

At first site if you look up this code `a = 1` you will think in *Assigment*.

But in *Elixir* is not the case, in *Elixir* the `=` symbol is call a **match** operator. It works as an assertion. So it will look for a way for making the left hand side equal to the right-hand side.

```elixir
a = 1
```
In the above example *Elixir* can make the match by binding the variable `a` to the value `1`. if we try:

```elixir
2 = a

** (MatchError) no match of right hand side value: 1
```

### More Complex Matches

```elixir
list = [1,2,3]

[a,b,c] = list

# a = 1
# b = 2
# c = 3
```

In the above *Elixir* looks for a way to make the value of the left hand side the same as on the right hand side.

*Elixir* call this process `Pattern Matching`. A pattern (the left side) is matched if the values (the right side) have the same structure and if term in the pattern can be matched to the corresponding term in the values.

```elixir
list = [1,2,3]

[a,1,c] = list

** (MatchError) no match of right hand side value: [1,2,3]
```

### Ignoring a value with _

If we didn't need to capture a value during a match, we could use the special variable `_`, is like a wildcard, `It will accept any vaue here`

```elixir
[1,_,_] = [1, "cat", "dog"] # Will Match
```

### Variables Bind Once (per Match)

Once a variable has been bound to a value in the matching process, it keeps that value for the remainder of the match.

```elixir
[a,a] = [1,1]
# will give a match

[a,a] = [1,2]
# will not because a has been match to 1, the next matching will fail 1 = 2
```

However, a variable can be bound to a new value in a subsequent match, and its current value does not participate in the new match.

