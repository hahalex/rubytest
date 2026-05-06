require 'yaml'

# вводим имя с клавиатуры
# puts "введите ваше имя:"
# user = gets.strip

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
puts correct_answers.inspect

raw_questions.each do |questions_data|
  puts "\n\n=== #{questions_data[:question]} ===\n"

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

  user_answer = nil

  loop do
    user_answer = gets.strip.to_i
    if (1..4).include?(user_answer)
      break
    else
      puts "выберите вараинт ответа от 1 до 4"
    end
  end

  if (shuffle_answers[user_answer-1] == correct_answers.shift)
    puts "правильно"
  else
    puts "неправильно"
  end
end


#  юзер ввдит ответ с клавиатуры

#  мы сравниваем ответ с правильным