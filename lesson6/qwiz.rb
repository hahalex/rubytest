require 'yaml'

# вводим имя с клавиатуры
# puts "введите ваше имя:"
# user = gets.strip

# откуда-то взять вопросы и ответы
# YAML yet another markup language
all_questions = YAML.safe_load(File.read('questions.yaml'), symbolize_names: true)

# брать каждый вопрос о очереди и предлагать 4 вараинат ответа
all_questions.shuffle.each do |questions_data|
  puts "\n\n=== #{questions_data[:question]} ===\n"
  
  num = 1
  correct_answer = questions_data[:answers][1]
  questions_data[:answers].shuffle.each do |answer|
    puts "#{num}. #{answer}"
    num += 1
  end

  user_answer = gets.strip
  puts correct_answer
  if user_answer == correct_answer
    puts "правильно"
  else
    puts "выберите вараинт ответа от 1 до 4"
  end
end

#  юзер ввдит ответ с клавиатуры

#  мы сравниваем ответ с правильным