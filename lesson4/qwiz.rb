animals = {
  "Собака" => "Псовые",
  "Кошка" => "Кошачьи",
  "Хомяк" => "Грызуны",
  "Лошадь" => "Парнокопытные",
  "Корова" => "Непарнокопытные",
  "Курица" => "Фазановые",
}

animals = animals.to_a.shuffle.to_h

animals.each do |animal, family|
  puts "#{animal} принадлежит к семейству..."

  user_input = gets.strip.downcase

  if user_input == family.downcase
    puts "круто"
  else
    puts "некруто"
    puts "правильный ответ #{family.downcase}"
  end
end
