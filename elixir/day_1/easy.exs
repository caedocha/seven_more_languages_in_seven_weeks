# Geometric tuples

point = {10, 20}
point |> inspect |> IO.puts


# Calculate hypothenuse

defmodule Triangle do
  def hypotenuse({a, b}) do
    :math.sqrt((a * a) + (b * b))
  end
end

# Cast string to atom
String.to_atom("super_cool")

# Check is var is an atom
is_atom("Cool") # false
is_atom(:cool) # true
