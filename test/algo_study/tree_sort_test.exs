defmodule TreeSortTest do
  use ExUnit.Case
  alias AlgoStudy.TreeSort
  doctest TreeSort

  setup do
    empty_tree = TreeSort.add(%{}, 10)

    tree =
      empty_tree
      |> TreeSort.add(34)
      |> TreeSort.add(1)
      |> TreeSort.add(1)
      |> TreeSort.add(4323)
      |> TreeSort.add(8)
      |> TreeSort.add(14)
      |> TreeSort.add(87)
      |> TreeSort.add(2)
      |> TreeSort.add(999_999)

    %{empty_tree: empty_tree, tree: tree}
  end

  test "creates a tree with one value", ctx do
    assert ctx.empty_tree == %{value: 10, left: %{}, right: %{}}
  end

  test "creates a tree with more than one value", ctx do
    assert %{
             value: 10,
             left: %{value: _, left: _, right: _},
             right: %{value: _, left: _, right: _}
           } = ctx.tree
  end

  test "get the values from a tree in ascending order", ctx do
    assert [1, 1, 2, 8, 10, 14, 34, 87, 4323, 999_999] = TreeSort.values(ctx.tree)
  end

  test "sorts a list of integers in ascending order" do
    assert [1, 2, 3, 4, 5, 6, 7, 8, 9] = TreeSort.sort([7, 2, 4, 3, 8, 6, 1, 9, 5])
  end
end
