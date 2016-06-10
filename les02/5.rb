puts 'Введите день'
day = gets.to_i  # 29
puts 'Введите месяц'
month = gets.to_i  # 2
puts 'Введите год'
year = gets.to_i  # 2016

months = {1 => 31, 2 => 28, 3 => 31, 4 => 30, 5 => 31, 6 => 30, 7 =>31, 8 => 31, 9 => 30, 10 => 31, 11 => 30, 12 => 31}

if (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)
  months[2] = 29
end

if month < 1 || month > 12 || day > months[month] || day < 1
  puts 'Неверные входные данные'
  exit
end

i = 1
sum = 0
while i < month
  sum += months[i]
  i += 1
end
sum += day

puts sum