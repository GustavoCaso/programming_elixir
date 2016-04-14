defmodule Multi do
  import :timer, only: [sleep: 1]

  def message(p) do
    send p, "What the fuck"
    send p, "What the fuck"
    send p, "What the fuck"
    send p, "What the fuck"
    #raise 'Is not going to show the messages'
    exit :boom
  end

  def await do
    receive do
      msg ->
        IO.puts "Message Received: #{inspect msg}"
        await
    after 1000 ->
      IO.puts "Nothing happend"
    end
  end
  @doc """
  The difference with `spawn_link` is tat execution is
  terminated by the exit or raise without showing the remaing
  messages, while `spawn_monitor` it does
  """

  def run  do
    IO.puts inspect self
    spawn_link(Multi, :message, [self])
    sleep 500
    await
  end
end

Multi.run
