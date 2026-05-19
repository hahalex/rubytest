require 'yaml'

a_code = 'A'.ord # => 65 => 65.chr = 'A'
correct_answers = 0
incorrect_answers = 0

# ввести имя с клавиатуры
puts "введите ваше имя:"
name = gets.strip
current_time = Time.now.strftime('%d_%m_%y_%H_%M')

filename = "QWIZ_#{name}_#{current_time}.txt"

File.write(
  filename, 
  "Результаты QWIZ'a по хахалекс\n",
  mode: 'a') # открыть файл толькл для записи и записывать только в конец файла

File.write(
filename, 
"\nПОЛЬЗОВАТЕЛЬ: #{name}\nДАТА: #{current_time}\n",
mode: 'a')

# откуда-то взять вопросы и ответы
# YAML - yet another markup language
all_questions = YAML.safe_load(File.read('questions.yaml'), symbolize_names: true)
# puts all_questions.inspect

# брать случайный вопрос и для каждого предлагать 4 вараинат ответа
all_questions.shuffle.each do |questions_data|
  # на каждой итерации выводится текст вопроса и все 4 ответа
  formatted_question = "\n\n=== #{questions_data[:question]} ===\n"
  puts formatted_question

  File.write(
  filename, 
  formatted_question,
  mode: 'a')

  # тут хронится не буква, а текст ответа
  correct_answer = questions_data[:answers].first

  # тот хэш который мы делаем
  # очереднойэлемент массива (то есть очередной ответ из массива)
  # индекс этого ответа
  answers = questions_data[:answers].shuffle.each_with_index.inject({}) do |result, (answer, i)|
    # на каждой итерации мы выводим по 1 ответу и трансформируем в хэш все ответы
    
    # А. Ответ 1
    # Б. Ответ 2
    # { "А" => "Ответ 1", "Б" => "Ответ 2" ... }
    answer_char = (a_code + i).chr # получаем букву для ответа
    result[answer_char] = answer
    
    # puts result
    puts "#{answer_char}. #{answer}"

    result # result = result
    # теперь используй новое значение хэша для result
    # уточнить как оно работает
    # пример:
    # === Любимая еда хахалекс? ===
    # {"A"=>"Пицца"}
    # A. Пицца
    # {"A"=>"Пицца", "B"=>"Шаурма"}
    # B. Шаурма
    # {"A"=>"Пицца", "B"=>"Шаурма", "C"=>"Гречка"}
    # C. Гречка
    # {"A"=>"Пицца", "B"=>"Шаурма", "C"=>"Гречка", "D"=>"Шашлык"}
    # D. Шашлык
  end
  # на момент завершения верхнего цикла questions_data[:answers].shuffle
  # у нас выведены на экран все 4 варианат ответа с буквами в произвольном порядке
  # + выведен сам вопрос

  user_answer_char = nil
  # юзер вводит ответ с клавиатуры
  loop do # это цикл который запрашивает ответ с клавиатуры
    puts "ваш ответ:"
    user_answer_char = gets.strip[0].upcase

    if user_answer_char.between?('A', 'D')
      break
    else
      puts "ТЫ ДУРАК?"
      puts "ответ только A, B, C или D\n\n"
      puts "ИТАК"
    end
  end
  # на этом моменте переменные, которые мы создали внутри цикла loop УЖЕ НЕДОСТУПНЫ!!!

  File.write(
  filename, 
  "ответ пользователя: #{user_answer_char}. #{answers[user_answer_char]}\n",
  mode: 'a')

  # мы сравниваем ответ с правильным
  if answers[user_answer_char] == correct_answer
    correct_answers += 1
    puts "ПРАВИЛЬНО"
    puts "поздравляю ваш icq не отрицательный"

    File.write(
    filename, 
    "ответ ВЕРНЫЙ\n",
    mode: 'a')
  else
    incorrect_answers += 1
    puts "НЕПРАВИЛЬНО!!!"
    puts "правильный ответ: #{correct_answer}"

    File.write(
    filename, 
    "ответ НЕВЕРНЫЙ\nПРАВИЛЬНЫЙ ОТВЕТ: #{correct_answer}\n",
    mode: 'a')
  end
end

File.write(
  filename, 
  "\n\n=== РЕЗУЛЬТАТЫ ===\n",
  mode: 'a')

File.write(
  filename, 
  "правильно #{correct_answers} из #{correct_answers + incorrect_answers}\n",
  mode: 'a')

File.write(
  filename, 
  "ИТОГО #{((correct_answers.to_f / all_questions.length.to_f) * 100).floor(2)}%",
  mode: 'a')