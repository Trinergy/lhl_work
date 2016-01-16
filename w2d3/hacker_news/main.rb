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

#turn the url into a all-use variable, convert only once to save performance time
doc = Nokogiri::HTML(open(url))

#create the post
post = Post.new(doc, url)
#method will filter, format, then add comments to the Post
post.add_comments

puts "\nPost Title: '#{post.title}'\n".light_red
puts "#{post.comment_count}\n".light_black
post.show_comments


#Past Notes

# #<<<<<<<<<<<<   Maybe want to make these methods within its respective class
# #turn to accessile HTML document
# doc = Nokogiri::HTML(open(url))

# #removing the word "reply"
# # doc.search(".reply").remove
# #removing time on comment post / can add time later if using Time module for #add_comment
# # doc.search(".age").remove
# #don't always start at root, can look within the doc
# # doc.search('.default').each do |comment_box| 
# #c_b search comment, c_b search comhead, search reply remove
# #search within the doc!!! cut within the cut. avoid particular problems like extra work
# #potential mismatches

# #
# #extract comment_text from the HTML page
# # comment_text = doc.search(".comment").map {|comment| comment.inner_text}

# #extract user from the HTML page
# # users_text = doc.search(".comhead").map {|user| user.inner_text}.drop(1)

# #match user with comments and form array of each instance
# # user_comments = users_text.zip(comment_text).map{|comment| Comment.new(comment[0],comment[1])}

# #<<<<<<<<<<<<<<

# # create a post
# post = Post.new(doc, url)

# binding.pry

# puts post




#open url once, not twice, it will be slow (save time)
#Post should only take url
