def word_test(word, longest)
  word.length >= longest.length
end

list = ["apples", "bananas", "cherries", "durian", "eggplant", "flibbertigibbit"]

longest_word = ""

list.each do |word|
 longest_word = word if word_test(word, longest_word)
end

puts longest_word