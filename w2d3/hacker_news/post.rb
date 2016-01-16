class Post
  attr_reader :title, :url, :points, :item_id, :comments, :doc

  def initialize(doc, url = nil)
    @title = doc.search(".title > a").map {|title| title.inner_text}.join('')
    @url = url
    @points = doc.search(".subtext > span:first-child").map{|span| span.inner_text}.join('')
    @item_id = /(\d+)/.match(url)[0]
    @comments = []
    @doc = doc
  end


  def show_comments
    @comments.each do |comment|
      puts comment.user
      puts comment.text
    end
  end

  def comment_count
    @comments.size
  end


  def add_comments
    @doc.search('.reply').remove
    @doc.search('.default').each do |comment_box|
      user = comment_box.search('.comhead').text
      text = comment_box.search('.comment').text
      @comments << Comment.new(user, text)
    end
  end

end

#Past Notes

  # @comment_count = doc.search(".subtext a:nth-child(6)").map {|a| a.inner_text}.join('')
    #count your comments. better in method, not instance variable

  #match format of other comments. or change other comments' format
  #be more strict about the inputs for user data, sometimes
  # first element is not username

#give classes to work with, all should run in background
#main should be something someone else can rewrite or work with
