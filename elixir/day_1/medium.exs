# ===================== Recursive list ====================

defmodule RecurList do

  def size([]) do
    0
  end

  def size([_|tail]) do
    1 + size(tail)
  end

  def max(list) do
    list |> Enum.sort |> List.last
  end

  def min(list) do
    list |> Enum.sort |> List.first
  end

end

list = [2,3,4,5,1,2,-1,10,8,12,-20]

list |> inspect |> IO.puts
"Size: #{RecurList.size(list)}" |> IO.puts
"Max: #{RecurList.max(list)}" |> IO.puts
"Min: #{RecurList.min(list)}" |> IO.puts

# ===================== Word Count ====================


defmodule Words do

  def count(words) do
    Enum.reduce(words, %{}, fn(x, acc) -> Map.put(acc, x, (Map.get(acc, x, 0) + 1)) end)
  end

end

words = [:foo, :foo, :foo, :bar, :foobar, :bar, :foo]

IO.puts ""
IO.puts "Word Count: "
Words.count(words) |> inspect |> IO.puts
