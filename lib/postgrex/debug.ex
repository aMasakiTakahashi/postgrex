defmodule Postgrex.Debug do
  def debug(msg) do
    path = System.get_env("POSTGREX_DEBUG_LOG_PATH") || "/home/solomon/postgrex_debug.log"
    File.write(path, msg <> "\n", [:append])
  end
end
