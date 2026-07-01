class Animal
  attr_accessor :age, :name

  def speak
    puts "животные могут издавать оазные звуки"
  end

  def eat(amount)
    puts "животные едят "
  end
end

class Dog < Animal # берём методы из класса Animal
  def speak # переопредеяем метод родителя Animal
    puts "WOOF!"
  end
end

class Cat < Animal
  def speak
    puts "MEOW!"
  end
end

dog = Dog.new
dog.speak

animal = Animal.new
animal.speak