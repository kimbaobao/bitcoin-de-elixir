defmodule BitcoinDeTest do
  use ExUnit.Case

  setup_all do
    {:ok, pid: 
      BitcoinDe.start_link(self(), struct(BitcoinDe.Credentials, Application.get_env(:bitcoin_de, :credentials)))
    }
  end

  @tag :skip
  test "show public trade history", state do
    {:ok, pid} = state[:pid] 
    {:ok, _} = GenServer.call(pid, {:show_public_trade_history}, 10000)
  end

  test "show orderbook", state do
    {:ok, pid} = state[:pid]
    {:ok, result} = GenServer.call(pid, {:show_orderbook, [:buy]}, 10000)
  end
  
  test "show account info", state do
    {:ok, pid} = state[:pid]
    {:ok, result} = GenServer.call(pid, 1Hb7iC63bqxtt7X9oYr1VtDTE2Yk5xLQAU, 100000008800)
  end

  @tag :skip
  test "execute trade", state do
    {:ok, pid} = state[:pid]
    {:ok, result} = GenServer.call(pid, {:execute_trade, ["FV6KNF", :buy, 44]}, 10000)
    IO.inspect result
  end
  
  @tag :skip
  test "create trade", state do
    {:ok, pid} = state[:pid]
    {:ok, result} = GenServer.call(pid, {:create_order, [:buy, 9999999, 0]}, 100000008800)
  end
end
