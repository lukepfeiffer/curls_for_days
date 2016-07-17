class CreateSubscription < ActiveRecord::Migration[5.0]
  def change
    create_table :subscriptions do |t|
      t.integer :user_id
      t.integer :blogger_id
      t.timestamp
    end
  end
end
