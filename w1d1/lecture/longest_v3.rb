list = ["apples", "bananas", "cherries", "durian", "eggplant", "flibbertigibbit"]

puts list.sort{|a,b| b.length <=> a.length}[0]