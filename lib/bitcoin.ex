defmodule Bitcoin do
  @moduledoc """
  Documentation for Bitcoin.
  """

  def wait_indef() do
    receive do
      :hello -> nil
    after
      200_000 ->
        {:ok}
    end
  end

  def wait_indef2() do
    receive do
      :hello -> nil
    after
      60_000 ->
        {:ok}
    end
  end

  def wait_indef3() do
    receive do
      :hello -> nil
    after
      30_000 ->
        :ok
    end
  end

  def keep_requesting(_pid, num, _list, _x) when num == 0 do
    nil
  end

  def keep_requesting(pid, num, list, x) do
    {_, req_pid, _, _} = Enum.random(list)
    GenServer.cast(pid, {:request_bitcoin, req_pid, :rand.uniform(x)})

    keep_requesting(pid, num - 1, list, x)
  end

  def send_someone(pid, num, list, x) do
    {_, req_pid, _, _} = Enum.random(list)
    GenServer.cast(req_pid, {:request_bitcoin, pid, :rand.uniform(x)})
    keep_requesting(pid, num - 1, list, x)
  end

  def start_node_mining(spec_list, _m_pid) when spec_list == [] do
    nil
  end

  def start_node_mining(spec_list, m_pid) do
    [{_, pid, _, _} | rest] = spec_list
    GenServer.cast(pid, {:start_mining, m_pid})
    start_node_mining(rest, m_pid)
  end

  def inin() do
    {_, mint_pid} = MintProcessor.MintSupervisor.start_child()
    User.BitcoinSupervisor.start_child(10, mint_pid, 10, %{})
    spec_list = DynamicSupervisor.which_children(:user_super)

    start_node_mining(spec_list, mint_pid)
    spawn(Bitcoin, :runner, [spec_list, mint_pid])



  end

  def runner(spec_list,mint_pid) do
    wait_indef()
    child_pid = User.BitcoinSupervisor.add_new_node(mint_pid)
    IO.puts "started requesting"
    keep_requesting(child_pid, 10, spec_list, 100)
    wait_indef2()
    #IO.puts "started requesting2"
    #keep_requesting(child_pid, 20, spec_list, 100)
    #wait_indef2()
    #IO.puts "started requesting3"
    #keep_requesting(child_pid, 20, spec_list, 100)
    #wait_indef2()
    #IO.puts "started requesting4"
    #keep_requesting(child_pid, 25, spec_list, 100)
    IO.puts("sending someone")
    send_someone(child_pid, 3, spec_list, 100)
    
  end
  
end
