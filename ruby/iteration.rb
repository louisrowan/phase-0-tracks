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


-




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

numbers = [2, 27, 4, 11, 19]

def reject_num(numbers)
new_numbers = numbers.reject { |x| x < 5 }
p new_numbers
end

def select(numbers)
more_numbers = numbers.select { |x| x < 5 }
p more_numbers
end

def keep(numbers)
even_more_numbers = numbers.drop_while { |x| x <= 4 }
p even_more_numbers
end


def do_till_false(numbers)  
numbers.each do |x|
  while numbers.length > 3
    numbers.pop
  end
end
p numbers
end

reject_num(numbers)
select(numbers)
keep(numbers)
do_till_false(numbers) 
p numbers

def hash_select(groceries_hash)
new_hash = groceries_hash.select { |items,values| items != "milk"}
p new_hash
end

def hash_delete(groceries_hash)
another_hash = groceries_hash.delete_if {|items, values| items.length <= 7}
p another_hash
end


hash_select(groceries_hash)
hash_delete(groceries_hash)

groceries_hash = {
  "milk" => 2,
  "oranges" => 20,
  "cookies" => 30,
  "ice cream" => 1
  }


def hash_keep(groceries_hash)
new_hash = groceries_hash.keep_if {|items, values| items == "milk"}
p new_hash
end
  
hash_keep(groceries_hash)

groceries_hash = {
  "milk" => 2,
  "oranges" => 20,
  "cookies" => 30,
  "ice cream" => 1
  }

# def hash_remove(groceries_hash)
# # groceries_hash.each do |x,y|
  
#   i =  groceries_hash.length
#   groceries_hash.each do |x,y|
#   while i > 2
#     i = i - 1
#   end
#     puts "#{x} #{y}"
#   end


  
def hash_remove(groceries_hash)
groceries_hash.each do |x,y|
  while groceries_hash.length > 2
    puts "#{x} #{y}"
    groceries_hash.delete(x)
  end
end
end

hash_remove(groceries_hash)