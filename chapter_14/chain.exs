defmodule Chain do
  def counter(next_pid) do
    receive do
       n -> send next_pid, n + 1
    end
  end

  @doc """
    We pass the number of processes we want to create,
    in the reduce function the spawn return the PID, that became the acc
    or in this case `send_to`, passing the pid as the argument to `counter`.

    The return value from the reduce is the last PID which will be send to with
    the initial value of 0
  """

  def create_processes(n) do
    last = Enum.reduce 1..n, self,
            fn (_, send_to) ->
              spawn(Chain, :counter, [send_to])
            end
    send last, 0

    receive do
      final_answer when is_integer(final_answer) -> "Result is #{inspect(final_answer)}"
    end
  end

  def run(n) do
    IO.puts inspect :timer.tc(Chain, :create_processes, [n])
  end
end
