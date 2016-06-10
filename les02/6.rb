products = {}

loop do
  puts 'Введите название товара или "стоп"'
  name = gets.chomp
  break if name == 'стоп'
  
  puts 'Введите цену за единицу товара'
  amount = gets.to_f  # 5
  puts 'Введите количество купленного товара'
  price  = gets.to_f  # 8

  products[name] = {
    amount: amount,
    price: price 
  }
end

# Итоговая сумма за каждый товар
products.each do |product, data|
  puts "#{product} = #{data[:amount] * data[:price]}"
end

# Сумма всех покупок
sum = 0
products.each do |product, data|
  sum += data[:amount] * data[:price]
end


puts "Сумма всех покупок = #{sum}"
