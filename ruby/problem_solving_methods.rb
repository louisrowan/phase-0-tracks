# Array Sort Method

arr = [42, 89, 23, 1]

def search_array(arr, x)
  index = 0
  arr.each do |number|
    if x == number
      return index
    end
  index += 1
  end
  return nil
end

p search_array(arr, 1)


# Fibonacci Method

def fib(x)
  arr = [0,1]
  while arr.length < x
    arr.push(arr[-1] + arr[-2])
  end
  p arr
  return arr
end

fib(100)

if (fib(100)[-1]) == 218922995834555169026
  puts true
end


# Sort Method
# Initialize a counter to monitor position within the array
# Start by comparing 1st and 2nd numbers in the array
# If the 2nd number is smaller, swap position
# Repeat array iteration until no changes need to be made
# Exit loop

def bubble_sort(arr)
 arr.length.times do
   index = 0
      while index < (arr.length-1)
        if arr[index] > arr[index+1]
           arr[index], arr[index+1] = arr[index+1], arr[index]
        end
    index += 1
    end    
  end    
  p arr
end


bubble_sort([2, 1, 4, 5, 3, 7, 0, 42, 1, 3, 8])