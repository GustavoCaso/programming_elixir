defmodule StringAndBinaries do

  def check_list([]), do: false
  def check_list(list) ,do: do_check_list(list)
  def do_check_list([]), do: true
  def do_check_list([head|tail]) when head <= 127, do: do_check_list(tail)
  def do_check_list([head|_]), do: false

  def anagram?(word1, word2) do
    if String.length(word1) == String.length(word2) do
      do_anagram?(word1, word2)
    else
      false
    end
  end

  def do_anagram?(w1, w2) do
    Enum.sort(String.codepoints(w2)) == Enum.sort(String.codepoints(w1))
  end
end
