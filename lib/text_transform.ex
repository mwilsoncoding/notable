defmodule TextTransform do
  @moduledoc """
  Documentation for `TextTransform`.
  """

  def dictated_list(text) do
    sentences =
      text
      |> String.split("Number ")

    [num_word|[]] =
      sentences
      |> Enum.find(fn str -> String.starts_with?(str, ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]) end)
      |> String.split()
      |> Enum.take(1)

    num =
      num_word |> from_word()

    sentences
    |> Enum.with_index()
    |> Enum.map(
       fn {sentence, index} ->
         if String.starts_with?(sentence, "next") do
           [next|[word|sentence]] = String.split(sentence)
           Enum.join(["#{to_string(index + (num - 1))}."|[String.capitalize(word)|sentence]], " ")
         else
           sentence
         end
       end
      )
    |> Enum.map(&replace_num/1)
    |> Enum.map(&String.trim/1)
    |> Enum.join("\n")
  end

  defp replace_num(str) do
    cond do
      String.starts_with?(str, "one") -> String.replace(str, "one", "1.")
      String.starts_with?(str, "two") -> String.replace(str, "two", "2.")
      String.starts_with?(str, "three") -> String.replace(str, "three", "3.")
      String.starts_with?(str, "four") -> String.replace(str, "four", "4.")
      String.starts_with?(str, "five") -> String.replace(str, "five", "5.")
      String.starts_with?(str, "six") -> String.replace(str, "six", "6.")
      String.starts_with?(str, "seven") -> String.replace(str, "seven", "7.")
      String.starts_with?(str, "eight") -> String.replace(str, "eight", "8.")
      String.starts_with?(str, "nine") -> String.replace(str, "nine", "9.")
      true -> str
    end
  end


  defp from_word("one"), do: 1
  defp from_word("two"), do: 2
  defp from_word("three"), do: 3
  defp from_word("four"), do: 4
  defp from_word("five"), do: 5
  defp from_word("six"), do: 6
  defp from_word("seven"), do: 7
  defp from_word("eight"), do: 8
  defp from_word("nine"), do: 9

end
