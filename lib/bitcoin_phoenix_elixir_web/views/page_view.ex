defmodule BitcoinPhoenixElixirWeb.PageView do
  use BitcoinPhoenixElixirWeb, :view



  def get_block_number(block) do
    Map.get(block, :block_number)  
  end

  def get_transaction_count(block) do
    block |> Map.get(:transactions) |> length()
  end

  def get_timestamp(block) do
    {{y,m,d},{hh,mm,ss}} = block |> Map.get(:block_header) |> Map.get(:timestamp) |> :calendar.gregorian_seconds_to_datetime()
    y =  Integer.to_string(y)
    m =  Integer.to_string(m)
    d =  Integer.to_string(d)
    hh =  Integer.to_string(hh)
    mm =  Integer.to_string(mm)
    ss =  Integer.to_string(ss)
    y <> "-" <> m <> "-" <> d <> ";" <> hh <> ":" <> mm <> ":" <> ss  
  end

  def get_nonce(block) do
    block |> Map.get(:block_header) |> Map.get(:nonce) 
    
  end
  
  def get_block_reward(block) do
    block |> Map.get(:transactions) |> hd() |> Map.get(:transaction_output) |> Map.get(:amount)
  end

  def get_block_hash(block) do
    block |> Map.get(:block_header) |> Map.get(:block_hash) |> Base.encode16() 
  end

  def get_prev_block_hash(block) do
    block |> Map.get(:block_header) |> Map.get(:previous_block_hash) |> Base.encode16()
  end

  def get_merkle_root(block) do
    block |> Map.get(:block_header) |> Map.get(:merkle_root) |> Base.encode16() 
  end

  def get_transactions_html_string(transactions) when transactions == [] do
    ""
  end

  def get_transactions_html_string(transactions) do
    [head | tail] = transactions
    "<tr> <td> " <> Base.encode16(head.txid) <> "</td> </tr>" <> get_transactions_html_string(tail)

  end

  def get_transactions_html_string_from_block(block) do
    string = get_transactions_html_string(block.transactions)
    IO.puts string
    string
  end

end
