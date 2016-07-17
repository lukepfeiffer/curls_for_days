class ApplicationController < ActionController::Base
  before_action :set_notice
  protect_from_forgery with: :exception
  authem_for :user

  expose :subscriptions do
    current_user.subscriptions
  end
  expose :subscribed_to_bloggers do
    blogger_list = []
    subscriptions.each do |subscription|
      blogger = User.find_by(id: subscription.blogger_id)
      blogger_list << blogger
    end
    blogger_list
  end
  expose :subscription_posts do
    posts = []
    subscribed_to_bloggers.each do |blogger|
      posts << blogger.blog_posts.where("created_at > ?", current_user.last_subscription_check)
    end
    posts.first.order('created_at ASC') if posts.present?
  end


  def set_notice
    alert = params[:notice]

    if alert == ("successful_sign_up") || ("successful_sign_in") || ("successful_sign_out")
      @alert_class = "flash-success"
    end

    if alert == "unauthorized"
      @alert_class = "flash-error"
    end

    @alert_message = "Sign Up Successful" if alert == "successful_sign_up"
    @alert_message = "Sign In Successful" if alert == "successful_sign_in"
    @alert_message = "Signed Out" if alert == "successful_sign_out"
    @alert_message = "You are not authorized to access that" if alert == "unauthorized"
  end

end
