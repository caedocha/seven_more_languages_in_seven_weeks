defmodule Sentences do

  def traverse(sentences, indentation \\ '') do
    sentences |> Tuple.to_list |> Enum.each fn(sentence) -> print(sentence, indentation) end
  end

  def print(sentence, indentation) do
    if(is_tuple(sentence)) do
      traverse(sentence,"#{indentation}  ")
    else
      IO.puts "#{indentation}#{sentence}"
    end
  end

end
