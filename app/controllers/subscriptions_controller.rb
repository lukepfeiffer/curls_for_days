class SubscriptionsController < ApplicationController
  expose :subscription
  expose :subscriptions do
    current_user.subscriptions
  end
  expose :subscription_posts do
    blogger_list = []
    posts = []
    subscriptions.each do |subscription|
      blogger = User.find_by(id: subscription.blogger_id)
      blogger_list << blogger
    end
    blogger_list.each do |blogger|
      posts << blogger.blog_posts
    end
    posts.first.order('created_at ASC') if posts.present?
  end

  def latest_posts
  end

  def create_subscription
    sub = Subscription.create(user_id: params[:user_id], blogger_id: params[:blogger_id])
    if sub.save
      head :ok
    else
      head :no_content
    end
  end

  def destroy
    Subscription.find(params[:id]).destroy
    head :ok
  end

  def subscription_params
    params.require(:subscription).permit(
      :user_id,
      :blogger_id
    )
  end

end
