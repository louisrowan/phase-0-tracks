# Method to create a list
# input: array with grocery items
# steps: 
  # 1. create empty hash
  # 2. iterate through array and put each item into hash
  # 3. set default quantity to 1
  # print the list to the console [can you use one of your other methods here?]
# output: hash

# Method to add an item to a list
# input: grocery hash, item name, quantity
# steps: 
 # 1. assign the item as a key in the list, set the quantity as the value
# output: updated hash

# Method to remove an item from the list
# input: grocery hash, item to be removed
# steps:
 # 1. use hash delete method to remove the key
# output: updated hash

# Method to update the quantity of an item
# input: grocery hash, item, updated quantity
# steps:
# 1. reassign the updated quantity as the value of the item
# output: updated hash

# Method to print a list and make it look pretty
# input: grocery hash
# steps:
# 1. print out a title
# 2. iterate through the hash, printing each key/value pair on new line
# output: printing the grocery hash

def create_list(array_of_items)
  grocery_list = {}
  array_of_items.each do |item|
    grocery_list[item] = 1
  end
  return grocery_list
end

def add_item(grocery_list, item, quantity)
  grocery_list[item] = quantity.to_i
end

def remove_item(grocery_list, item)
  grocery_list.delete(item)
end

def update_quantity(grocery_list, item, quantity)
  add_item(grocery_list, item, quantity)
end

def print_list(grocery_list)
  puts "Grocery List:"
  grocery_list.each do |item, quantity|
    puts "#{quantity} #{item}"
  end
end

items = ["bananas", "oranges", "apples"] 
my_list = create_list(items) 
add_item(my_list, "strawberries", 300)
remove_item(my_list, "bananas")
update_quantity(my_list, "apples", 5)
print_list(my_list)

=begin
Reflection:

What did you learn about pseudocode from working on this challenge?
  I learned that pseudocoding can be helpful in making the problem easier
  to understand, writing the steps down in english can ease the transition
  into the actual code. 

What are the tradeoffs of using arrays and hashes for this challenge?
  I used a hash for this challenge which worked well, and made it really easy
  to add new items and quantities. Also updating quantities was easy and
  could be done on one line of code, I think it would take much more work to
  update if I had been using arrays.

What does a method return?
  Unless a return value is specified, a method returns the last line of code.

What kind of things can you pass into methods as arguments?
  Strings, arrays, hashes. Any sort of data structure.

How can you pass information between methods?
  Methods can be nested inside each other, like I did with the add_item and
  update_quantity methods,

What concepts were solidified in this challenge, and what concepts are still confusing?
  I definitely feel more comfortable with splitting up a big problem into
  multiple smaller methods now. Before I usually did all my code in one giant
  method, but I know it is considered better practice to split up different
  parts into separate methods, so that each method only accomplishes one main task.
  I also have a better understanding of the syntax of method parameters, before I was
  having trouble with them but my guide showed me how I was putting in an extra
  space when I shouldn't.
  None of the concepts from this challenge are still confusing me, I think I have
  a good understanding of everything done here. Maybe one general concept I could
  improve on is understanding local vs global variables, sometimes I am unsure of if 
  a method I am defining is global or not.

end