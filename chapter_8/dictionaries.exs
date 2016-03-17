people = [
  %{ name: "John", height: 1.99 },
  %{ name: "Snow", height: 2.99 },
  %{ name: "John", height: 1.60 },
  %{ name: "Stark", height: 1.40 }
]

for person = %{height: height} <- people, height <= 1.60,
  do: IO.inspect person

# %{name: "John", height: 1.60}
# %{name: "Stark", height: 1.40}

defmodule HotelRoom do
  def book(%{name: name, height: height}) when height > 1.9 do
    IO.puts "Need extra long bed"
  end

  def book(%{name: name, height: height}) when height <= 1.4 do
    IO.puts "Need low shower controls for #{name}"
  end

  def book(person) do
    IO.puts "Need regular bed for #{person.name}"
  end
end

people |> Enum.each(&HotelRoom.book/1)

# Structs

defmodule Attendee do
  defstruct name: "", paid: false, over_18: true

  def may_attend_after_party(attendee = %Attendee{}) do
    attendee.paid && attendee.over_18
  end

  def print_vip_badge(%Ateendee{name: name}) when name != "" do
    IO.puts "Very cheap badge for #{name}"
  end

  def print_vip_badge(%Attendee{}) do
    raise "missing name for badge"
  end
end


#Nested Dictionary

defmodule Customer do
  defstruct name: "", company: ""
end

defmodule BugReport do
  defstruct owner: %{}, details: "", severity: 1
end

report = %BugReport{owner:
          %Customer{name: "Dave", company: "Pragmatic"},
          detail: "broken"
        }

report.owner.company #=> "Pragmatic"

# upadting

report = %BugReport{report | owner: %Customer{ report.owner | company: "PragProg"} }

# Elixir allow us to use a very handy macro

put_in(report.owner.company, "PragProg")
update_in(report.owner.name, &("Mr. " <> $1))
