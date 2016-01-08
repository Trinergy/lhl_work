def merge_sort(arr)
  #n is array length
  n = arr.length
  mid = n / 2
  left_array = arr.slice(0, mid)
  right_array = arr.slice(mid, arr.length - mid)
  # print left_array
  print mid
  print left_array
  print right_array
end

test_array = [3,4,9,7,2,1,5]

print merge_sort(test_array)