# << деструктивное модифицирование
# сразу меняет получателя

# 2.7.4 :018 > members << "some dude"
#  => ["hahalex", "hyena", "alex", "some dude"] 
# 2.7.4 :019 > members[3] = "the dude"
#  => "the dude" 
# 2.7.4 :020 > members
#  => ["hahalex", "hyena", "alex", "the dude"]

# 2.7.4 :022 > str = "hahalex is so cool"
#  => "hahalex is so cool" 
# 2.7.4 :023 > str << "!"
#  => "hahalex is so cool!" 
# 2.7.4 :024 > str
#  => "hahalex is so cool!" 

# insert(index, val) - тоже деструктивный

members = ["hahalex", "hyena", "alex"] # элементы
curr_idx = 1

# || пайпы pipe
members.each do |member| # БЛОК
  # инструкции которые нужно выполнить для каждого элемента
  puts "№#{curr_idx}. #{member}"
  curr_idx += 1
end