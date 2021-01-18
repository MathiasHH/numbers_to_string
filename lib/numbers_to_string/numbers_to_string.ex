defmodule NumbersToString do
  def numbers_to_string(data) do
    data
    |> format_number
    |> convert_number_to_string
  end

  def convert_number_to_string(number_tuple) do
    case number_tuple do
      {zero_9, cent10_90, cent_zero_9} -> 
        "#{one(nil, nil, zero_9)}" <>
        "#{ctwo(cent10_90, cent_zero_9)}#{cone(cent10_90, cent_zero_9)}"
      {a10_90, zero_9, cent10_90, cent_zero_9} -> 
        "#{two(nil, a10_90, zero_9)}#{one(nil, nil, zero_9)}" <>
        "#{ctwo(cent10_90, cent_zero_9)}#{cone(cent10_90, cent_zero_9)}"
      {a100_999, a10_90, zero_9, cent10_90, cent_zero_9} -> 
        "#{three(nil, a100_999, a10_90)}" <>
        "#{two(a100_999, a10_90, zero_9)}#{one(a100_999, a10_90, zero_9)}" <>
        "#{ctwo(cent10_90, cent_zero_9)}#{cone(cent10_90, cent_zero_9)}"
      {aKs, a100_999, a10_90, zero_9, cent10_90, cent_zero_9} -> 
        "#{four(nil, nil, aKs)} #{three(aKs, a100_999, a10_90)}" <>
        "#{two(a100_999, a10_90, zero_9)}#{one(a100_999, a10_90, zero_9)}" <>
        "#{ctwo(cent10_90, cent_zero_9)}#{cone(cent10_90, cent_zero_9)}"
      {a10_99K, aKs, a100_999, a10_90, zero_9, cent10_90, cent_zero_9} -> 
        "#{five(nil, a10_99K, aKs)}" <>
        "#{four(nil, a10_99K, aKs)} #{three(aKs, a100_999, a10_90)}" <>
        "#{two(a100_999, a10_90, zero_9)}#{one(a100_999, a10_90, zero_9)}" <>
        "#{ctwo(cent10_90, cent_zero_9)}#{cone(cent10_90, cent_zero_9)}"
      {a100_999K, a10_99K, aKs, a100_999, a10_90, zero_9, cent10_90, cent_zero_9} ->
        "#{mapnostr(6, a100_999K)} #{five(a100_999K, a10_99K, aKs)}" <>
        "#{four(a100_999K, a10_99K, aKs)} #{three(aKs, a100_999, a10_90)}" <>
        "#{two(a100_999, a10_90, zero_9)}#{one(a100_999, a10_90, zero_9)}" <>
        "#{ctwo(cent10_90, cent_zero_9)}#{cone(cent10_90, cent_zero_9)}"
    end
  end

  def five(a100_999K, a10_99K, aKs) do
    case a10_99K do
      1 when a100_999K == nil -> "#{Enum.at(mapnostr(5, a10_99K), aKs)}"
      1 -> "AND #{Enum.at(mapnostr(5, a10_99K), aKs)}"
      digit when digit == 0 -> ""
      _ when a100_999K == nil -> "#{mapnostr(5, a10_99K)}"
      _ -> "AND #{mapnostr(5, a10_99K)}"
    end
  end
  
  def four(a100_999K, a10_99K, aKs) do
    IO.puts aKs
    case a10_99K do
      1 -> ""  # Vi har alerede en 11 til 19
      digit when digit == 0 -> "THOUSAND"
      digit when digit == nil -> "#{mapnostr(4, aKs)}"
      digit when digit > 0 and aKs > 0 and a100_999K > 0 -> " #{mapnostr(4, aKs)}"
      digit when digit > 0 and aKs > 0 -> "#{mapnostr(4, aKs)}"
      _ -> " #{mapnostr(4, aKs)}"
    end
  end

  def three(aKs, a100_999, a10_90) do
    case a100_999 do
      digit when digit == 0 -> ""
      _ when a10_90 == 0 and aKs == nil -> "#{mapnostr(3, a100_999)} " 
      _ when a10_90 == 0 -> "AND #{mapnostr(3, a100_999)} "
      _ when aKs != nil -> "AND #{mapnostr(3, a100_999)} AND" 
      _ -> "#{mapnostr(3, a100_999)} AND" 
    end
  end

  def two(a100_999, a10_90, zero_9) do
    case a10_90 do
      1 -> " #{Enum.at(mapnostr(2, a10_90), zero_9)} " # 10 - 19
      digit when a100_999 == nil and digit > 1 -> "#{mapnostr(2, a10_90)} "  # 20 - 90 tiere
      digit when digit > 1 -> " #{mapnostr(2, a10_90)} "  # 20 - 90 tiere
      digit when digit == 0 -> ""
      _ -> " #{mapnostr(2, a10_90)}"  # 20 - 90 tiere
    end
  end
  
  def one(a100_999, a10_90, zero_9) do
    case a10_90 do
      1 -> "DOLLARS" # vi har en 10 - 19 så vi skal ikke bruge en 0 - 9er
      digit when digit == 1 -> "DOLLARS"
      digit when digit == 0 and zero_9 == 0 -> "DOLLARS"
      digit when digit == 0 and zero_9 == 1 -> "AND #{mapnostr(1, zero_9)} DOLLAR" 
      _ when zero_9 == 1 -> "#{mapnostr(1, zero_9)} DOLLAR" 
      _ when a10_90 == nil and zero_9 == 0 -> "#{mapnostr(1, zero_9)}DOLLARS" 
      _ when a10_90 == 0 and a100_999 == 0 -> "AND #{mapnostr(1, zero_9)} DOLLARS" 
      _ when a10_90 == 0 -> "AND #{mapnostr(1, zero_9)} DOLLARS" 
      _ when a100_999 != 0 and a10_90 == 0 -> "AND #{mapnostr(1, zero_9)} DOLLARS" 
      _ -> "#{mapnostr(1, zero_9)} DOLLARS" 
    end
  end

  def ctwo(cent10_90, cent_zero_9) do
    case cent10_90 do
      1 -> " AND #{Enum.at(mapnostr(2, cent10_90), cent_zero_9)} CENTS" # 10 - 19
      digit when digit == 0 -> ""
      _ -> " AND #{mapnostr(2, cent10_90)} "  # 20 - 90 tiere
    end
  end

  def cone(cent10_90, cent_zero_9) do
    case cent10_90 do
      1 -> "" # vi har en 10 - 19 så vi skal ikke bruge en 0 - 9er
      digit when digit == 0 and cent_zero_9 == 0 -> " AND ZERO CENTS"
      digit when digit == 0 and cent_zero_9 == 1 -> " AND ONE CENT"
      digit when digit > 0  and cent_zero_9 == 0 -> "#{mapnostr(1, cent_zero_9)}CENTS" 
      _ -> "#{mapnostr(1, cent_zero_9)} CENTS" 
    end
  end

  def mapnostr(row, number) do
    number_as_string = [
      [],
      # 1 - 9
      ["", "ONE", "TWO", "THREE", "FOUR", "FIVE", "SIX", "SEVEN", "EIGHT", "NINE"],
      # 10 - 19 and 20 - 90 in tens
       ["", ["TEN", "ELEVEN", "TWELVE", "THIRTEEN", "FOURTEEN", "FIFTEEN", "SIXTEEN", "SEVENTEEN", "EIGHTEEN", "NINETEEN"], "TWEENTY", "THIRTY", "FOURTY", "FIFTY", "SIXTY", "SEVENTY", "EIGHTY", "NINETY"],
      # 100s
      ["", "ONE HUNDRED", "TWO HUNDRED", "THREE HUNDRED", "FOUR HUNDRED", "FIVE HUNDRED", "SIX HUNDRED", "SEVEN HUNDRED", "EIGHT HUNDRED", "NINE HUNDRED"],
      # 1K - 9K
      ["THOUSAND", "ONE THOUSAND", "TWO THOUSAND", "THREE THOUSAND", "FOUR THOUSAND", "FIVE THOUSAND", "SIX THOUSAND", "SEVEN THOUSAND", "EIGHT THOUSAND", "NINE THOUSAND"],
      # 10K
      ["", ["TEN THOUSAND", "ELEVEN THOUSAND", "TWELVE THOUSAND", "THIRTEEN THOUSAND", "FOURTEEN THOUSAND", "FIFTEEN THOUSAND", "SIXTEEN THOUSAND", "SEVENTEEN THOUSAND", "EIGHTEEN THOUSAND", "NINETEEN THOUSAND"], "TWEENTY", "THIRTY", "FORTY", "FIFTY", "SIXTY", "SEVENTY", "EIGHTY", "NINETY"],
      # 100K
      ["", "ONE HUNDRED", "TWO HUNDRED", "THREE HUNDRED", "FOUR HUNDRED", "FIVE HUNDRED", "SIX HUNDRED", "SEVEN HUNDRED", "EIGHT HUNDRED", "NINE HUNDRED"]
    ]
    Enum.at(Enum.at(number_as_string, row), number)
  end

  def format_number(data) do
    list = data
    |> to_string
    |> String.split(" ")
    |> List.last
    |> String.split("}")
    |> List.first
    |> String.split(".")

    list_with_cents = if length(list) == 1, do: list ++ ["00"], else: list 
    list_with_cents_two_digits = case List.last(list_with_cents) do
      "0" -> List.update_at(list_with_cents, 1, &(&1 = "00"))
      "1" -> List.update_at(list_with_cents, 1, &(&1 = "10"))
      "2" -> List.update_at(list_with_cents, 1, &(&1 = "20"))
      "3" -> List.update_at(list_with_cents, 1, &(&1 = "30"))
      "4" -> List.update_at(list_with_cents, 1, &(&1 = "30"))
      "5" -> List.update_at(list_with_cents, 1, &(&1 = "50"))
      "6" -> List.update_at(list_with_cents, 1, &(&1 = "60"))
      "7" -> List.update_at(list_with_cents, 1, &(&1 = "70"))
      "8" -> List.update_at(list_with_cents, 1, &(&1 = "80"))
      "9" -> List.update_at(list_with_cents, 1, &(&1 = "90"))
      _ -> list_with_cents 
    end

    list_with_cents_two_digits
    |> to_string
    |> String.split(" ")
    |> List.last
    |> String.split("}")
    |> List.first
    |> String.split(".")
    |> List.first
    |> String.split("", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> List.to_tuple
  end
end
