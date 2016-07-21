groceries = ["milk", "oranges", "cookies", "ice cream"]

groceries_hash = {
  "milk" => 2,
  "oranges" => 20,
  "cookies" => 30,
  "ice cream" => 1
  }

groceries.each do |item|
  puts item
end

groceries.map! do |item|
  puts item.upcase
end

groceries_hash.each do |item, amount|
  puts "#{item} #{amount}"
end

groceries_hash.map do |item, amount|
  amount += 10
  puts "#{item} #{amount}"
end