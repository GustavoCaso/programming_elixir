defmodule PrimeTest do
  use ExUnit.Case
  doctest Prime

  test 'test_first' do
    assert Prime.nth(1) == 2
  end

  test 'test_second' do
    assert Prime.nth(2) == 3
  end

  test 'test_sixth_prime' do
    assert Prime.nth(6) == 13
  end

  test 'test_big_prime' do
    assert Prime.nth(10_001) == 104_743
  end

  test 'test nth_compression' do
    assert Prime.nth_compression(5) == [2,3,5]
  end
end
