#Sort the array from lowest to highest

def sort(arr)
  swapped = true
  n = arr.length
  if !arr.empty?
    #pass until can't swap anymore
    while swapped do
      swapped = false
      for i in 0..n-2
        if arr[i] > arr[i+1]

          arr[i], arr[i+1] = arr[i+1], arr[i]
          swapped = true
        end
      end
    end
  end
  arr
end

# Find the maximum 
def maximum(arr)
  sort(arr).last
end

def minimum(arr)
  sort(arr).first
end
 
# expect it to return 42 below
result = maximum([2, 42, 22, 02])
puts "max of 2, 42, 22, 02 is: #{result}"

# expect it to return 2 below
result = minimum([2, 42, 22, 02])
puts "min of 2, 42, 22, 02 is: #{result}"

 
# expect it to return nil when empty array is passed in
result = maximum([])
puts "max on empty set is: #{result.inspect}"
result = minimum([])
puts "min on empty set is: #{result.inspect}"
 
result = maximum([-23, 0, -3])
puts "max of -23, 0, -3 is: #{result}"
 
result = maximum([6])
puts "max of just 6 is: #{result}"

new_arr = [5,3,5,2,4,6,8]

def sort_old(arr)
  arr.sort
end

require 'benchmark'

puts Benchmark.measure {sort(new_arr)}
#0.000000   0.000000   0.000000 (  0.000015)
puts Benchmark.measure {sort_old(new_arr)}
#0.000000   0.000000   0.000000 (  0.000007)

