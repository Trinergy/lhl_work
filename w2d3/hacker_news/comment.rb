# require 'open-uri'
# require 'nokogiri'
# require 'pry'


class Comment
  attr_reader :user, :text

  def initialize(user, text)
    @user = user
    @text = text
  end

end
