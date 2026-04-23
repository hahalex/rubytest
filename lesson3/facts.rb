facts = [
  "i love pizza",
  "i love shawerma",
  "i love hyenas",
  "i am hyena",
  "i wanna make video about games",
  "i have youtube channel"
]
puts "ты кто?"
user_name = gets.strip
my_name = "hahalex"
puts "привет, #{user_name}! \nя хахалекс \nу меня есть #{facts.length} фактов обо мне"
puts "ентр - продолжить, нет - выход"

loop do
  user = gets.strip
  if user == "нет"
    puts "\nой \nну тогда пока"
    break
  else
    rand_num =  (rand * facts.length).to_i
    puts "hahalex: #{facts[rand_num]}"
  end
end