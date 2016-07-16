class User < ApplicationRecord
  include Authem::User
  has_many :blog_posts

  def self.full_name(user)
    user.first_name + ' ' + user.last_name
  end

  def self.url_friendly(user)
    (user.first_name + ' ' + user.last_name).downcase.tr!(" ", "_")
  end

end
