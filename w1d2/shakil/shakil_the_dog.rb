# Save this file to your computer so you can run it 
# via the command line (Terminal) like so:
#   $ ruby shakil_the_dog.rb
#
# Your method should wait for user input, which corresponds
# to you saying something to your dog (named Shakil).
 
# You'll probably want to write other methods, but this 
# encapsulates the core dog logic


def shakil_the_dog(say)
  case say
  when "woof"
    puts "WOOF WOOF WOOF"
  when "shakil stop"
    puts "silence"
  when "Shakil STOP!"
    puts "silence"
  when "meow"
    puts "woof woof woof woof woof"
  when "treat"
    puts "silence"
  when "go away"
    puts "shakil left the room"
  else
    puts "woof"
  end
end

puts "what do you want to say to Shakil?"
answer = gets.chomp
shakil_the_dog(answer)

while answer != "go away"
  puts "what do you want to say to Shakil?"
  answer = gets.chomp
  shakil_the_dog(answer)
end

