# цифра от пк
rand_num = (rand * 10).to_i + 1

puts "я чота загадал от 1 до 10. угадай))0)"

# юзер угадывает

# догадка сравнивается
loop do
  guess = gets.to_i

  if guess > rand_num
    puts "чота много"
  elsif guess < rand_num
    puts "чота мало"
  else
    puts "молодец"
    break
  end
end