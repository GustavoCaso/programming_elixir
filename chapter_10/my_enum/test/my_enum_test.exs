defmodule MyEnumTest do
  use ExUnit.Case
  doctest MyEnum

  test "#all? return true when all menber return truthy value" do
    assert(MyEnum.all?([1,2,3], fn(x) -> x < 5 end ) == true)
  end

  test "#all? return false when any menber return falsy value" do
    assert(MyEnum.all?([1,2,3], fn(x) -> x > 5 end ) == false)
  end

  test "#each return every element after apply a function to it" do
    assert(MyEnum.each([1,2,3], fn(x) -> x*x end) == [1,4,9])
  end

  test "#each" do
    assert(MyEnum.each([1,2,3], fn(x) -> x * 10 end) == [10, 20, 30])
  end

  test "#filter return only the values which are truthy" do
    assert(MyEnum.filter([1,2,3,4,5,6], fn(x) -> x > 3 end) == [4,5,6])
  end

  test "#split will return a tuple with the list divided by the count" do
    assert(MyEnum.split([1, 2, 3], 2) == { [1,2], [3] })
  end

  test "#split will return a tuple with the list divided by the count" do
    assert(MyEnum.split([1, 2, 3, 4,5,6], 4) == { [1,2,3,4], [5,6] })
  end

  test "#take will return a list with the total of elements provided by the count argument" do
    assert(MyEnum.take([1, 2, 3, 4,5,6], 4) == [1,2,3,4])
  end

  test "#take will return a list from the back of the list if the number is negative" do
    assert(MyEnum.take([1, 2, 3, 4,5,6], -4) == [6,5,4,3])
  end

  test '#flatten will return all values from list even if the value is a list it self' do
    assert(MyEnum.flatten([ 1, [ 2, 3, [4] ], 5, [[[6]]]]) == [1,2,3,4,5,6])
  end
end
