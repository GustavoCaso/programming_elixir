defmodule TokenSender do
  def run(token1, token2) do
    comunicate(token1)
    comunicate(token2)
  end

  def comunicate(token) do
    p = spawn(TokenSender, :reply, [self])
    send p, token
    await
  end

  def await do
    receive do
      message -> IO.puts message
    end
  end

  def reply(pid) do
    receive do
      message -> send pid, "This is the message #{message}"
    end
  end
end
