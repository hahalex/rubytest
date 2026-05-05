require 'yaml'

# вводим имя с клавиатуры
# puts "введите ваше имя:"
# user = gets.strip

# откуда-то взять вопросы и ответы
# YAML yet another markup language
all_questions = YAML.safe_load(File.read('questions.yaml'), symbolize_names: true)
correct_answer = []

# брать каждый вопрос о очереди и предлагать 4 вараинат ответа
all_questions.shuffle.each do |questions_data|
  
    # puts questions_data[:answers].first.inspect
    correct_answer << questions_data[:answers].first
    puts correct_answer.inspect

    puts "\n\n=== #{questions_data[:question]} ===\n"

    num = 1
    questions_data[:answers].shuffle.each do |answer|
      puts "#{num}. #{answer}"
      num += 1
    end

    puts correct_answer[(num-1)]
    user_answer = gets.strip
    if user_answer == correct_answer
      puts "правильно"
    else
      puts "выберите вараинт ответа от 1 до 4"
    end
  end


#  юзер ввдит ответ с клавиатуры

#  мы сравниваем ответ с правильным