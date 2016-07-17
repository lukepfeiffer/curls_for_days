class AddTimestampToBlogPost < ActiveRecord::Migration[5.0]
  def change
    add_column :blog_posts, :created_at, :datetime
    add_column :blog_posts, :updated_at, :datetime
  end
end
