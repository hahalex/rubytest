# class

# допустим класс животные, каждому животному присвоено:
# возраст
# вес
# кличка

# Animal.new("хахалекс") а тут не сработает тк класс ниже

$global_var = 0 # глобавльная перемнная в руби, их никто не использует, это небезопасно

class Animal
  # константы с большой буквы
  # класс тоже константа
  LEGS_COUNT_CONST = 4 # константа класса, это хорошо
  @@legs_count_var = 4 # это (глобальная) переменная класса, так лучше не делать
  # переменные можно менять извне класса, а константы нет

  # переменные образца класса (instance variables)


  # class body
  # here we describe animal's atributes
  # and also methods (functions) - literally WHAT animal (or class) can do
  def initialize(name, age) # метод который вызывается при создании нового животного
    # name - переменная (аргумент метода) которая существует только пока работет метод initialize
    # мы дя ТОГО ЖИВОТНОГО КОТОРОЕ СЕЙЧАС СОЗДАЛИ
    # сохраняем его ЛИЧНОЕ имя
    # puts name
    @name = name
    @age = age
  end

  def age # метода который сообщает возраст животного (НЕ ВЫВОДИТ А СООБЩАЕТ)
    # puts "мне #{@age}"
    return @age # куегкт vj;yj yt gbcfnm
    # всё что ниже return не выполнятся в рамках метода
  end

  # def change_age(age)
  def age=(new_age)
    @age = new_age
  end

  def birthday
    @age += 1
  end
end

# порождаем образец (экземпляр) этого класса
animal1 = Animal.new("хахалекс", 21) # here we create new animal and start initialize method
animal2 = Animal.new("чувак", 20)

# puts animal1.inspect
# puts animal2.inspect

# объект-образец-класса.метод
animal1.age # ЭТО ВЫЗОВ МЕТОДА
animal2.age

puts "мне было #{animal2.age}"
# animal2.change_age(22)
animal2.birthday

# animal2.age
puts "случилось др"

animal2_age = animal2.age

puts "мне стало #{animal2_age}"


# monkey patching
# переоткрываем уже существующий класс
# и меняем его
# так можно делать потому что ruby динамический интерпретируемый язык
class String
  def downcase
    puts "lol"
  end
end