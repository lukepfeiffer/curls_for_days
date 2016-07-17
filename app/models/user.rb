class User < ApplicationRecord
  include Authem::User
  has_many :blog_posts
  has_many :subscriptions

  def self.full_name(user)
    user.first_name + ' ' + user.last_name
  end

  def self.url_friendly(user)
    (user.first_name + ' ' + user.last_name).downcase.tr!(" ", "_")
  end

  def self.subscribed?(user, blogger)
    if Subscription.where(user_id: user.id, blogger_id: blogger.id).present?
      true
    else
      false
    end
  end

end
