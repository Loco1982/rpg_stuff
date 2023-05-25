defmodule PiMurders do

 def months_amount(digit_amount) do
  set = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5, 8, 9, 7, 9, 3, 2, 3, 8, 4, 6, 2, 6, 4, 3, 3,
  8, 3, 2, 7, 9, 5, 0, 2, 8, 8, 4, 1, 9, 7]
  pi_digits = Enum.take(set, digit_amount)
  months = Enum.reduce(pi_digits, fn x, acc -> x + acc end)
  pi_digit = List.pop_at(pi_digits, -1)
  {digit, _} = pi_digit
  "El próximo asesinato será en #{months} meses y serán #{digit} asesinatos"
 end

 def accumulated_assasination_months(digit) do
  set = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5, 8, 9, 7, 9, 3, 2, 3, 8, 4, 6, 2, 6, 4, 3, 3,
  8, 3, 2, 7, 9, 5, 0, 2, 8, 8, 4, 1, 9, 7]
  accumulated = Enum.reduce(Enum.take(set, digit), fn x, acc -> x + acc end)
  "Han pasado #{accumulated} meses de asesinatos"
 end
end
