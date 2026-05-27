# цифра от пк
rand_num = (rand * 10).to_i + 1

puts "я чота загадал от 1 до 10. угадай, у тебя 10 попыток))0)"

# юзер угадывает
iter = 0

# догадка сравнивается
loop do
  iter += 1

  guess = gets.to_i

  if iter < 10
    if guess > rand_num
      puts "чота много"
    elsif guess < rand_num
      puts "чота мало"
    else
      puts "молодец"
      break
    end
  else
    puts "поздравляю! ты дурак"
    break
  end
end