defmodule Postgrex.Debug do
  def debug(msg) do
#    File.write("/home/solomon/postgrex_debug.log", msg, [:append])
    File.write("/Users/takahashimasaki/tmp2/log/debug/postgrex_debug.log", msg <> "\n", [:append])
  end
end
