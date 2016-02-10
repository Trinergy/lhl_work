class Contact < ActiveRecord::Base
  validates :nickname, presence: true

end