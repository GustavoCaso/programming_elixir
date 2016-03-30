defmodule StringAndBinariesTest do
  use ExUnit.Case
  doctest StringAndBinaries

  test "#check_list_character only contains printable ASCII parameters"  do
    assert StringAndBinaries.check_list('hello') == true
    assert StringAndBinaries.check_list('hłło') == false
    assert StringAndBinaries.check_list([]) == false
  end

  test "#anagram? return true if the words are anagrams" do
    assert StringAndBinaries.anagram?("hello", "hellos") == false
    assert StringAndBinaries.anagram?("hello", "lleho") == true
  end
end
