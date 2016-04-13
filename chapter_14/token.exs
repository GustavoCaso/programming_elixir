defmodule TokenSender do
  def run(token1, token2) do
   pid1 = spawn(TokenSender, :reply, [])
   pid2 = spawn(TokenSender, :reply, [])
   send pid1, { self, token1 }
   send pid2, { self, token2 }
   await
  end

  def await do
    receive do
      message -> IO.puts message
    end
    await
  end

  def reply do
    receive do
      {pid, message} -> send pid, "This is the message #{message}"
    end
  end
end
