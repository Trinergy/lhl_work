def count_letters(str)
   counts = Hash.new(0)
   splitted = str.split('')
   splitted.delete(" ")
   splitted.each {|letter| counts[letter] += 1}
   puts counts
end

count_letters("Hello how are you")


def count_indices(str)
   counts = Hash.new { |h, k| h[k] = [] }
   splitted = str.split('')
   splitted.each_with_index { |letter, index| counts[letter] << index}
   puts counts
end

count_indices("Hello how are you")