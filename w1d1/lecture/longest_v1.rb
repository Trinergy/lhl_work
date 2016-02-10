list = ["apples", "bananas", "cherries", "durian", "eggplant", "flibbertigibbit"]

longest_word = ""

list.each do |word|
  if word.length >= longest_word.length
    longest_word = word 
  end
end

puts longest_word