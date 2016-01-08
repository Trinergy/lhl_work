#checked
def char_count(list)
  letters = Hash.new(0)
  list.each do |word|
    word.split('').each { |letter| letters[letter] += 1 }
  end
  letters
end

test = ['apples', 'oranges', 'hipsters', 'are', 'same']



# Why the long face(error)? 
# 1. This should return count of each letter in the list

puts char_count(['apples', 'oranges', 'hipsters', 'are', 'same'])


# 2. What are the improvements you can do to above code?