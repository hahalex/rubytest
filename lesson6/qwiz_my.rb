require 'yaml'

true_answers = 0
false_answers = 0

# вводим имя с клавиатуры
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
# YAML yet another markup language
all_questions = YAML.safe_load(File.read('questions.yaml'), symbolize_names: true)
correct_answers = []
raw_questions = all_questions.shuffle

# брать каждый вопрос о очереди и предлагать 4 вараинат ответа
raw_questions.each do |questions_data|
  
  # puts questions_data[:answers].first.inspect
  correct_answers << questions_data[:answers].first
end
# puts correct_answers.inspect

raw_questions.each do |questions_data|
  formatted_question = "\n=== #{questions_data[:question]} ===\n"
  puts formatted_question

  File.write(
    filename, 
    formatted_question,
    mode: 'a')

  num = 1
  shuffle_answers = []
  questions_data[:answers].shuffle.each do |answer|
    shuffle_answers << answer
    # puts shuffle_answers.inspect
    puts "#{num}. #{answer}"
    num += 1
  end

  # puts correct_answers.shift
  # puts correct_answers.inspect
  
  #  юзер ввдит ответ с клавиатуры
  user_answer = nil
  puts "\n=== ваш ответ? ===\n"
  loop do
    user_answer = gets.strip[0].to_i
    if (1..4).include?(user_answer)
      break
    else
      puts "выберите вараинт ответа от 1 до 4"
    end
  end

  File.write(
    filename, 
    "ответ пользователя: #{user_answer}. #{shuffle_answers[user_answer-1]}\n",
    mode: 'a')

  #  мы сравниваем ответ с правильным
  if (shuffle_answers[user_answer-1] == correct_answers.shift)
    true_answers += 1
    puts "и это ВЕРНО!!!"
    
    File.write(
      filename, 
      "ответ ВЕРНЫЙ\n",
      mode: 'a')
  else
    false_answers += 1
    puts "и это НЕВЕРНО!!!"

    File.write(
      filename, 
      "ответ НЕВЕРНЫЙ\nПРАВИЛЬНЫЙ ОТВЕТ: #{correct_answers.shift}\n",
      mode: 'a')
  end
end

File.write(
  filename, 
  "\n\n=== РЕЗУЛЬТАТЫ ===\n",
  mode: 'a')

File.write(
  filename, 
  "правильно #{true_answers} из #{true_answers + false_answers}\n",
  mode: 'a')

File.write(
  filename, 
  "ИТОГО #{((true_answers.to_f / all_questions.length.to_f) * 100).floor(2)}%",
  mode: 'a')