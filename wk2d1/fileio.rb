require 'rubygems'
require 'rest-client'

# wiki_url = "http://en.wikipedia.org/"
# wiki_local_filename = "wiki-page.html"

# File.open(wiki_local_filename, "w") { |file| file.write(RestClient.get(wiki_url))}

require 'open-uri'
url = "http://ruby.bastardsbook.com/files/fundamentals/hamlet.txt"

# File.open('hamlet.txt', "w") do |file|
#   file.write(RestClient.get(url))
# end

hamlet = File.open('hamlet.txt', 'r')

# hamlet.readlines.each_with_index do |line, index|
#   puts line if index % 42 == 0
# end


# hamlet_speaking = false
# hamlet.readlines.each do |line|
#   if line.match(/^\s{2}[A-Z]/)
#     hamlet_speaking = false
#   end

#   if line.match(/Ham\./) || hamlet_speaking 
#     puts line
#     hamlet_speaking = true
#   end
# end


Dir.glob('../**/*').sort_by{|fname| File.size(fname)}.reverse[0..9].each do |file|
  puts "#{file} #{File.size(file)}"
end
