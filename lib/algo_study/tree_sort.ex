defmodule AlgoStudy.TreeSort do
  @moduledoc """
  Tree sorting alrogithm
  """

  def run do
    :world
  end

  @doc """
  Adds a value to a tree.
  When no tree is given, creates a new tree with the given
  value as the first knot.
  """
  def add(%{value: knot_value, left: l, right: r}, new_value) when new_value <= knot_value do
    %{value: knot_value, left: add(l, new_value), right: r}
  end

  def add(%{value: knot_value, left: l, right: r}, new_value) when new_value > knot_value do
    %{value: knot_value, left: l, right: add(r, new_value)}
  end

  def add(%{}, value) when is_integer(value), do: %{value: value, left: %{}, right: %{}}

  def add(_tree, _value), do: {:error, :unparsable_entries}

  @doc """
  Returns a list with a tree's values in ascending order.
  """
  def values(%{value: knot_value, left: l, right: r}), do: values(l) ++ [knot_value] ++ values(r)
  def values(%{}), do: []

  @doc """
  Sorts a list of integers.
  """
  def sort(list), do: Enum.reduce(list, %{}, &add(&2, &1)) |> values()
end
