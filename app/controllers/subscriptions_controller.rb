class SubscriptionsController < ApplicationController
  expose :subscription
  expose :subscriptions do
    current_user.subscriptions
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
