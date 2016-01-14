require_relative 'animals'



chimp = Chimpanzee.new("monkey")
squawk = Parrot.new("parrot")
blindy = Bat.new("bat")
jump = Frog.new("frog")

animals = [chimp, squawk, blindy, jump]


animals.each do |animal|
  puts animal.move(5)
end

puts chimp.warm_blooded

puts jump.warm_blooded

puts squawk.fly

puts blindy.fly

puts chimp