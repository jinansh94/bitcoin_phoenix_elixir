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
    block |> Map.get(:block_header) |> Map.get(:block_hash) |> Base.encode16(case: :lower)
  end

  def get_prev_block_hash(block) do
    unless (block.block_header.previous_block_hash == nil) do
      block |> Map.get(:block_header) |> Map.get(:previous_block_hash) |> Base.encode16(case: :lower)
    else
      ""  
    end
    
  end

  def get_merkle_root(block) do
    block |> Map.get(:block_header) |> Map.get(:merkle_root) |> Base.encode16(case: :lower)
  end

  def get_transactions_html_string(transactions) when transactions == [] do
    ""
  end

  def get_transactions_html_string(transactions) do
    [head | tail] = transactions
    Base.encode16(head.txid)  <> get_transactions_html_string(tail)

  end

  def get_transactions_html_string_from_block(block) do
    string = get_transactions_html_string(block.transactions)
    IO.inspect string
  end

  def get_txid(transaction) do
    (transaction.txid |> Base.encode16(case: :lower) |> String.slice(0..40)) <> "..."
  end

  def get_full_txid(transaction) do
    transaction.txid |> Base.encode16(case: :lower)
  end

  def get_sender_pub_key(transaction) do
    (transaction.full_public_key |> Base.encode16(case: :lower) |> String.slice(0..40)) <> "..."
  end

  def get_transaction_output(transaction) do
    (transaction.transaction_output.pub_key_script |> Base.encode16(case: :lower) |> String.slice(0..40))
    <> "... => "
    <> (transaction.transaction_output.amount |> Integer.to_string())
  end

  def get_transaction_got_back_output(transaction) do
    unless(transaction.transaction_output.got_back_amount == nil) do
      (transaction.transaction_output.sender_pub_key_script |> Base.encode16(case: :lower) |> String.slice(0..40))
      <> "... => "
      <> (transaction.transaction_output.got_back_amount |> Integer.to_string())
    else
      ""
    end

  end

  def get_txn_output_amount(transaction) do
    amt = transaction.transaction_output.amount
    if(transaction.transaction_output.got_back_amount != nil) do
      amt + transaction.transaction_output.got_back_amount
    else
      amt
    end
  end

  def get_input_transaction_list(transaction_input) when transaction_input == nil do
    "Coinbase Transaction: No Input"
  end

  def get_input_transaction_list(transaction_input) when transaction_input == [] do
    ""
  end

  def get_input_transaction_list(transaction_input) do
    [head | tail] = transaction_input
    temp = head.txid |> Base.encode16(case: :lower)
    "<a href =\"http://localhost:4000/transaction?transaction=" <> temp <> "\">" <> (temp |> String.slice(0..30)) <>"...</a>" <>
    "<br>" <> get_input_transaction_list(tail)
  end

  def generate_transaction_html(transactions) when transactions == [] do
    ""
  end

  def generate_transaction_html(transactions) do
    [head | tail] = transactions
    "<tr> <td>" <>
    "<a href =\"http://localhost:4000/transaction?transaction=" <> get_full_txid(head) <> "\">" <> get_txid(head) <>"</a>" <>
    "</td> <td>" <>
    Integer.to_string(get_txn_output_amount(head)) <>
    "</td><td>" <>
    get_input_transaction_list(head.transaction_input) <>
    "</td> </tr>" <>
    generate_transaction_html(tail)

  end

  def get_transaction_html(block) do
    block.transactions |> generate_transaction_html()
  end

  def get_prev_block_link(block) do
    block_no = Map.get(block, :block_number)
    "http://localhost:4000/block?block=" <> Integer.to_string((block_no-1))
  end

  def get_input_transaction_html(transaction) do
    get_input_transaction_list(transaction.transaction_input)
  end


end
