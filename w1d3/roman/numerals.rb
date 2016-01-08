def to_roman(number)
  #math formula reducing input to number groups
  input = number
  tho_var = input / 1000
  input = input - (tho_var * 1000)
  fih_var = input / 500
  input = input - (fih_var * 500)
  hun_var = input / 100
  input = input - (hun_var * 100)
  fif_var = input / 50
  input = input - (fif_var * 50)
  ten_var = input / 10
  input = input - (ten_var * 10)
  fiv_var = input / 5 
  input = input - (fiv_var * 5)
  one_var = input
  #add number groups to an array
  roman_numeral = ""
  tho_var.times do |char|
    roman_numeral << "M"
  end
  fih_var.times do |char|
    roman_numeral << "D"
  end
  hun_var.times do |char|
    roman_numeral << "C"
  end
  fif_var.times do |char|
    roman_numeral << "L"
  end
  ten_var.times do |char|
    roman_numeral << "X"
  end
  fiv_var.times do |char|
    roman_numeral << "V"
  end
  one_var.times do |char|
    roman_numeral << "I"
  end
  puts roman_numeral
end
to_roman(2687)
to_roman(4)
to_roman(5)
to_roman(551)

