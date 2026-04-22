# l1
puts "Введите километры: "
ui_km = gets

puts "это string: #{ui_km.inspect}"
ui_km = ui_km.to_f
puts "это float: #{ui_km.inspect}"

res = ui_km * 0.621

puts "result : #{res} миль"