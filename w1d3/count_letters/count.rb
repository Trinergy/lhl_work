require 'pry'

def count_letters(str)
   counts = Hash.new(0)
   binding.pry
   splitted = str.split('')
   splitted.delete(" ")
   splitted.each {|letter| counts[letter] += 1}
   print counts
end

count_letters("Hello how are you")
