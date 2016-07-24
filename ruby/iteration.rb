# Method that takes a block

def new_method
  x = 5
  y = 10
  puts "Hello"
  yield(x, y)
  puts "Goodbye"
end

new_method {|x, y| puts "#{x} + #{y} = #{x+y}"}


# Declare an Array and a Hash with some data

groceries = ["milk", "oranges", "cookies", "ice cream"]

groceries_hash = {
  "milk" => 2,
  "oranges" => 20,
  "cookies" => 30,
  "ice cream" => 1
  }

# Iterate through the items using .each and .map!

# p groceries -> ["milk", "oranges", "cookies", "ice cream"]

groceries.each do |item|
  item.capitalize
end
# p groceries -> ["milk", "oranges", "cookies", "ice cream"] (not modified)

groceries.map! do |item|
  item.upcase
end
# p groceries -> ["MILK", "ORANGES", "COOKIES", "ICE CREAM"] (modified)

# p groceries_hash -> {"milk"=>2, "oranges"=>20, "cookies"=>30, "ice cream"=>1}
groceries_hash.each do |item, amount|
  amount += 10
  "#{item} #{amount}"
end
# p groceries_hash -> {"milk"=>2, "oranges"=>20, "cookies"=>30, "ice cream"=>1} (not modified)

groceries_hash.map do |item, amount|
  amount += 10
  puts "#{item} #{amount}"
end
# p groceries_hash -> {"milk"=>2, "oranges"=>20, "cookies"=>30, "ice cream"=>1} (not modified)


# Create array of integers:

numbers = [2, 27, 4, 11, 19]

# Method 1: Iterations through array deleting any less than 5
def reject_num(numbers)
return numbers.reject { |x| x < 5 }
end
# p reject_num(numbers) -> [27, 11, 19]

# Method 2: Filters data structure for only items that are less than 5
def select(numbers)
return numbers.select { |x| x < 5 }
end
# p select(numbers) -> [2, 4]

# Method 3: Filters numbers satisfying a certain condition
def keep(numbers)
return numbers.drop_while { |x| x <= 4 }
end
# p keep(numbers) -> [27, 4, 11, 19]

# Method 4: Removes items until condition in block is false
def do_till_false(numbers)  
  numbers.each do |x|
    while numbers.length > 3
     numbers.pop
    end
  end
p numbers
end
# p do_till_false(numbers) -> [2, 27, 4]

# Hashes:

# Method 1: Iterates through items deleting any that do not meet certain condition
def hash_delete(groceries_hash)
return groceries_hash.delete_if {|items, values| items.length <= 7}
end
# p hash_delete(groceries_hash) -> {"ice cream"=>1}

# Method 2: Filters data for only items that satify a certain condition
def hash_select(groceries_hash)
return groceries_hash.select { |items,values| items != "milk"}
end
# p hash_select(groceries_hash) -> {"oranges"=>20, "cookies"=>30, "ice cream"=>1}

# Method 3: Also filters data keeping only items that satisfy the condition
def hash_keep(groceries_hash)
return groceries_hash.keep_if {|items, values| items == "milk"}
end
# p hash_keep(groceries_hash) -> {"milk"=>2}

# Method 4: Removes items until condition in block is false 
def hash_remove(groceries_hash)
groceries_hash.each do |x,y|
  while groceries_hash.length > 2
    groceries_hash.delete(x)
  end
end
return groceries_hash
end
# Can't figure this one out