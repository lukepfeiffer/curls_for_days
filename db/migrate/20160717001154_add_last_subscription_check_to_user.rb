class AddLastSubscriptionCheckToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :last_subscription_check, :datetime
  end
end
