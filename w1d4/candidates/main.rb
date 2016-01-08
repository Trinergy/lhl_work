# This is the main entrypoint into the program
# It requires the other files/gems that it needs

require 'pry'
require './candidates'
require './filters'

## Your test code can go here


def find(id)
  find_id(id)
end

def all
  puts @candidates
end

def qualified
  x = qualified_candidates(@candidates)
  puts organize_candidates(x)
end




answer = ""



while answer != "quit"

  print "find 1: This will display candidate with id 1
all: This will print them all out to the screen (one per line)
qualified: This will print only qualified candidates, ordered by experience and points (one per line)\n"
  answer = gets.chomp

case answer
  when /^find/
    x = answer[/(\d{1,2})/].to_i
    puts find(x)
  when "all"
    all
  when "qualified"
    qualified
  else
    puts "another input please"
  end
end

# string = "find 5"

# x = string[/^find/]

# puts x

# puts x.is_a?(String)