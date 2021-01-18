defmodule NumbersToStringTest do
  use ExUnit.Case

  # TODO: test edge cases like less than one and bigger than 999999.99. 
  # test only . is allowed

  test "output should be: FOURTY SEVEN DOLLARS AND FIFTY CENTS when input is '{\"input\": 47.5O}'" do
    assert NumbersToString.numbers_to_string('{"input": 47.50}') == "FOURTY SEVEN DOLLARS AND FIFTY CENTS"
  end

  test "output should be: FIVE DOLLARS AND ZERO CENTS when input is '{\"input\": 5}'" do
    assert NumbersToString.numbers_to_string('{"input": 5}') == "FIVE DOLLARS AND ZERO CENTS"
  end

  test "output should be: TWO HUNDRED AND FIVE DOLLARS AND THIRTY ONE CENTS when input is '{\"input\": 205.31}'" do
    assert NumbersToString.numbers_to_string('{"input": 205.31}') == "TWO HUNDRED AND FIVE DOLLARS AND THIRTY ONE CENTS"
  end

  test "output should be: FOUR THOUSAND DOLLARS AND ZERO CENTS when input is '{\"input\": 4000.0}'" do
    assert NumbersToString.numbers_to_string('{"input": 4000.0}') == "FOUR THOUSAND DOLLARS AND ZERO CENTS"
  end

  test "output should be: ONE DOLLAR AND ONE CENT when input is '{\"input\": 1.01}'" do
    assert NumbersToString.numbers_to_string('{"input": 1.01}') == "ONE DOLLAR AND ONE CENT"
  end

  test "output should be: FOUR HUNDRED DOLLARS AND NINETY CENTS when input is '{\"input\": 400.9}'" do
    assert NumbersToString.numbers_to_string('{"input": 400.9}') == "FOUR HUNDRED DOLLARS AND NINETY CENTS"
  end

  test "output should be: FOUR HUNDRED AND ELEVEN DOLLARS AND NINETY CENTS when input is '{\"input\": 411.9}'" do
    assert NumbersToString.numbers_to_string('{"input": 411.9}') == "FOUR HUNDRED AND ELEVEN DOLLARS AND NINETY CENTS"
  end

  test "output should be: ONE THOUSAND AND FOUR HUNDRED AND ELEVEN DOLLARS AND NINETY CENTS when input is '{\"input\": 1411.9}'" do
    assert NumbersToString.numbers_to_string('{"input": 1411.9}') == "ONE THOUSAND AND FOUR HUNDRED AND ELEVEN DOLLARS AND NINETY CENTS"
  end
  
  test "output should be: ELEVEN THOUSAND AND FOUR HUNDRED AND ELEVEN DOLLARS AND NINETY CENTS when input is '{\"input\": 11411.9}'" do
    assert NumbersToString.numbers_to_string('{"input": 11411.9}') == "ELEVEN THOUSAND AND FOUR HUNDRED AND ELEVEN DOLLARS AND NINETY CENTS"
  end

  test "output should be: FOURTY ONE THOUSAND AND FOUR HUNDRED AND ELEVEN DOLLARS AND NINETY CENTS when input is '{\"input\": 41411.9}'" do
    assert NumbersToString.numbers_to_string('{"input": 41411.9}') == "FORTY ONE THOUSAND AND FOUR HUNDRED AND ELEVEN DOLLARS AND NINETY CENTS"
  end

  test "output should be: ONE HUNDRED AND ELEVEN THOUSAND AND FOUR HUNDRED AND ELEVEN DOLLARS AND NINETY CENTS when input is '{\"input\": 111411.9}'" do
    assert NumbersToString.numbers_to_string('{"input": 111411.9}') == "ONE HUNDRED AND ELEVEN THOUSAND AND FOUR HUNDRED AND ELEVEN DOLLARS AND NINETY CENTS"
  end

  test "output should be: ONE DOLLAR AND ELEVEN CENTS when input is '{\"input\": 1.11}'" do
    assert NumbersToString.numbers_to_string('{"input": 1.11}') == "ONE DOLLAR AND ELEVEN CENTS"
  end

  test "output should be: ONE DOLLAR AND TEN CENTS when input is '{\"input\": 1.1}'" do
    assert NumbersToString.numbers_to_string('{"input": 1.10}') == "ONE DOLLAR AND TEN CENTS"
  end

  test "output should be: FORTY FOUR THOUSAND DOLLARS AND ELEVEN CENTS when input is '{\"input\": 44000.11}'" do
    assert NumbersToString.numbers_to_string('{"input": 44000.11}') == "FORTY FOUR THOUSAND DOLLARS AND ELEVEN CENTS"
  end

  test "output should be: FORTY FOUR THOUSAND AND ONE HUNDRED DOLLARS AND ZERO CENTS when input is '{\"input\": 44100}'" do
    assert NumbersToString.numbers_to_string('{"input": 44100}') == "FORTY FOUR THOUSAND AND ONE HUNDRED DOLLARS AND ZERO CENTS"
  end

  test "output should be: FORTY FOUR THOUSAND AND ONE HUNDRED AND TEN DOLLARS AND ZERO CENTS when input is '{\"input\": 44110}'" do
    assert NumbersToString.numbers_to_string('{"input": 44110}') == "FORTY FOUR THOUSAND AND ONE HUNDRED AND TEN DOLLARS AND ZERO CENTS"
  end

  test "output should be: FORTY FOUR THOUSAND AND FIVE HUNDRED AND TWEENTY SEVEN DOLLARS AND ZERO CENTS when input is '{\"input\": 44527}'" do
    assert NumbersToString.numbers_to_string('{"input": 44527}') == "FORTY FOUR THOUSAND AND FIVE HUNDRED AND TWEENTY SEVEN DOLLARS AND ZERO CENTS"
  end

  test "output should be: NINE HUNDRED AND NINETY NINE THOUSAND AND NINE HUNDRED AND NINETY NINE DOLLARS AND ZERO CENTS when input is '{\"input\": 999999}'" do
    assert NumbersToString.numbers_to_string('{"input": 999999}') == "NINE HUNDRED AND NINETY NINE THOUSAND AND NINE HUNDRED AND NINETY NINE DOLLARS AND ZERO CENTS"
  end

  test "output should be: NINE HUNDRED AND NINETY NINE THOUSAND AND NINE HUNDRED AND NINETY NINE DOLLARS AND ONE CENT when input is '{\"input\": 999999.01}'" do
    assert NumbersToString.numbers_to_string('{"input": 999999.01}') == "NINE HUNDRED AND NINETY NINE THOUSAND AND NINE HUNDRED AND NINETY NINE DOLLARS AND ONE CENT"
  end

  test "output should be: NINE HUNDRED AND NINETY NINE THOUSAND AND NINE HUNDRED AND NINETY NINE DOLLARS AND NINETY NINE CENTS when input is '{\"input\": 999999.99}'" do
    assert NumbersToString.numbers_to_string('{"input": 999999.99}') == "NINE HUNDRED AND NINETY NINE THOUSAND AND NINE HUNDRED AND NINETY NINE DOLLARS AND NINETY NINE CENTS"
  end

  test "output should be: NINE HUNDRED AND NINETY NINE THOUSAND AND NINE HUNDRED AND NINETY NINE DOLLARS AND NINETY CENTS when input is '{\"input\": 999999.9}'" do
    assert NumbersToString.numbers_to_string('{"input": 999999.9}') == "NINE HUNDRED AND NINETY NINE THOUSAND AND NINE HUNDRED AND NINETY NINE DOLLARS AND NINETY CENTS"
  end

  test "output should be: NINE HUNDRED THOUSAND DOLLARS AND ZERO CENTS when input is '{\"input\": 900000}'" do
    assert NumbersToString.numbers_to_string('{"input": 900000}') == "NINE HUNDRED THOUSAND DOLLARS AND ZERO CENTS"
  end

  test "output should be: NINE HUNDRED AND NINETY NINE THOUSAND AND NINE HUNDRED AND NINE DOLLARS AND NINETY NINE CENTS when input is '{\"input\": 999909.99}'" do
    assert NumbersToString.numbers_to_string('{"input": 999909.99}') == "NINE HUNDRED AND NINETY NINE THOUSAND AND NINE HUNDRED AND NINE DOLLARS AND NINETY NINE CENTS"
  end

  test "output should be: NINE HUNDRED AND NINETY NINE THOUSAND AND NINE DOLLARS AND NINETY NINE CENTS when input is '{\"input\": 999009.99}'" do
    assert NumbersToString.numbers_to_string('{"input": 999009.99}') == "NINE HUNDRED AND NINETY NINE THOUSAND AND NINE DOLLARS AND NINETY NINE CENTS"
  end

  test "output should be: NINE HUNDRED AND NINETY THOUSAND AND NINE DOLLARS AND NINETY NINE CENTS when input is '{\"input\": 990009.99}'" do
    assert NumbersToString.numbers_to_string('{"input": 990009.99}') == "NINE HUNDRED AND NINETY THOUSAND AND NINE DOLLARS AND NINETY NINE CENTS"
  end

  test "output should be: NINE HUNDRED THOUSAND AND NINE DOLLARS AND NINETY NINE CENTS when input is '{\"input\": 900009.99}'" do
    assert NumbersToString.numbers_to_string('{"input": 900009.99}') == "NINE HUNDRED THOUSAND AND NINE DOLLARS AND NINETY NINE CENTS"
  end

  test "output should be: NINE HUNDRED THOUSAND AND ONE DOLLAR AND NINETY NINE CENTS when input is '{\"input\": 900001.99}'" do
    assert NumbersToString.numbers_to_string('{"input": 900001.99}') == "NINE HUNDRED THOUSAND AND ONE DOLLAR AND NINETY NINE CENTS"
  end

  test "output should be: NINETY NINE THOUSAND AND NINE HUNDRED AND NINETY NINE DOLLARS AND NINETY NINE CENTS when input is '{\"input\": 99999.99}'" do
    assert NumbersToString.numbers_to_string('{"input": 99999.99}') == "NINETY NINE THOUSAND AND NINE HUNDRED AND NINETY NINE DOLLARS AND NINETY NINE CENTS"
  end
    # {100.000-999.999, 10.000-99.999, 1.000-9.999, 100-999, 20-99, 10-19, 1-9, cents}
    # number_tuple = {9, 1, 9, 9, 2, 9, 99}
    # number_tuple = {9, 1, 1, 9, 2, 9, 99} 
    # number_tuple = {9, 1, 1, 1, 2, 9, 99} 
    # number_tuple = {9, 1, 1, 1, 8, 9, 99} 
    # number_tuple = {9, 1, 1, 1, 1, 9, 99}
    # number_tuple = {9, 1, 1, 1, 0, 9, 99} 

    # number_tuple = {9, 0, 0, 0, 1, 0, 99}
    # number_tuple = {9, 0, 0, 0, 1, 1, 99} # FIXME:
    # number_tuple = {9, 0, 0, 0, 2, 0, 99} # FIXME:
    # number_tuple = {9, 0, 0, 0, 2, 0, 99} # FIXME:
    # number_tuple = {9, 0, 0, 0, 2, 1, 99} # FIXME:
    # number_tuple = {9, 1, 9, 9, 2, 9, 99}
    # number_tuple = {9, 1, 9, 9, 1, 9, 99}
    # number_tuple = {9, 0, 9, 9, 9, 9, 99}
    # number_tuple = {9, 0, 0, 9, 9, 9, 99}
    # number_tuple = {9, 0, 0, 0, 9, 9, 99} 
    # number_tuple = {9, 1, 9, 9, 0, 9, 99}
    # number_tuple = {9, 1, 9, 9, 0, 9, 99}
    # number_tuple = {0, 1, 9, 9, 0, 0, 99} # TODO:
    # number_tuple = {9,  9, 9, 9, 9, 99} # TODO:
    # number_tuple = {1, 99} # FIXME:
end
