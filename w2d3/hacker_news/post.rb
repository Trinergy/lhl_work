# require 'open-uri'
# require 'nokogiri'
# require 'pry'

class Post
  attr_reader :title, :url, :points, :item_id, :comment_count, :comments

  def initialize(url, comments)
    page = Nokogiri::HTML(open(url))
    @title = page.search(".title > a").map {|title| title.inner_text}.join('')
    @url = url
    @points = page.search(".subtext > span:first-child").map{|span| span.inner_text}.join('')
    @item_id = /(\d+)/.match(url)[0]
    @comment_count = page.search(".subtext a:nth-child(6)").map {|a| a.inner_text}.join('')
    @comments = comments
  end

  def show_comments
    @comments.each do |comment| 
      puts comment.user
      puts comment.text
    end
  end

  def add_comment
  end

end