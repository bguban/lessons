h = {}
('a'..'z').to_a.each_with_index do |sym, index|
  h[sym] = index + 1
end

res = h.select {|sym,num| 'aeiou'.include? sym }

puts res