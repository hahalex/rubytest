class Animal
  # attr_accessor :name, :age
  # создаст два метода
  # def age и def age= -> геттер и сеттер грубо говоря

  attr_accessor :age # полный набор
  attr_reader :name # только геттер
  attr_writer :name # только сеттер

  def initialize(name, age)
    @name = name
    @age = age
  end

  # def age
  #   return @age 
  # end

  # def age=(new_age)
  #   @age = new_age
  # end

  def birthday
    @age += 1
  end
end


animal1 = Animal.new("хахалекс", 20)
animal2 = Animal.new("какой-то лох", 20)

puts "я #{animal1.name}"
puts "мне было #{animal1.age}"
animal1.birthday
puts "случилось др"
puts "мне стало #{animal1.age}\n\n"

puts "а я #{animal2.name}"
animal2.name = "конкретный лох"
puts "случилось присвоение нового имени"
puts "я теперь #{animal2.name}"