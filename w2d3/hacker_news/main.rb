require 'open-uri'
require 'nokogiri'
require 'pry'
require_relative 'post'
require_relative 'comment'
require 'colorize'


#ARGV input test
if ARGV.length == 1
  url = ARGV.first
else
  ARGV.clear
  puts "Please provide URL that you want to scrape: "
  url = gets.chomp
end


#turn to accessile HTML document
doc = Nokogiri::HTML(open(url))

#removing the word "reply"
doc.search(".reply").remove

#extract comment_text from the HTML page
comment_text = doc.search(".comment").map {|comment| comment.inner_text}

#extract user from the HTML page
users_text = doc.search(".comhead").map {|user| user.inner_text}

#match user with comments and form array of each instance
user_comments = users_text.zip(comment_text).map{|comment| Comment.new(comment[0],comment[1])}

# create a post
post = Post.new(url, user_comments)


puts "\nPost Title: '#{post.title}'\n".light_red
puts "#{post.comment_count}\n".light_black
post.show_comments
