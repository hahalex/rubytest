# булев тип true false
# if elsif else

# ввод возраста
puts "введите возраст"
age = gets.to_i # перевод в интеджер

puts "страна? "
# country = gets # рося
# puts country.inspect # "рося\n"

country = gets.strip # отрезает всю каку
# puts country.inspect # "рося"

# сравнить возраст с 18
# если возраст больше 18 то можно
# если меньше то нельза

# if (country == "япо" || country == "сша") && age < 21
#   puts "пендос япошка кыш"
# elsif age < 18
#   puts "рося тоже кыш"
# else
#   puts "го"
# end

if (country == "япо" || country == "сша") && age < 21 || (country != "япо" || country != "сша") && age < 18
  puts "пендос япошка 21- и рося 18- кыш"
else
  puts "го"
end